Class WS.DE.DE051001900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "儿童死前治疗类别代码";

Parameter Format = "N1";

Parameter ValueSet = "1:住院治疗;2:门诊治疗;3:未治疗";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.019.00");

Storage Default
{
<Data name="DE051001900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051001900State</State>
<StreamLocation>^WS.DE.DE051001900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
