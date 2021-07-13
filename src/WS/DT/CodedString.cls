/// 卫生数据类型
/// 用于表达所有通过字典约束的类型
Class WS.DT.CodedString [ ClassType = datatype, ClientDataType = VARCHAR, Language = objectscript, OdbcType = VARCHAR, SqlCategory = STRING ]
{

Parameter ValueSet;

ClassMethod IsValid(%val) As %Status
{
    Quit:(..#ValueSet="") $$$ERROR($$$GeneralError,"unassigned valueset")
    
    Set tSC=$$$OK
    Set tValueGlobal= "^WS.VS."_$Replace(..#ValueSet,".","")
    //Set:($D(@tValueGlobal@(%val))#2 = 0) tSC=$$$ERROR($$$GeneralError,"数据元类型约束错误:不在值域范围")
    Set:($D(@tValueGlobal@(%val))#2 = 0) tSC=$$$ERROR($$$GeneralError,"Not in value set in:"_tValueGlobal)
    Quit tSC
}

}
