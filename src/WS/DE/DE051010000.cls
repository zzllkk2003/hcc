Class WS.DE.DE051010000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "孕产妇死亡国家级评审结果代码";

Parameter Format = "N1";

Parameter ValueSet = "1:可避免死亡;2:不可避免死亡";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.100.00");

Storage Default
{
<Data name="DE051010000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051010000State</State>
<StreamLocation>^WS.DE.DE051010000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
