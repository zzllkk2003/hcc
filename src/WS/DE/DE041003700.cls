Class WS.DE.DE041003700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "浮肿标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE041003700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041003700State</State>
<StreamLocation>^WS.DE.DE041003700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}