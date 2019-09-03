#!/bin/bash
RED_COLOR='\033[0;31m'
GREEN_COLOR='\033[0;32m'
NO_COLOR='\033[0m'
BOLD_GREEN_COLOR='\033[1;32m'
sql_command=""

is_program_installed () {
  output=$($1 2>&1)
  if [[ ! $output =~ "command not found" ]]; then
    echo "true";
  else
    echo "false";
  fi
}

checkProgramsInstalled() {
  echo -e "${GREEN_COLOR}Check if programs exist...${NO_COLOR}"

  is_npm_installed=$(is_program_installed "npm -v")
  is_mysql_installed=$(is_program_installed "mysql -V")
  is_php_installed=$(is_program_installed "php -v")
  is_composer_installed=$(is_program_installed "composer -v")

  if [[ $is_npm_installed = "false" ]]; then
    echo -e "${RED_COLOR}WARNING: Please install npm before you start this script.${NO_COLOR}"
  fi
  if [[ $is_mysql_installed = "false" ]]; then
    echo -e "${RED_COLOR}WARNING: Please install mysql before you start this script.${NO_COLOR}"
  fi
  if [[ $is_php_installed = "false" ]]; then
    echo -e "${RED_COLOR}WARNING: Please install php before you start this script.${NO_COLOR}"
  fi
  if [[ $is_composer_installed = "false" ]]; then
    echo -e "${RED_COLOR}WARNING: Please install composer before you start this script.${NO_COLOR}"
  fi

  if [[ "${is_npm_installed}${is_mysql_installed}${is_php_installed}${is_composer_installed}" =~ "false" ]]; then
    echo -e "${RED_COLOR}Force quit.${NO_COLOR}"
    exit 1
  fi

  echo -e "${GREEN_COLOR}All necessary programs are installed. Proceed to next step.${NO_COLOR}"
}

getEnvInformation() {
  project_directory=$(pwd)

  if [[ ! -f "${project_directory}/.env" ]]; then
    echo -e "${GREEN_COLOR}.env file is not yet created. Copy from .env.example ...";
    cp "$project_directory/.env.example" "$project_directory/.env"
  fi

  echo -e "${GREEN_COLOR}Start filling env information: ${NO_COLOR}"

  read -p "Enter Application name: " app_name;
  sed -i "" "/APP_NAME=/ s/[^=]*$/${app_name}/" "$project_directory/.env"
  read -p "Enter Database name: " database_name;
  sed -i "" "/DB_DATABASE=/ s/[^=]*$/${database_name}/" "$project_directory/.env"
  read -sp "Enter mysql username: " mysql_username; echo;
  sed -i "" "/DB_USERNAME=/ s/[^=]*$/${mysql_username}/" "$project_directory/.env"
  read -sp "Enter mysql password: " mysql_password; echo;
  sed -i "" "/DB_PASSWORD=/ s/[^=]*$/${mysql_password}/" "$project_directory/.env"
  read -p "Enter webmaster name: " webmaster_name;
  sed -i "" "/WEBMASTER_NAME=/ s/[^=]*$/${webmaster_name}/" "$project_directory/.env"
  read -p "Enter webmaster email: " webmaster_email;
  sed -i "" "/WEBMASTER_EMAIL=/ s/[^=]*$/${webmaster_email}/" "$project_directory/.env"
  read -sp "Enter webmaster password: " webmaster_password; echo;
  sed -i "" "/WEBMASTER_PASSWORD=/ s/[^=]*$/${webmaster_password}/" "$project_directory/.env"

  echo -e "${GREEN_COLOR}Environment information have filled in.${NO_COLOR}"

  sql_command="mysql -u ${mysql_username} --password=${mysql_password} -e 'CREATE DATABASE ${database_name}'"
}

createDatabase() {
  echo -e "${GREEN_COLOR}Trying to create database in mysql...${NO_COLOR}"
  eval $sql_command
  if [ $? -eq 0 ]; then
    echo -e "${GREEN_COLOR}Database is created.${NO_COLOR}"
  else
    echo -e "${RED_COLOR}Something wrong when creating database. Maybe a wrong mysql user information? Aborting..."
    exit 1
  fi
}

larapackMigration() {
  echo -e "${GREEN_COLOR}Start installing composer packages and do migration...${NO_COLOR}"
  composer install
  php artisan migrate
  php artisan db:seed
  php artisan key:generate

  echo -e "${GREEN_COLOR}Success, run ${BOLD_GREEN_COLOR}php artisan serve ${GREEN_COLOR} and ${BOLD_GREEN_COLOR}npm run watch ${GREEN_COLOR}to start your development.${NO_COLOR}"
}

checkProgramsInstalled
getEnvInformation
createDatabase
larapackMigration
