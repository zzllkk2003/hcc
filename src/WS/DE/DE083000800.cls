Class WS.DE.DE083000800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生人员";

Parameter Description = "稽查人员分类代码";

Parameter Format = "N1";

Parameter ValueSet = "1:专职;2:兼职;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE08.30.008.00");

Storage Default
{
<Data name="DE083000800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE083000800State</State>
<StreamLocation>^WS.DE.DE083000800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
