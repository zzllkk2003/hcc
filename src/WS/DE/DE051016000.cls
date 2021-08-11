Class WS.DE.DE051016000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "新生儿异常情况代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:无;2:早期新生儿死亡;3:畸形;4:早产;5:窒息;6:低出生体重;9:其他;";

Parameter ValueSet = "DE05.10.160.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.160.00");

Storage Default
{
<Data name="DE051016000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051016000State</State>
<StreamLocation>^WS.DE.DE051016000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
