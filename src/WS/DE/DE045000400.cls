Class WS.DE.DE045000400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "HBV DNA定性检测结果";

Parameter Format = "N1";

Parameter ValueSet = "1:阳性;2:阴性;3:未查;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.50.004.00");

Storage Default
{
<Data name="DE045000400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045000400State</State>
<StreamLocation>^WS.DE.DE045000400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
