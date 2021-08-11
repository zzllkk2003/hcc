Class WS.DE.DE041015600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "体格检查";

Parameter Description = "鞘膜积液压痛试验标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE041015600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041015600State</State>
<StreamLocation>^WS.DE.DE041015600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
