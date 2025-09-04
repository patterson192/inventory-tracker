# Edwards Industrial Webpage - Safe Startup Script
# This script prevents agent freezing when starting your project

Write-Host "🚀 Starting Edwards Industrial Webpage safely..." -ForegroundColor Cyan

# Check if package.json exists and install dependencies if needed
if (Test-Path "package.json") {
    Write-Host "📦 Installing dependencies safely..." -ForegroundColor Green
    npm install --yes --no-audit
    Write-Host "✅ Dependencies installed successfully!" -ForegroundColor Green
} else {
    Write-Host "⚠️  No package.json found. Creating basic one..." -ForegroundColor Yellow
    
    # Create a basic package.json for your project
    $packageJson = @{
        name = "edwards-industrial-webpage"
        version = "1.0.0"
        description = "Edwards Industrial Webpage"
        main = "server.js"
        scripts = @{
            start = "node server.js"
            dev = "node server.js"
        }
        dependencies = @{}
    } | ConvertTo-Json -Depth 10
    
    $packageJson | Out-File -FilePath "package.json" -Encoding UTF8
    Write-Host "✅ Created package.json" -ForegroundColor Green
}

# Start the server safely in background
Write-Host "🌐 Starting server safely..." -ForegroundColor Green
Start-Process -FilePath "node" -ArgumentList "server.js" -WindowStyle Hidden

Write-Host "✅ Server started in background!" -ForegroundColor Green
Write-Host "🌍 Your webpage should be available at: http://localhost:3000" -ForegroundColor Cyan
Write-Host "📋 Check Task Manager for the Node.js process" -ForegroundColor Yellow

# Show available safe commands
Write-Host "`n🔧 Available Safe Commands:" -ForegroundColor Magenta
Write-Host "  gpl  - Safe git pull (no freezing)" -ForegroundColor White
Write-Host "  gps  - Safe git push (no freezing)" -ForegroundColor White
Write-Host "  ni   - Safe npm install (no freezing)" -ForegroundColor White
Write-Host "  ns   - Safe npm start (no freezing)" -ForegroundColor White
Write-Host "  gst  - Safe git status (no freezing)" -ForegroundColor White

Write-Host "`n🎯 No more agent freezing on terminal commands!" -ForegroundColor Green
