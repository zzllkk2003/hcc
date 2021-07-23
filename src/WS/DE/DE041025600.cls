Class WS.DE.DE041025600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "破膜方式代码";

Parameter Format = "N1";

Parameter ValueSet = "1:自然;2:人工;3:可疑;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.10.256.00");

Storage Default
{
<Data name="DE041025600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041025600State</State>
<StreamLocation>^WS.DE.DE041025600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
