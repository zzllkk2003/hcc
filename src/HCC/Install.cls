/// 
/// Author: Jeff Liu
/// Date: 2021-09-27 13:36:33
/// LastEditTime: 2021-11-02 14:53:23
/// LastEditors: Jeff Liu
/// Description: 
/// FilePath: /hcc/src/HCC/Install.cls
/// Jeff.liu@intersytems.com
/// 
Class HCC.Install Extends %RegisteredObject [ Language = objectscript ]
{

// pPath为安装文件路径

ClassMethod Run(pPath)
{
    Do ##class(%Studio.Project).InstallFromFile(pPath_"HCC_Deployed_Classes.xml")
    Do $system.OBJ.Load(pPath_"HCC_Exported_Classes.xml","ck")
    Do $system.OBJ.Load(pPath_"HCC_GLB.xml")
    Do $system.OBJ.Load(pPath_"LookupTable_GLB.xml")
    Do $system.OBJ.Load(pPath_"PubSub_GLB.xml")
     Do $system.OBJ.Load(pPath_"WS_GLB.xml")
}

/// 导出zpm使用的 global xml格式
ClassMethod GlobalExport(pPath As %String) As %Status
{
   do $System.OBJ.Export("WS*.GBL",pPath_"WS.xml")

   do $System.OBJ.Export("HCC.GBL",pPath_"HCC.xml")

   do $System.OBJ.Export("EnsLib.PubSub*.GBL",pPath_"PubSub.xml")

   do $System.OBJ.Export("Ens.LookupTable.GBL",pPath_"LookupTable.xml")
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
