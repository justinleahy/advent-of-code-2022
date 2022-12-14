$Stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
$Text = Get-Content ".\input.txt"

function CreateElfBitString() {
    <#
    .SYNOPSIS
        Creates a string of 1s and 0s with 1s signifying that the elf is cleaning that section
    .NOTES
        Author: Justin Leahy
    #>
    param (
        [int]$StartingIndex,
        [int]$EndingIndex
    )

    $BitString = @(0) * 100

    for ($index = $StartingIndex; $index -le $EndingIndex; $index++) {
        $BitString[$index] = 1
    }

    return $BitString
}

$TotalOverlaps = 0

$Text | ForEach-Object {
    $ElfPair = $_.Split(",")
    [int[]]$FirstElfSections = $ElfPair[0].Split("-")
    [int[]]$SecondElfSections = $ElfPair[1].Split("-")

    $FirstElfBitString = CreateElfBitString $FirstElfSections[0] $FirstElfSections[1]
    $SecondElfBitString = CreateElfBitString $SecondElfSections[0] $SecondElfSections[1]

    for($index = 0; $index -lt $FirstElfBitString.Length; $index++) {
        if($FirstElfBitString[$index] -eq 1 -and $SecondElfBitString[$index] -eq 1) {
            $TotalOverlaps++;
            Break
        }
    }
}

$TotalOverlaps

$Stopwatch.Stop()
$Stopwatch.Elapsed