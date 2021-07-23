Class WS.DE.DE045000900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "HIV抗体检测结果代码";

Parameter Format = "N1";

Parameter ValueSet = "1:阴性;2:阳性;3:不确定;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.50.009.00");

Storage Default
{
<Data name="DE045000900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045000900State</State>
<StreamLocation>^WS.DE.DE045000900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
