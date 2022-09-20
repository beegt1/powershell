$arrayInput = @()
do {
$input = (Read-Host "Please enter the Array Value")
if ($input -ne '') {$arrayInput += $input}
}
#Loop will stop when user enter 'END' as input
until ($input -eq 'end')

$users =@($arrayInput);
Compare-Object -ReferenceObject (Get-AdPrincipalGroupMembership @user1 | select name | sort-object -Property name) -DifferenceObject (Get-AdPrincipalGroupMembership @user2| select name | sort-object -Property name) -property name -passthru