$Stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
$Text = Get-Content ".\input.txt"

$LettersLowercase = "abcdefghijklmnopqrstuvwxyz"
$LettersUppercase = $LettersLowercase.ToUpper()
# Required to be a System.Collections.Hashtable for case-sensitive key values
$Priority = New-Object System.Collections.Hashtable

# Create Priority Dictionary with all lowercase and uppercase letters
for ($index = 0; $index -lt $LettersLowercase.Length; $index++) {
    $Priority[$LettersLowercase[$index]] = ($index + 1)
    $Priority[$LettersUppercase[$index]] = ($index + 27)
}

$PrioritySum = 0

for ($OuterIndex = 0; $OuterIndex -lt $text.Length; $OuterIndex+=3) {
    $FirstElfKnapsack = $Text[$OuterIndex]
    $SecondElfKnapsack = $Text[$OuterIndex + 1]
    $ThirdElfKnapsack = $Text[$OuterIndex + 2]

    for ($InnerIndex = 0; $InnerIndex -lt $FirstElfKnapsack.Length; $InnerIndex++) {
        if($SecondElfKnapsack.Contains($FirstElfKnapsack[$InnerIndex]) -and $ThirdElfKnapsack.Contains($FirstElfKnapsack[$InnerIndex])) {
            $PrioritySum += $Priority[$FirstElfKnapsack[$InnerIndex]]
            Break
        }
    }
}

$PrioritySum