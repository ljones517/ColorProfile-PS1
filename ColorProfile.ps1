$colors = [enum]::GetValues([System.ConsoleColor])
Foreach ($bgcolor in $colors){
    Foreach ($fgcolor in $colors) { Write-Host "$fgcolor|"  -ForegroundColor $fgcolor -BackgroundColor $bgcolor -NoNewLine }
    Write-Host " on $bgcolor"
}
#! Can use -ForegroundColor for text color! Or -BackgroundColor for highlight