Class WS.DE.DE043001400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "临床辅助检查";

Parameter Description = "睾丸检查结果代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:扪及;2:未扪及;";

Parameter ValueSet = "DE04.30.014.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.30.014.00");

Storage Default
{
<Data name="DE043001400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043001400State</State>
<StreamLocation>^WS.DE.DE043001400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
