$Stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
$Text = Get-Content ".\input.txt"

for($Index = 0; $Index -lt $Text.Length; $Index++) {
    $CurrentCommand = $Text[$Index].Split(" ")
    if($CurrentCommand[1].Equals("ls")) {
        for($Index = $Index; $Index -lt $Text.Length; $Index++) {
            
        }
    }
}

$Stopwatch.Stop()
$Stopwatch.Elapsed