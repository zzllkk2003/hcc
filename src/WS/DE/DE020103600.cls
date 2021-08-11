Class WS.DE.DE020103600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "死亡日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As WS.DT.TimeStamp;

Storage Default
{
<Data name="DE020103600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020103600State</State>
<StreamLocation>^WS.DE.DE020103600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
