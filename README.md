# Larapack

## IMPORTANT!!!
> If you clone this repository to make a new project, REMEMBER to change your git remote origin to new repository.

This is a package that grouped all necessary packages in Laravel and Backpack. Quick steps to install all you needs and start focusing on the websites!

### Main packages:
- [x] Laravel
- [x] Backpack for Laravel

### Add-ons in Backpack:
- [x] Backpack CRUD
- [x] Menu CRUD
- [x] File Manager
- [x] Backup Manager
- [x] Log Manager
- [x] Permission Manager

### Basic users and settings:

- [] Seeded webmaster, admin and user roles
- [] Basic permissions for website

### Front-end Language:

- [] SASS
- [] Jade
- [] Typescript

## Getting started

> Please make sure you have installed `composer`, `npm` and `mysql`.

1. Copy `.env.example` file to make a `.env` file. Fill in neccessary information inside.

    ```
      APP_NAME, DB_DATABASE, DB_USERNAME, DB_PASSWORD, BACKPACK_ADMIN_NAME, BACKPACK_ADMIN_EMAIL, BACKPACK_ADMIN_PASSWORD
    ```
2. Run `mysql -u <USER> -p -e "CREATE DATABASE <DATABASE_NAME_IN_DOT_ENV_FILE>"` to create database.
3. Run `php artisan migrate` in your terminal.
4. Run `php artisan db:seed` to create users, roles and permissions to your database.
5. Run `php artisan key:generate` to generate key for your application.
6. Run `npm install --save` to get gulp functions work.

## Run your server in local

`php artisan serve`

## Debug and console

`php artisan tinker`

## Future implementation

Nothing yet.
