Class WS.DE.DE045004200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "念珠菌检测结果代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:阳性;2:阴性;";

Parameter ValueSet = "DE04.50.042.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.50.042.00");

Storage Default
{
<Data name="DE045004200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045004200State</State>
<StreamLocation>^WS.DE.DE045004200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
