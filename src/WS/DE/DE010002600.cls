Class WS.DE.DE010002600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "标识";

Parameter Description = "病床号";

Parameter Format = "AN..20";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 20, MINLEN = 0);

Storage Default
{
<Data name="DE010002600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE010002600State</State>
<StreamLocation>^WS.DE.DE010002600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
