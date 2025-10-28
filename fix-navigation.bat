@echo off
echo ========================================
echo    Исправление навигации
echo ========================================

echo Исправляем пути в index.html...

powershell -Command "$content = Get-Content 'out\index.html' -Raw; $content = $content -replace 'href=\"/pricing/\"', 'href=\"./pricing/\"'; $content = $content -replace 'href=\"/auth/\"', 'href=\"./auth/\"'; $content = $content -replace 'href=\"/dashboard/\"', 'href=\"./dashboard/\"'; $content = $content -replace 'href=\"/contacts/\"', 'href=\"./contacts/\"'; Set-Content 'out\index.html' $content"

echo Исправляем пути в pricing/index.html...

powershell -Command "$content = Get-Content 'out\pricing\index.html' -Raw; $content = $content -replace 'href=\"/\"', 'href=\"./../\"'; $content = $content -replace 'href=\"/auth/\"', 'href=\"./../auth/\"'; $content = $content -replace 'href=\"/dashboard/\"', 'href=\"./../dashboard/\"'; $content = $content -replace 'href=\"/contacts/\"', 'href=\"./../contacts/\"'; Set-Content 'out\pricing\index.html' $content"

echo Исправляем пути в auth/index.html...

powershell -Command "$content = Get-Content 'out\auth\index.html' -Raw; $content = $content -replace 'href=\"/\"', 'href=\"./../\"'; $content = $content -replace 'href=\"/pricing/\"', 'href=\"./../pricing/\"'; $content = $content -replace 'href=\"/dashboard/\"', 'href=\"./../dashboard/\"'; $content = $content -replace 'href=\"/contacts/\"', 'href=\"./../contacts/\"'; Set-Content 'out\auth\index.html' $content"

echo Готово! Создаем архив...

powershell -Command "Compress-Archive -Path 'out\*' -DestinationPath 'civilx-navigation-fixed.zip' -Force"

echo ========================================
echo    Архив создан: civilx-navigation-fixed.zip
echo ========================================
echo.
echo Загрузите этот архив в файловый менеджер
echo и замените старые файлы!
echo.
pause





