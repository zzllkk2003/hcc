Class WS.DE.DE041008400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "患肢抬高标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE041008400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041008400State</State>
<StreamLocation>^WS.DE.DE041008400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
