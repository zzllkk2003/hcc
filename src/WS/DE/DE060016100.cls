Class WS.DE.DE060016100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "治疗形式建议代码";

Parameter Format = "N1";

Parameter ValueSet = "1:专科住院;2:专科门诊;3:社区管理";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.161.00");

Storage Default
{
<Data name="DE060016100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060016100State</State>
<StreamLocation>^WS.DE.DE060016100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
