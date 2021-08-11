Class WS.DE.DE045003900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 1);

Parameter Category = "实验室检查";

Parameter Description = "淋巴细胞微核千分比(‰)";

Parameter Format = "N..4,1";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE045003900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045003900State</State>
<StreamLocation>^WS.DE.DE045003900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}