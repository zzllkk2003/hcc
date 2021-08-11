Class WS.DE.DE041011100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "体格检查";

Parameter Description = "溃疡标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE041011100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041011100State</State>
<StreamLocation>^WS.DE.DE041011100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
