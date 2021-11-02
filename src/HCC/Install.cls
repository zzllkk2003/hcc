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
    Do ##class(%Studio.Project).InstallFromFile(pPath_"HCCV1Dep.xml")
    Do $system.OBJ.Load(pPath_"HCCV1.xml","ck")
    Do $system.OBJ.Load(pPath_"HCCV1_export.gof")
    Do $system.OBJ.Load(pPath_"isc_irishealth_mgr_HCC_LookupTable.gof")
    Do $system.OBJ.Load(pPath_"isc_irishealth_mgr_HCC_PubSUb.gof")
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
