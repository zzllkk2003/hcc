Class WS.DE.DE045001300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Parameter Category = "实验室检查";

Parameter Description = "白蛋白浓度(g/L)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE045001300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045001300State</State>
<StreamLocation>^WS.DE.DE045001300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
