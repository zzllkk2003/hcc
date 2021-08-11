Class WS.DE.DE030002000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 1);

Parameter Category = "健康危险因素";

Parameter Description = "户外活动时长(h)";

Parameter Format = "N..4,1";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE030002000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030002000State</State>
<StreamLocation>^WS.DE.DE030002000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
