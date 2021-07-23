Class WS.DE.DE051012500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "重性精神疾病患者访到标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE051012500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051012500State</State>
<StreamLocation>^WS.DE.DE051012500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
