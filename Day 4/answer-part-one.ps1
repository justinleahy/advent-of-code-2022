$Stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
$Text = Get-Content ".\input.txt"

$TotalOverlappedElves = 0

$Text | ForEach-Object {
    $ElfPair = $_.Split(",")
    [int[]]$FirstElfSections = $ElfPair[0].Split("-")
    [int[]]$SecondElfSections = $ElfPair[1].Split("-")

    if($FirstElfSections[0] -le $SecondElfSections[0] -and $FirstElfSections[1] -ge $SecondElfSections[1]) {
        $TotalOverlappedElves++
        Write-Output("There is overlap between " + $ElfPair[0] + " : " + $ElfPair[1])
    }
    if($SecondElfSections[0] -ge $FirstElfSections[0] -and $SecondElfSections[1] -le $FirstElfSections[1]) {
        $TotalOverlappedElves++
        Write-Output("There is overlap between " + $ElfPair[0] + " : " + $ElfPair[1])
    }
}

$TotalOverlappedElves

$Stopwatch.Stop()
$Stopwatch.Elapsed