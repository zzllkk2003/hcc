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

}
