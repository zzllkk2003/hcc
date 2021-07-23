Class WS.DE.DE081005400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生机构";

Parameter Description = "病区名称";

Parameter Format = "AN..70";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 70, MINLEN = 0);

Storage Default
{
<Data name="DE081005400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081005400State</State>
<StreamLocation>^WS.DE.DE081005400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
