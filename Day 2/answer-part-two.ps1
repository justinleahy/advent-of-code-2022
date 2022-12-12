$stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
$Scores = @{A = 1; B = 2; C = 3}
$MoveLosesTo = @{A = "B"; B = "C"; C = "A"}
$MoveWinsTo = @{A = "C"; B = "A"; C = "B"}

function Get-PlayerMove() {
    <#
    .SYNOPSIS
        Returns the player move that results in the desired outcome.
    .NOTES
        Author: Justin Leahy
    #>
    # Lose
    param (
        [String]$DesiredOutcome,
        [String]$OtherMove
    )
    if($DesiredOutcome -eq "X") {
        return $MoveWinsTo[$OtherMove]
    }

    if($DesiredOutcome -eq "Y") {
        return $OtherMove
    }

    if($DesiredOutcome -eq "Z") {
        return $MoveLosesTo[$OtherMove]
    }
}

$text = Get-Content ".\input.txt"
$TotalScore = 0
$text | ForEach-Object {
    $CurrentRound = $_.Split(" ")
    $OpponentMove = $CurrentRound[0]
    $PlayerMove = Get-PlayerMove $CurrentRound[1] $OpponentMove

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