using namespace System.Management.Automation
using namespace System.Management.Automation.Language

if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
}

Import-Module -Name Terminal-Icons
oh-my-posh init pwsh --config E:\Git\Oh-My-Posh-Theme\elmegaard.omp.json | Invoke-Expression

# Setup PSReadline
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete # Make tab completion work like bash
Set-PSReadlineOption -BellStyle None # Disable annoying beep on error

# Enable prediction when typing use right arrow to complete
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView # Change to InlineView for only one suggestion but less intrusive
Set-PSReadLineOption -EditMode Windows

# Custom aliases
Set-Alias ex explorer.exe

# Custom functions
function New-Link ($from, $to) {
    New-Item -Path $to -ItemType SymbolicLink -Value $from
}