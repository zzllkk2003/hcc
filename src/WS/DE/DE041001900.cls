Class WS.DE.DE041001900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "出生体重（g）";

Parameter Format = "N3..4";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 9999, MINVAL = 100);

Storage Default
{
<Data name="DE041001900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041001900State</State>
<StreamLocation>^WS.DE.DE041001900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
