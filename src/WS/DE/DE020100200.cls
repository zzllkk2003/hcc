Class WS.DE.DE020100200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "常住地类型代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:城市;2:农村;";

Parameter ValueSet = "DE02.01.002.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE02.01.002.00");

Storage Default
{
<Data name="DE020100200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020100200State</State>
<StreamLocation>^WS.DE.DE020100200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
