Class WS.DE.DE083003300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生人员";

Parameter Description = "巡台护士";

Parameter Format = "AN..40";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 40, MINLEN = 0);

Storage Default
{
<Data name="DE083003300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE083003300State</State>
<StreamLocation>^WS.DE.DE083003300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
