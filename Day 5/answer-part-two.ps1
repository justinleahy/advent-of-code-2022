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

    $CraneCrates = New-Object "System.Collections.Stack"

    for($OuterIndex = 0; $OuterIndex -lt $NumberToMove; $OuterIndex++) {
        $CraneCrates.Push($Stacks[$FromStack].Pop())
    }

    for($OuterIndex = 0; $OuterIndex -lt $NumberToMove; $OuterIndex++) {
        $Stacks[$ToStack].Push($CraneCrates.Pop())
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