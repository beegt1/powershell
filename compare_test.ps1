$arrayInput = @()
do {
$input = (Read-Host "Please enter the Array Value")
if ($input -eq 'end'){

}
else {
if ($input -ne '') {$arrayInput += $input}
}
}
#Loop will stop when user enter 'END' as input
until ($input -match 'end')

$users =@($arrayInput);
$groups =@();


foreach ($user in $users) {
	$usergroups = get-adprincipalgroupmembership $user
	$groups = $groups + $usergroups.name;
}

$groups | group-object | where {$_.count -eq $users.count} | sort name | select name 
