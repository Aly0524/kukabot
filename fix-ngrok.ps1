# Quick fix script for ngrok URL
# Usage: .\fix-ngrok.ps1 "your-ngrok-url"

param(
    [Parameter(Mandatory=$true)]
    [string]$NgrokUrl
)

$envFile = "c:\xampp\htdocs\kukabot\.env"

# Read the .env file
$content = Get-Content $envFile

# Replace APP_URL
$newContent = $content -replace 'APP_URL=.*', "APP_URL=$NgrokUrl"

# Write back to file
$newContent | Set-Content $envFile

Write-Host "✓ Updated APP_URL to: $NgrokUrl" -ForegroundColor Green

# Clear config cache
Set-Location "c:\xampp\htdocs\kukabot"
php artisan config:clear

Write-Host "✓ Config cache cleared" -ForegroundColor Green
Write-Host ""
Write-Host "Done! Refresh your browser now." -ForegroundColor Cyan
