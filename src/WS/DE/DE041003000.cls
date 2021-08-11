Class WS.DE.DE041003000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "体格检查";

Parameter Description = "发热标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE041003000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041003000State</State>
<StreamLocation>^WS.DE.DE041003000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
