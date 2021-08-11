Class WS.DE.DE041023900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 1);

Parameter Category = "体格检查";

Parameter Description = "坐骨结节间径(cm)";

Parameter Format = "N3..4,1";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE041023900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041023900State</State>
<StreamLocation>^WS.DE.DE041023900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}