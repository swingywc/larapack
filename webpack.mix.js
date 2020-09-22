const mix = require('laravel-mix');
mix.pug = require('laravel-mix-pug');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.react('resources/js/app.js', 'public/js')
    .sass('resources/sass/app.scss', 'public/css')
    .pug('resources/pug/**/*.pug', '', {
      replacePath: ['resources/pug', 'resources/views'],
      ext: '.blade.php'
    })
    .browserSync({proxy: 'localhost:8000'});
