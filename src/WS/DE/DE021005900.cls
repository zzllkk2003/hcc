Class WS.DE.DE021005900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "生育女数";

Parameter Format = "N1";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 9, MINVAL = 1);

Storage Default
{
<Data name="DE021005900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021005900State</State>
<StreamLocation>^WS.DE.DE021005900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
