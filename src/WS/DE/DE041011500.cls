Class WS.DE.DE041011500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "裸限近视力值";

Parameter Format = "N3,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As %Decimal(SCALE = 1);

Storage Default
{
<Data name="DE041011500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041011500State</State>
<StreamLocation>^WS.DE.DE041011500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
