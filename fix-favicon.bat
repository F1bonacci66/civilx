@echo off
echo ========================================
echo    Исправление пути к favicon
echo ========================================

echo Исправляем путь к favicon в index.html...

powershell -Command "$content = Get-Content 'out\index.html' -Raw; $content = $content -replace 'href=`\"/taskflow.app/favicon.ico`\"', 'href=`\"./favicon.ico`\"'; Set-Content 'out\index.html' $content"

echo Готово! Создаем архив...

powershell -Command "Compress-Archive -Path 'out\*' -DestinationPath 'civilx-favicon-fixed.zip' -Force"

echo ========================================
echo    Архив создан: civilx-favicon-fixed.zip
echo ========================================
echo.
echo Загрузите этот архив в файловый менеджер
echo и замените старые файлы!
echo.
pause





