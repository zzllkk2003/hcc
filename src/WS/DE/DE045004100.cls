Class WS.DE.DE045004100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "梅毒血清学试验结果代码";

Parameter Format = "N1";

/// Parameter ValueSet = "1:阴性;2:阳性;";
Parameter ValueSet = "DE04.50.041.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.50.041.00");

Storage Default
{
<Data name="DE045004100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045004100State</State>
<StreamLocation>^WS.DE.DE045004100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
