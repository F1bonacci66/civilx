@echo off
echo ========================================
echo    ИСПРАВЛЕНИЕ ВСЕХ ПУТЕЙ ДЛЯ FASTPANEL
echo ========================================

echo Создаем резервные копии...
copy "out\index.html" "out\index.html.backup2"
copy "out\pricing\index.html" "out\pricing\index.html.backup2"
copy "out\auth\index.html" "out\auth\index.html.backup2"

echo Исправляем главную страницу...
powershell -Command "$content = Get-Content 'out\index.html' -Raw; $content = $content -replace 'href=\"/_next/', 'href=\"./_next/'; $content = $content -replace 'src=\"/_next/', 'src=\"./_next/'; $content = $content -replace 'href=\"/pricing/\"', 'href=\"./pricing/\"'; $content = $content -replace 'href=\"/auth/\"', 'href=\"./auth/\"'; $content = $content -replace 'href=\"/favicon.ico\"', 'href=\"./favicon.ico\"'; Set-Content 'out\index.html' $content"

echo Исправляем страницу pricing...
powershell -Command "$content = Get-Content 'out\pricing\index.html' -Raw; $content = $content -replace 'href=\"/_next/', 'href=\"./_next/'; $content = $content -replace 'src=\"/_next/', 'src=\"./_next/'; $content = $content -replace 'href=\"/\"', 'href=\"./../\"'; $content = $content -replace 'href=\"/pricing/\"', 'href=\"./../pricing/\"'; $content = $content -replace 'href=\"/auth/\"', 'href=\"./../auth/\"'; $content = $content -replace 'href=\"/favicon.ico\"', 'href=\"./../favicon.ico\"'; Set-Content 'out\pricing\index.html' $content"

echo Исправляем страницу auth...
powershell -Command "$content = Get-Content 'out\auth\index.html' -Raw; $content = $content -replace 'href=\"/_next/', 'href=\"./_next/'; $content = $content -replace 'src=\"/_next/', 'src=\"./_next/'; $content = $content -replace 'href=\"/\"', 'href=\"./../\"'; $content = $content -replace 'href=\"/pricing/\"', 'href=\"./../pricing/\"'; $content = $content -replace 'href=\"/auth/\"', 'href=\"./../auth/\"'; $content = $content -replace 'href=\"/favicon.ico\"', 'href=\"./../favicon.ico\"'; Set-Content 'out\auth\index.html' $content"

echo Проверяем размеры файлов...
dir "out\index.html"
dir "out\pricing\index.html"
dir "out\auth\index.html"

echo Создаем финальный архив...
powershell -Command "Compress-Archive -Path 'out\*' -DestinationPath 'civilx-fastpanel-ready.zip' -Force"

echo ========================================
echo    ГОТОВО! Архив: civilx-fastpanel-ready.zip
echo ========================================
echo.
echo Все пути исправлены для работы на FastPanel!
echo Загрузите этот архив в файловый менеджер.
echo.
pause





