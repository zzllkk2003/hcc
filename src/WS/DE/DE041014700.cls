Class WS.DE.DE041014700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Parameter Category = "体格检查";

Parameter Description = "脐带脱落时间(d)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE041014700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041014700State</State>
<StreamLocation>^WS.DE.DE041014700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
