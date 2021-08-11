Class WS.DE.DE041020500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "心律类别代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:心律齐;2:心律不齐;3:心律绝对不齐";

Parameter ValueSet = "DE04.10.205.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.10.205.00");

Storage Default
{
<Data name="DE041020500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041020500State</State>
<StreamLocation>^WS.DE.DE041020500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
