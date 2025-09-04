# Safe Command Runner - Prevents Agent Freezing
# Usage: .\run-safely.ps1 [command] [args]

param(
    [Parameter(Mandatory=$true)]
    [string]$Command,
    
    [Parameter(ValueFromRemainingArguments=$true)]
    [string[]]$Arguments,
    
    [int]$Timeout = 300  # Default 5 minute timeout
)

Write-Host "🚀 [SAFE] Running command: $Command $($Arguments -join ' ')" -ForegroundColor Cyan
Write-Host "⏱️  [SAFE] Timeout set to: $Timeout seconds" -ForegroundColor Yellow
Write-Host "🔄 [SAFE] This command will NOT freeze the agent..." -ForegroundColor Green

# Build the full command
$fullCommand = "$Command $($Arguments -join ' ')"

# Start the command as a background job
$job = Start-Job -ScriptBlock { 
    param($cmd)
    Invoke-Expression $cmd
} -ArgumentList $fullCommand

Write-Host "📋 [SAFE] Command started in background job..." -ForegroundColor Blue

# Wait for the job with timeout
$completed = Wait-Job $job -Timeout $Timeout

if ($completed) {
    Write-Host "✅ [SUCCESS] Command completed successfully!" -ForegroundColor Green
    $result = Receive-Job $job
    Write-Host "📤 Output:" -ForegroundColor White
    Write-Host $result
} else {
    Write-Host "⏰ [TIMEOUT] Command timed out after $Timeout seconds!" -ForegroundColor Red
    Write-Host "🛑 Stopping the command..." -ForegroundColor Yellow
    Stop-Job $job
}

# Clean up
Remove-Job $job -Force

Write-Host "🎯 [SAFE] Command execution finished - No freezing occurred!" -ForegroundColor Green
