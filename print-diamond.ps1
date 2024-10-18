<# https://codingdojo.org/kata/Diamond/

Given a letter, print a diamond starting with ‘A’ with the supplied letter at the widest point.

For example: print-diamond ‘C’ prints

  A
 B B
C   C
 B B
  A

#>

<#

Solution: Run the script on a Windows OS, it will default to a "C" diamond in white.  To specifiy another letter, run the script with your letter 
    choice and an optional colour choice (case-insensitive):

    print-diamond.ps1 r red

#>

param($letter = "c", $colour = "White")

$alphabet = "a", "b", "c","d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"
$availablecolours = "Black", "DarkBlue", "DarkGreen", "DarkCyan", "DarkRed", "DarkMagenta", "DarkYellow", "Gray", "DarkGray", "Blue", "Green", "Cyan", "Red", "Magenta", "Yellow", "White"

if($letter -notin $alphabet) {
    
    Write-Host "Please pick a letter from the Latin Alphabet!"
    exit
}

if($colour -notin $availablecolours){

    Write-Host "Please pick a colour from $availablecolours"
    exit
}

$choice = $letter.ToLower()

$ordinalindex = [array]::IndexOf($alphabet, $choice)
$initialleadspace = $ordinalindex # just makes things clearer for the reader
$alphabetindex = 0 # this ensures whatever the choice the diamnond starts at "a"

if($choice -eq "a") {
    
    Write-Host "a".ToUpper() -ForegroundColor $colour

} else {

    # create the top of the diamond
    for($line = 0;  $line -le $ordinalindex;  $line++){

        if($alphabet[$alphabetindex] -eq "a") { # the tip of the diamond doesn't need midspace

            Write-Host $(" " * ($initialleadspace - 1))$($alphabet[$alphabetindex].ToUpper()) -ForegroundColor $colour

            $initialleadspace --
            $alphabetindex ++

        } else {

            $midspace = ($alphabetindex * 2 ) -1

            write-host "$(" " * $initialleadspace)$($alphabet[$alphabetindex].ToUpper())$(" " * $midspace)$($alphabet[$alphabetindex].ToUpper())" -ForegroundColor $colour

            $initialleadspace --
            $alphabetindex ++
        }
    }

    # create the bottom of the diamond
    if($alphabet[$alphabetindex] -ne "a") {

        $initialleadspace = 1
        $alphabetindex =  $ordinalindex -1 

        for($line = 0;  $line -le $ordinalindex -1;  $line++){

            if ($alphabet[$alphabetindex] -eq "a") { # the bottom tip of the diamond also doesn't need mid space

                Write-Host $(" " * ($initialleadspace - 1))$($alphabet[$alphabetindex].ToUpper()) -ForegroundColor $colour

                $initialleadspace ++
                $alphabetindex --

            } else {

                $midspace = ($alphabetindex * 2 ) -1

                write-host "$(" " * $initialleadspace)$($alphabet[$alphabetindex].ToUpper())$(" " * $midspace)$($alphabet[$alphabetindex].ToUpper())" -ForegroundColor $colour

                $initialleadspace ++
                $alphabetindex --
            }
        }
    }
}