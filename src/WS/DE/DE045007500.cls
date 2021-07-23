Class WS.DE.DE045007500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "乳糜试验结果代码";

Parameter Format = "N1";

Parameter ValueSet = "1:阳性;2:阴性;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.50.075.00");

Storage Default
{
<Data name="DE045007500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045007500State</State>
<StreamLocation>^WS.DE.DE045007500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
