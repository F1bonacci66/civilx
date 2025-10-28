# Исправление кодировки и путей для FastPanel

Write-Host "Исправление кодировки и путей..."

# Функция для исправления файла
function Fix-File {
    param($filePath, $isSubPage = $false)
    
    # Читаем файл с правильной кодировкой
    $content = Get-Content $filePath -Raw -Encoding UTF8
    
    # Исправляем пути к ресурсам
    $content = $content -replace 'href="/_next/', 'href="./_next/'
    $content = $content -replace 'src="/_next/', 'src="./_next/'
    $content = $content -replace 'href="/favicon.ico"', 'href="./favicon.ico"'
    
    if ($isSubPage) {
        # Для подстраниц исправляем навигацию
        $content = $content -replace 'href="/"', 'href="./../"'
        $content = $content -replace 'href="/pricing/"', 'href="./../pricing/"'
        $content = $content -replace 'href="/auth/"', 'href="./../auth/"'
        $content = $content -replace 'href="/dashboard/"', 'href="./../dashboard/"'
        $content = $content -replace 'href="/contacts/"', 'href="./../contacts/"'
    } else {
        # Для главной страницы
        $content = $content -replace 'href="/pricing/"', 'href="./pricing/"'
        $content = $content -replace 'href="/auth/"', 'href="./auth/"'
        $content = $content -replace 'href="/dashboard/"', 'href="./dashboard/"'
        $content = $content -replace 'href="/contacts/"', 'href="./contacts/"'
    }
    
    # Сохраняем с правильной кодировкой UTF-8
    Set-Content $filePath $content -Encoding UTF8 -NoNewline
    Write-Host "Исправлен: $filePath"
}

# Исправляем все файлы
Fix-File "out\index.html" $false
Fix-File "out\pricing\index.html" $true
Fix-File "out\auth\index.html" $true
Fix-File "out\dashboard\index.html" $true
Fix-File "out\contacts\index.html" $true

Write-Host "Все файлы исправлены!"
Write-Host "Создание архива..."

# Создаем архив
Compress-Archive -Path "out\*" -DestinationPath "civilx-fixed-encoding.zip" -Force

Write-Host "Готово! Архив: civilx-fixed-encoding.zip"





