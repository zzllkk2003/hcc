Class WS.DE.DE041017700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "睡眠时长（min）";

Parameter Format = "N..4";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 9999, MINVAL = 0);

Storage Default
{
<Data name="DE041017700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041017700State</State>
<StreamLocation>^WS.DE.DE041017700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
