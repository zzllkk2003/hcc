Class WS.DE.DE051014400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Date(FORMAT = 8);

Parameter Category = "医学评估";

Parameter Description = "评估时间日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Storage Default
{
<Data name="DE051014400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051014400State</State>
<StreamLocation>^WS.DE.DE051014400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}