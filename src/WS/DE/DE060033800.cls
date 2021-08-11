/// 收回手术安全核对表
Class WS.DE.DE060033800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "收回手术安全核对表";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Type>%Storage.Serial</Type>
}

}
