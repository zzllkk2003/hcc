Class WS.DE.DE045007900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "受检者滴虫检测结果代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:阳性;2:阴性;";

Parameter ValueSet = "DE04.50.079.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.50.079.00");

Storage Default
{
<Data name="DE045007900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045007900State</State>
<StreamLocation>^WS.DE.DE045007900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
