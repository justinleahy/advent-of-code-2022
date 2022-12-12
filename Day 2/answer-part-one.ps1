$stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
$text = Get-Content ".\input.txt"
$Scores = @{A = 1; B = 2; C = 3; X = 1; Y = 2; Z = 3}
$MoveLosesTo = @{A = "Y"; B = "Z"; C = "X"; X = "B"; Y = "C"; Z = "A"}
$TotalScore = 0
$text | ForEach-Object {
    $CurrentRound = $_.Split(" ")
    $OpponentMove = $CurrentRound[0]
    $PlayerMove = $CurrentRound[1]

    $TotalScore += $Scores[$PlayerMove]

    # When Players Tie
    if($Scores[$OpponentMove] -eq $Scores[$PlayerMove]) {
        $TotalScore += 3
        Return
    }

    if($MoveLosesTo[$OpponentMove] -eq $PlayerMove) {
        $TotalScore += 6
    }
}

$TotalScore

$stopwatch.Stop()
$stopwatch.Elapsed