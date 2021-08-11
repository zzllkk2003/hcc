Class WS.DE.DE045013900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "检查方式代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:阴道检查;2:肛门检查;";

Parameter ValueSet = "DE04.50.139.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.50.139.00");

Storage Default
{
<Data name="DE045013900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045013900State</State>
<StreamLocation>^WS.DE.DE045013900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
