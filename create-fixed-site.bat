@echo off
echo Создание исправленной версии сайта...

REM Создаем исправленный index.html
echo ^<!DOCTYPE html^> > out\index.html
echo ^<html lang="ru"^> >> out\index.html
echo ^<head^> >> out\index.html
echo ^<meta charset="UTF-8"^> >> out\index.html
echo ^<meta name="viewport" content="width=device-width, initial-scale=1"^> >> out\index.html
echo ^<title^>CivilX - Цифровизация строительной отрасли^</title^> >> out\index.html
echo ^<link rel="stylesheet" href="./_next/static/css/71c347af9a6ef361.css"^> >> out\index.html
echo ^<link rel="icon" href="./favicon.ico"^> >> out\index.html
echo ^</head^> >> out\index.html
echo ^<body^> >> out\index.html
echo ^<div class="min-h-screen bg-black text-white"^> >> out\index.html
echo ^<header class="fixed top-0 left-0 right-0 z-50 bg-black/80 backdrop-blur-md border-b border-gray-800"^> >> out\index.html
echo ^<div class="w-full px-4 sm:px-6 lg:px-8"^> >> out\index.html
echo ^<div class="flex items-center justify-between h-16"^> >> out\index.html
echo ^<a class="flex items-center" href="./"^> >> out\index.html
echo ^<div class="flex items-center gap-2"^> >> out\index.html
echo ^<span class="font-bold text-white text-2xl"^>CIVIL^</span^> >> out\index.html
echo ^</div^> >> out\index.html
echo ^</a^> >> out\index.html
echo ^<nav class="hidden md:flex items-center justify-center flex-1"^> >> out\index.html
echo ^<div class="flex items-center space-x-8"^> >> out\index.html
echo ^<a class="text-white hover:text-primary-400 transition-colors duration-200 font-medium text-lg rounded-md hover:bg-white/10" href="./"^>О нас^</a^> >> out\index.html
echo ^<a class="text-white hover:text-primary-400 transition-colors duration-200 font-medium text-lg rounded-md hover:bg-white/10" href="./pricing/"^>Продукт^</a^> >> out\index.html
echo ^</div^> >> out\index.html
echo ^</nav^> >> out\index.html
echo ^<div class="flex items-center space-x-4"^> >> out\index.html
echo ^<a class="p-3 text-white hover:text-primary-400 transition-colors duration-200 hover:bg-white/10 rounded-lg" href="./auth/"^>Войти^</a^> >> out\index.html
echo ^</div^> >> out\index.html
echo ^</div^> >> out\index.html
echo ^</div^> >> out\index.html
echo ^</header^> >> out\index.html
echo ^<section style="padding-top:5rem;padding-bottom:0.5rem"^> >> out\index.html
echo ^<div class="w-full text-center px-4 sm:px-6 lg:px-8"^> >> out\index.html
echo ^<h1 class="font-bold mb-6 animate-fade-in" style="font-size:4rem"^>Цифровизация^<span class="block text-primary-400"^>строительной отрасли^</span^>^</h1^> >> out\index.html
echo ^<p class="text-gray-300 mb-8 animate-slide-up" style="font-size:1.5rem"^>Современные инструменты для управления строительными проектами. Эффективность, прозрачность и контроль на каждом этапе.^</p^> >> out\index.html
echo ^<div class="grid place-items-center"^> >> out\index.html
echo ^<a class="bg-primary-500 hover:bg-primary-600 text-black font-semibold rounded-lg transition-colors duration-200 animate-slide-up" style="padding:1rem 2rem" href="./pricing/"^>Перейти к продукту^</a^> >> out\index.html
echo ^</div^> >> out\index.html
echo ^</div^> >> out\index.html
echo ^</section^> >> out\index.html
echo ^<footer class="border-t border-gray-800" style="padding:3rem"^> >> out\index.html
echo ^<div class="w-full text-center px-4 sm:px-6 lg:px-8"^> >> out\index.html
echo ^<p class="text-gray-400" style="font-size:1rem"^>© 2024 CivilX. Все права защищены.^</p^> >> out\index.html
echo ^</div^> >> out\index.html
echo ^</footer^> >> out\index.html
echo ^</div^> >> out\index.html
echo ^<script src="./_next/static/chunks/webpack-a26f520ee94677a9.js"^>^</script^> >> out\index.html
echo ^</body^> >> out\index.html
echo ^</html^> >> out\index.html

echo Создание архива...
powershell -Command "Compress-Archive -Path 'out\*' -DestinationPath 'civilx-fixed-final.zip' -Force"

echo Готово! Архив: civilx-fixed-final.zip
pause





