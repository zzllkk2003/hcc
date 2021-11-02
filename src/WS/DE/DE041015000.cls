Class WS.DE.DE041015000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "髂嵴间径(cm)";

Parameter Format = "N4,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(SCALE = 1);

Storage Default
{
<Data name="DE041015000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041015000State</State>
<StreamLocation>^WS.DE.DE041015000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
