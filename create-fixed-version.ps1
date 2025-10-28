# Создание полностью исправленной версии для FastPanel

Write-Host "Создание исправленной версии для FastPanel..."

# Функция для исправления путей
function Fix-Paths {
    param($filePath, $isSubPage = $false)
    
    $content = Get-Content $filePath -Raw -Encoding UTF8
    
    # Исправляем CSS и JS пути
    $content = $content -replace 'href="/_next/', 'href="./_next/'
    $content = $content -replace 'src="/_next/', 'src="./_next/'
    
    # Исправляем favicon
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
    
    Set-Content $filePath $content -Encoding UTF8
    Write-Host "Исправлен: $filePath"
}

# Исправляем главную страницу
Fix-Paths "out\index.html" $false

# Исправляем подстраницы
Fix-Paths "out\pricing\index.html" $true
Fix-Paths "out\auth\index.html" $true
Fix-Paths "out\dashboard\index.html" $true
Fix-Paths "out\contacts\index.html" $true

Write-Host "Все файлы исправлены!"
Write-Host "Создание архива..."

# Создаем архив
Compress-Archive -Path "out\*" -DestinationPath "civilx-fastpanel-ready.zip" -Force

Write-Host "Готово! Архив: civilx-fastpanel-ready.zip"





