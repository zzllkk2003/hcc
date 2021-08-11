Class WS.DE.DE050103300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "医学诊断";

Parameter Description = "躯体疾病名称";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE050103300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050103300State</State>
<StreamLocation>^WS.DE.DE050103300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
