Class WS.DE.DE045013800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "实验室检查";

Parameter Description = "存脐带血情况标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE045013800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045013800State</State>
<StreamLocation>^WS.DE.DE045013800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
