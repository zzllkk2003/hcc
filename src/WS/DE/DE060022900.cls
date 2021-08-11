Class WS.DE.DE060022900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "气管护理代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:翻身拍背;2:雾化吸入;3:吸痰;";

Parameter ValueSet = "DE06.00.229.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.229.00");

Storage Default
{
<Data name="DE060022900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060022900State</State>
<StreamLocation>^WS.DE.DE060022900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
