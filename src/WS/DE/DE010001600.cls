Class WS.DE.DE010001600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "标识";

Parameter Description = "参加麻醉安全保险标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE010001600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE010001600State</State>
<StreamLocation>^WS.DE.DE010001600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
