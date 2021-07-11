Class WS.DE.DE051012900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "美国麻醉医师协会分级标准代码";

Parameter Format = "N1";

Parameter ValueSet = "1:I; 2:II; 3:III; 4:IV; 5:V;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.129.00");

Storage Default
{
<Data name="DE051012900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051012900State</State>
<StreamLocation>^WS.DE.DE051012900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
