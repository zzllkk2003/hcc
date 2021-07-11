Class WS.DE.DE030005900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "受照剂量(Gy)";

Parameter Format = "N..5,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As %Decimal(SCALE = 1);

Storage Default
{
<Data name="DE030005900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030005900State</State>
<StreamLocation>^WS.DE.DE030005900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
