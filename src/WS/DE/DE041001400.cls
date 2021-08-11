Class WS.DE.DE041001400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Parameter Category = "体格检查";

Parameter Description = "产前检查次数";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE041001400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041001400State</State>
<StreamLocation>^WS.DE.DE041001400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
