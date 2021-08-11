Class WS.DE.DE045013700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "标本采样日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As WS.DT.TimeStamp;

Storage Default
{
<Data name="DE045013700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045013700State</State>
<StreamLocation>^WS.DE.DE045013700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
