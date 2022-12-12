$stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
$text = Get-Content '.\input.txt'
[int[]]$elfWeights = @()
[int]$elfWeight = 0
$text | ForEach-Object {
    if($_ -eq "") {
        $elfWeights += $elfWeight
        $elfWeight = 0
    } else {
        $elfWeight += [int]$_
    }
}
[int[]]$sortedElfWeights = $elfWeights | Sort-Object
Write-Output("The elf with the most weight has " + $sortedElfWeights[$sortedElfWeights.Length - 1] + " calories")
[int]$TopThreeElfWeight = $sortedElfWeights[$sortedElfWeights.Length - 1] + $sortedElfWeights[$sortedElfWeights.Length - 2] + $sortedElfWeights[$sortedElfWeights.Length - 3]
Write-Output("The top three elves have a combined weight of " + $TopThreeElfWeight + " calories")
$stopwatch.Stop()
$stopwatch.Elapsed