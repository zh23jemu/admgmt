$ouArray = 
    "OU=Resigned Users,OU=Users,OU=Resources,OU=BTSE,OU=Baotou,OU=China,OU=APAC,DC=uidtest,DC=local",
    "OU=Resigned Users,OU=Users,OU=Resources,OU=BTSE,OU=Baotou,OU=China,OU=APAC,DC=uidtest,DC=local",
    "OU=Resigned Users,OU=Users,OU=Resources,OU=CSAS,OU=Changshu,OU=China,OU=APAC,DC=uidtest,DC=local",
    "OU=Resigned Users,OU=Users,OU=Resources,OU=CSSM,OU=Changshu,OU=China,OU=APAC,DC=uidtest,DC=local",
    "OU=Resigned Users,OU=Users,OU=Resources,OU=CSTG,OU=Changshu,OU=China,OU=APAC,DC=uidtest,DC=local",
    "OU=Resigned Users,OU=Users,OU=Resources,OU=CSTL,OU=Changshu,OU=China,OU=APAC,DC=uidtest,DC=local",
    "OU=Resigned Users,OU=Users,OU=Resources,OU=JXSE,OU=Jiaxing,OU=China,OU=APAC,DC=uidtest,DC=local",
    "OU=Resigned Users,OU=Users,OU=Resources,OU=JXST,OU=Jiaxing,OU=China,OU=APAC,DC=uidtest,DC=local",
    "OU=Resigned Users,OU=Users,OU=Resources,OU=LYPT,OU=Luoyang,OU=China,OU=APAC,DC=uidtest,DC=local",
    "OU=Resigned Users,OU=Users,OU=Resources,OU=LYSP,OU=Luoyang,OU=China,OU=APAC,DC=uidtest,DC=local",
    "OU=Resigned Users,OU=Users,OU=Resources,OU=SZCC,OU=Suzhou,OU=China,OU=APAC,DC=uidtest,DC=local",
    "OU=Resigned Users,OU=Users,OU=Resources,OU=SZED,OU=Suzhou,OU=China,OU=APAC,DC=uidtest,DC=local",
    "OU=Resigned Users,OU=Users,OU=Resources,OU=SZES,OU=Suzhou,OU=China,OU=APAC,DC=uidtest,DC=local",
    "OU=Resigned Users,OU=Users,OU=Resources,OU=SZIV,OU=Suzhou,OU=China,OU=APAC,DC=uidtest,DC=local",
    "OU=Resigned Users,OU=Users,OU=Resources,OU=SZSE,OU=Suzhou,OU=China,OU=APAC,DC=uidtest,DC=local",
    "OU=Resigned Users,OU=Users,OU=Resources,OU=SZSM,OU=Suzhou,OU=China,OU=APAC,DC=uidtest,DC=local",
    "OU=Resigned Users,OU=Users,OU=Resources,OU=SZST,OU=Suzhou,OU=China,OU=APAC,DC=uidtest,DC=local",
    "OU=Resigned Users,OU=Users,OU=Resources,OU=THSM,OU=Chonburi,OU=Thailand,OU=APAC,DC=uidtest,DC=local",
    "OU=Resigned Users,OU=Users,OU=Resources,OU=VNSM,OU=HaiPhong,OU=Vietnam,OU=APAC,DC=uidtest,DC=local",
    "OU=Resigned Users,OU=Users,OU=Resources,OU=YCDF,OU=Yancheng,OU=China,OU=APAC,DC=uidtest,DC=local",
    "OU=Resigned Users,OU=Users,OU=Resources,OU=YCSE,OU=Yancheng,OU=China,OU=APAC,DC=uidtest,DC=local",
    "OU=Resigned Users,OU=Users,OU=Resources,OU=YCSM,OU=Yancheng,OU=China,OU=APAC,DC=uidtest,DC=local"

foreach ($ou in $ouArray)
{
    $dn = ""
    $seperateOU = $ou.Split(",")
    $len = $seperateOU.Length

    for ($i = 0; $i -lt $len ; $i++)
    {   
        $dn = $seperateOU[$len-$i-1]+","+$dn
    

        if ($dn.Contains("OU"))
        {
            $ouName = $dn.Split(",")[0].Replace("OU=","")
            $parentPath = $dn.Replace($dn.Split(",")[0],"").TrimStart(",").TrimEnd(",")
            #$ouName + "/" + $parentPath

            try
            {
                New-ADOrganizationalUnit -Name $ouName -Path $parentPath
                "OU=" + $ouName + "," + $parentPath + " created successfully."
            }
            catch [Exception]
            {
                #$Error[0]
            }
        }
     }
}
