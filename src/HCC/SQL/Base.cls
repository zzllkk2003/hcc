/// 
/// Author: Jeff Liu
/// Date: 2021-10-29 15:14:47
/// LastEditTime: 2021-11-29 16:46:03
/// LastEditors: Jeff Liu
/// Description: 
/// FilePath: /hcc/Users/jiliu/Library/Caches/com.lemonmojo.RoyalTSX.App/LMFileTransferConnection/3538fa5b-6d01-4952-a049-ac116199c617/L2lzYy9oY2MtbWFpbi9zcmMvSENDL1NRTA==/Base.cls
/// Jeff.liu@intersytems.com
/// 
/// SQL文档基类
Class HCC.SQL.Base Extends %RegisteredObject [ DependsOn = HIP.DataGov.Util ]
{

/// 设置对象的Modified标志
/// 模版方法
Method SetModified() As %Status [ CodeMode = objectgenerator, ForceGenerate ]
{
   // 不处理基类
    Quit:%classname="HCC.SQL.Base" $$$OK
    // 不处理以下属性
    Do %code.WriteLine(" Set tSC=1")
    Do %code.WriteLine(" Try ")
    Do %code.WriteLine(" { ")
    Do %code.WriteLine("    Do $system.CLS.SetModified(##this, 1)")
    For n=1:1:%compiledclass.Properties.Count()
    {
        Set tPropDef = %compiledclass.Properties.GetAt(n)
        
        //不处理计算属性、多维属性 
        Set tNotProcess = tPropDef.Calculated||(tPropDef.MultiDimensional)||((tPropDef.Transient)&&(tPropDef.Cardinality=""))||($E(tPropDef.Name,1,2)="%%")
        Continue:(tNotProcess)
        
        Set tPropType = tPropDef.Type,tClassType=""
        
        Set tClassType = ##class(HIP.DataGov.Util).GetClassType(tPropType)
        If tClassType="serial"
        {
            Do %code.WriteLine("    do .."_tPropDef.Name_".SetModified()")
        }
    }
    Do %code.WriteLine("    Return tSC")
    Do %code.WriteLine(" }")
    Do %code.WriteLine(" catch e")
    Do %code.WriteLine(" {")
    Do %code.WriteLine("    Set tSC = $$$ERROR(e.Code,e.Data)")
    Do %code.WriteLine(" }")
    Do %code.WriteLine(" Quit tSC")
  
    Quit $$$OK
}

}
