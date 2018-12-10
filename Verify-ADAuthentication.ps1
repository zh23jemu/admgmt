$col = @()
$aduser = get-aduser -Filter * -Properties lockedout,passwordneverexpires
#$aduser = get-aduser -Filter {samaccountname -like "billy*"} -Properties lockedout,passwordneverexpires
$adusercount = $aduser.count

$count=0
foreach ($item in $aduser)
{
    $sam = $item.samaccountname
    $enabled = $item.Enabled
    $pwdneverexp = $item.passwordneverexpires
    $verify = $false
    if ((new-object directoryservices.directoryentry "",$sam,"Aden@123").psbase.name -ne $null)
    {
        $verify = $true
    }
    $props = [PSCustomObject][Ordered]@{sam=$sam; enabled=$enabled; pwdNeverExp=$pwdneverexp; simplePwd=$verify}
    $col += $props
    $sam +"`t"+ ++$count + "/" + $adusercount    
}
$col | Export-Csv -Path d:\aduserverification.csv -NoTypeInformation