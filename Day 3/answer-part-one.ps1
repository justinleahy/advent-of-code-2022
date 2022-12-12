$stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
$text = Get-Content ".\input.txt"

$LettersLowercase = "abcdefghijklmnopqrstuvwxyz"
$LettersUppercase = $LettersLowercase.ToUpper()
# Required to be a System.Collections.Hashtable for case-sensitive key values
$Priority = New-Object System.Collections.Hashtable

# Create Priority Dictionary with all lowercase and uppercase letters
for ($index = 0; $index -lt $chars.Length; $index++) {
    $priority[$LettersLowercase[$index]] = ($index + 1)
    $priority[$LettersUppercase[$index]] = ($index + 27)
}

$PrioritySum = 0

for ($OuterIndex = 0; $OuterIndex -lt $text.Length; $OuterIndex++) {
    $CurrentKnapsack = ($text[$OuterIndex].Substring(0, ($text[$OuterIndex].Length) / 2), $text[$OuterIndex].Substring(($text[$OuterIndex].Length) / 2))

    for ($InnerIndex = 0; $InnerIndex -lt $CurrentKnapsack[0].Length; $InnerIndex++) {
        # -ccontains is -contains with case-sensitivty
        if($CurrentKnapsack[1].Contains($CurrentKnapsack[0][$InnerIndex])) {
            $PrioritySum += $Priority[$CurrentKnapsack[0][$InnerIndex]]
            Write-Output($CurrentKnapsack[0][$InnerIndex] + " is within both compartments in knapsack " + $OuterIndex + " : priority of " + $Priority[$CurrentKnapsack[0][$InnerIndex]])
            Break
        }
    }
}

$PrioritySum
$stopwatch.Stop()
$stopwatch.Elapsed