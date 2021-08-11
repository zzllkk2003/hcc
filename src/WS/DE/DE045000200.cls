Class WS.DE.DE045000200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 9999, MINVAL = 0);

Parameter Category = "实验室检查";

Parameter Description = "CD4+检测结果(个/uL)";

Parameter Format = "N..4";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE045000200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045000200State</State>
<StreamLocation>^WS.DE.DE045000200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
