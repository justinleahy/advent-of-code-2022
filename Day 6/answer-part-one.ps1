$Stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
$Text = Get-Content ".\input.txt"

function HasNoDuplicates {
    param (
        $String
    )

    $TempCharacters = $String.ToCharArray()
    
    for($InnerIndex = 0; $InnerIndex -lt $TempCharacters.Length; $InnerIndex++) {
        for($OuterIndex = $InnerIndex + 1; $OuterIndex -lt $TempCharacters.Length; $OuterIndex++) {
            if($TempCharacters[$InnerIndex] -eq $TempCharacters[$OuterIndex]) {
                return $false
            }
        }
    }

    return $true
}

for($StringIndex = 3; $StringIndex -lt $Text.Length; $StringIndex++) {
    $Characters = $Text.Substring($StringIndex - 3, 4)

    if(HasNoDuplicates $Characters) {
        Write-Output("No duplicates found " + $Characters)
        Break
    } else {
        Write-Output("Duplicates found in " + $Characters)
    }
}

Write-Output([String]($StringIndex + 1) + " characters need to be processed.")

$Stopwatch.Stop()
$Stopwatch.Elapsed