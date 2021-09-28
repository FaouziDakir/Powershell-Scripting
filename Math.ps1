$number = Read-Host "Enter your number"
$length = $number.tostring().length

if ($length -gt 10){

    echo 'Sorry maximum length is 10'

} else {

    $sum = 0
    $number -split '' | ? {$_} | % { 
        $each = [int]$_; 
        echo "$sum <- $each";
        $sum += $each } 
    echo "Total sum is $sum"

}


#Not completed advanced mode
function advancedLevel($number) {
    $tab = New-Object System.Collections.Generic.List[System.Object]

    $sum = 0
    $number -split '' | ? {$_} | % { $tab.Add([int]$_); $sum += [int]$_ } 

    for ($i = 0; $i -lt $length ; $i++)
    {
        echo $tab[$i]
    }

}
