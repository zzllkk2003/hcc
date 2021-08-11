Class WS.DE.DE081006100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 500, MINLEN = 0);

Parameter Category = "卫生机构";

Parameter Description = "专科情况";

Parameter Format = "AN..500";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE081006100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081006100State</State>
<StreamLocation>^WS.DE.DE081006100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
