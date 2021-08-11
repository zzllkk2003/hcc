Class WS.DE.DE041000200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "包皮检查结果代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:正常;2:过长;3:包茎";

Parameter ValueSet = "DE04.10.002.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.10.002.00");

Storage Default
{
<Data name="DE041000200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041000200State</State>
<StreamLocation>^WS.DE.DE041000200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
