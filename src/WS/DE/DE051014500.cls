Class WS.DE.DE051014500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "医学评估";

Parameter Description = "脐带异常情况标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE051014500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051014500State</State>
<StreamLocation>^WS.DE.DE051014500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
