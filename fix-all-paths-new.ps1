# Исправление всех путей для FastPanel

Write-Host "Исправление путей для FastPanel..."

# Функция для исправления файла
function Fix-File {
    param($filePath, $isSubPage = $false)
    
    if (Test-Path $filePath) {
        $content = Get-Content $filePath -Raw -Encoding UTF8
        
        # Исправляем CSS и JS пути
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
        
        # Сохраняем с правильной кодировкой
        Set-Content $filePath $content -Encoding UTF8 -NoNewline
        Write-Host "Исправлен: $filePath"
    } else {
        Write-Host "Файл не найден: $filePath"
    }
}

# Исправляем все файлы
Write-Host "Исправление главной страницы..."
Fix-File "out\index.html" $false

Write-Host "Исправление подстраниц..."
Fix-File "out\pricing\index.html" $true
Fix-File "out\auth\index.html" $true
Fix-File "out\dashboard\index.html" $true
Fix-File "out\contacts\index.html" $true

Write-Host "Все файлы исправлены!"
Write-Host "Создание архива..."

# Создаем архив
Compress-Archive -Path "out\*" -DestinationPath "civilx-working-new.zip" -Force

Write-Host "Готово! Архив: civilx-working-new.zip"
Write-Host "Размер архива:"
Get-Item "civilx-working-new.zip" | Select-Object Name, Length





