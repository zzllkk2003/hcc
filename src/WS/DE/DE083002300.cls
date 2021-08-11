Class WS.DE.DE083002300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 20, MINLEN = 0);

Parameter Category = "卫生人员";

Parameter Description = "行政职级";

Parameter Format = "A..20";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE083002300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE083002300State</State>
<StreamLocation>^WS.DE.DE083002300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
