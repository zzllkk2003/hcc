/// 家属是否同意尸体解剖标志
Class WS.DE.DE090011500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "家属是否同意尸体解剖标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Type>%Storage.Serial</Type>
}

}
