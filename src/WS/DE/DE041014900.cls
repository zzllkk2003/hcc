Class WS.DE.DE041014900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "髂棘间径(cm)";

Parameter Format = "N4,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(SCALE = 1);

Storage Default
{
<Data name="DE041014900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041014900State</State>
<StreamLocation>^WS.DE.DE041014900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
