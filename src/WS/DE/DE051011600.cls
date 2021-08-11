Class WS.DE.DE051011600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "医学评估";

Parameter Description = "肿瘤患者转移标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE051011600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051011600State</State>
<StreamLocation>^WS.DE.DE051011600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
