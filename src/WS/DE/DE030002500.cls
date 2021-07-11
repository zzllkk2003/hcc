Class WS.DE.DE030002500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "接触二手烟代码";

Parameter Format = "N1";

Parameter ValueSet = "1:几乎没有;2:有;3:不知道;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE03.00.025.00");

Storage Default
{
<Data name="DE030002500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030002500State</State>
<StreamLocation>^WS.DE.DE030002500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
