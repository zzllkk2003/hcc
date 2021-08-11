Class WS.DE.DE041017500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 1);

Parameter Category = "体格检查";

Parameter Description = "受检者骶耻外径 (cm)";

Parameter Format = "N4,1";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE041017500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041017500State</State>
<StreamLocation>^WS.DE.DE041017500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
