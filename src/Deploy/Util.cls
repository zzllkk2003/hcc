Class Deploy.Util Extends %RegisteredObject
{

ClassMethod make(path) As %Status
{
	set p=##class(%Studio.Project).%New()
    do p.AddItem("WS.DE.Tools.cls")
    do p.AddItem("HIP.DataGov.Util.cls")
    do p.AddItem("HCC.Util.cls")
    set tsc= p.DeployToFile(path_"HCC_Deployed_Classes.xml",,1)
    w tsc
    set Pdefault= ##class(%Studio.Project).%OpenId("HCCExport") 
    set tsc= Pdefault.Export(path_"HCC_Exported_Classes.xml")
    w tsc
    set Mdefault= ##class(%Studio.Project).%OpenId("HCCInstaller") 
    set tsc= Mdefault.Export(path_"HCC_Installer.xml")
    w tsc
    set tsc= ..GlobalExport(path)
    
    w tsc
    
    quit tsc
}

/// 导出zpm使用的 global xml格式
ClassMethod GlobalExport(pPath As %String) As %Status
{
   do $System.OBJ.Export("WS*.GBL",pPath_"WS_GLB.xml")

   do $System.OBJ.Export("HCC.GBL",pPath_"HCC_GLB.xml")

   do $System.OBJ.Export("EnsLib.PubSub*.GBL",pPath_"PubSub_GLB.xml")

   do $System.OBJ.Export("Ens.LookupTable.GBL",pPath_"LookupTable_GLB.xml")
   
   quit $$$OK
}

/// deploy mode after zpm compile
ClassMethod Deploy() As %Status
{
    Set sc = $$$OK
    d $system.OBJ.MakeClassDeployed("WS.DE.Tools")
    d $system.OBJ.MakeClassDeployed("HIP.DataGov.Util")
    d $system.OBJ.MakeClassDeployed("HCC.Util")
    Return sc
}

}
