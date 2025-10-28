@echo off
echo ========================================
echo    Безопасное исправление ссылок
echo ========================================

echo Создаем резервную копию...
copy "out\index.html" "out\index.html.backup"

echo Исправляем ссылки в index.html...
powershell -Command "$content = Get-Content 'out\index.html' -Raw; $content = $content -replace 'href=\"/pricing/\"', 'href=\"./pricing/\"'; $content = $content -replace 'href=\"/auth/\"', 'href=\"./auth/\"'; Set-Content 'out\index.html' $content"

echo Проверяем размер файла...
dir "out\index.html"

echo Создаем архив...
powershell -Command "Compress-Archive -Path 'out\*' -DestinationPath 'civilx-links-fixed.zip' -Force"

echo ========================================
echo    Готово! Архив: civilx-links-fixed.zip
echo ========================================
pause





