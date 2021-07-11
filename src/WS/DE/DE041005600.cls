Class WS.DE.DE041005600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "肝区叩痛标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE041005600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041005600State</State>
<StreamLocation>^WS.DE.DE041005600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
