# Larapack

## IMPORTANT!!!
> If you clone this repository to make a new project, REMEMBER to change your git remote origin to new repository.

This is a package that grouped all necessary packages in Laravel and Backpack. Quick steps to install all you needs and start focusing on the websites!

### Main packages:
- [x] Laravel
- [x] Backpack for Laravel

### Add-ons in Backpack:
- [x] Backpack CRUD
- [x] Page Manager
- [x] Translation Manager
- [x] Role/Permission Manager
- [x] Backup Manager
- [x] Log Manager
- [x] Setting Manager

### Basic users and settings:

- [x] Seeded webmaster, admin and user roles (Added in .env)

### Front-end Language:

- [x] SASS
- [x] Pug (Jade)
- [x] Typescript

## Getting started

> Please make sure you have installed `composer`, `npm` and `mysql`.

1. Copy `.env.example` file to make a `.env` file. Fill in neccessary information inside.
2. Run `mysql -u <USER> -p -e "CREATE DATABASE <DATABASE_NAME_IN_DOT_ENV_FILE>"` to create database.
3. Run following commands in your terminal.

       composer install
       php artisan migrate
       php artisan db:seed
       php artisan key:generate
       php artisan vendor:publish
       npm install
       composer dumpautoload

## Run your server in local

`php artisan serve`

## Development

Please run `php artisan serve` first. As `browserSync` has installed, please open another terminal and run `npm run watch`.
Any changes on html/css/js files will affect `browserSync` to reload your webpages.

> NOTE: Please browse the website through `localhost:3000` instead of `localhost:8000`.

## Debug and console

`php artisan tinker`

## Future implementation

Nothing yet.
