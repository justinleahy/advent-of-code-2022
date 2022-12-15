$Stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
$Text = Get-Content ".\input.txt"
$Stacks = @(New-Object -TypeName "System.Collections.Stack"; New-Object -TypeName "System.Collections.Stack"; New-Object -TypeName "System.Collections.Stack";
            New-Object -TypeName "System.Collections.Stack"; New-Object -TypeName "System.Collections.Stack"; New-Object -TypeName "System.Collections.Stack";
            New-Object -TypeName "System.Collections.Stack"; New-Object -TypeName "System.Collections.Stack"; New-Object -TypeName "System.Collections.Stack")

for($InnerIndex = 7; $InnerIndex -ge 0; $InnerIndex--) {
    $CurrentLine = $Text[$InnerIndex]
    $StackIndex = 0
    for($OuterIndex = 1; $OuterIndex -lt $CurrentLine.Length; $OuterIndex+=4) {
        if($CurrentLine[$OuterIndex] -ne " ") {
            $Stacks[$StackIndex].Push($CurrentLine[$OuterIndex])
        }
        $StackIndex++
    }
}

for($InnerIndex = 10; $InnerIndex -lt $Text.Length; $InnerIndex++) {
    $CurrentLine = $Text[$InnerIndex].Split(" ")
    $NumberToMove = $CurrentLine[1]
    $FromStack = $CurrentLine[3] - 1
    $ToStack = $CurrentLine[5] - 1

    for($OuterIndex = 0; $OuterIndex -lt $NumberToMove; $OuterIndex++) {
        $CurrentCrate = $Stacks[$FromStack].Pop()
        $Stacks[$ToStack].Push($CurrentCrate)
    }
}

$String = ""

for($StackIndex = 0; $StackIndex -lt $Stacks.Length; $StackIndex++) {
    $TopOfStack = $Stacks[$StackIndex].Pop()
    Write-Output($TopOfStack + " is at the top of stack " + ($StackIndex + 1))
    $String += $TopOfStack
}

$String

$Stopwatch.Stop()
$Stopwatch.Elapsed