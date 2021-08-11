Class WS.DE.DE045014100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "接收标本时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As WS.DT.TimeStamp;

Storage Default
{
<Data name="DE045014100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045014100State</State>
<StreamLocation>^WS.DE.DE045014100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
