Class WS.DE.DE041015200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "前囟横径(cm)";

Parameter Format = "N3,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As %Decimal(SCALE = 1);

Storage Default
{
<Data name="DE041015200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041015200State</State>
<StreamLocation>^WS.DE.DE041015200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
