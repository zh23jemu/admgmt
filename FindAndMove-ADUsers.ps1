$notinad = Get-Content D:\notinadd.txt

$notinad | ogv

foreach ($item in $notinad)
{
    $sam = ($item -split "@")[0]
    
    try
    {
        $aduser = get-aduser $sam -ErrorAction stop
        Move-ADObject -Identity $aduser.DistinguishedName -TargetPath "OU=CADENA,OU=ADEN-Users,DC=CHOADEN,DC=COM"
    }
    catch [exception]
    {
        #"no such user: " + $sam
    }

}


get-aduser -SearchBase "OU=CADENA,OU=ADEN-Users,DC=CHOADEN,DC=COM" -Filter * | Export-Excel -Path "d:\cadena.xlsx" -AutoSize
get-aduser phan.lien