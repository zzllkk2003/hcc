Class WS.DE.DE050102501 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 50, MINLEN = 0);

Parameter Category = "医学诊断";

Parameter Description = "出院西医诊断-主要诊断-疾病名称";

Parameter Format = "AN..50";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE050102501State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050102501State</State>
<StreamLocation>^WS.DE.DE050102501S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
