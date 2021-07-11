Class WS.DE.DE045014000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "检查日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Property Value As %Date(FORMAT = 8);

Storage Default
{
<Data name="DE045014000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045014000State</State>
<StreamLocation>^WS.DE.DE045014000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
