Class WS.DE.DE051010100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "孕产妇死亡省级评审结果代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:可避免死亡;2:不可避免死亡";

Parameter ValueSet = "DE05.10.101.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.101.00");

Storage Default
{
<Data name="DE051010100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051010100State</State>
<StreamLocation>^WS.DE.DE051010100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
