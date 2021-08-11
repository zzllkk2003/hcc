Class WS.DE.DE045010900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 1);

Parameter Category = "实验室检查";

Parameter Description = "血锌原卟啉检测值(umol/L)";

Parameter Format = "N3,1";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE045010900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045010900State</State>
<StreamLocation>^WS.DE.DE045010900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
