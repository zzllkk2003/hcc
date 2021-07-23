Class WS.DE.DE051012600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "孕产妇健康评估异常标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE051012600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051012600State</State>
<StreamLocation>^WS.DE.DE051012600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
