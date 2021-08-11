Class WS.DE.DE041008300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "体格检查";

Parameter Description = "患肢锻炼标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE041008300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041008300State</State>
<StreamLocation>^WS.DE.DE041008300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
