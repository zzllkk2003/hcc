Class WS.DE.DE020100502 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "出生日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As %TimeStamp;

Storage Default
{
<Data name="DE020100502State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020100502State</State>
<StreamLocation>^WS.DE.DE020100502S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
