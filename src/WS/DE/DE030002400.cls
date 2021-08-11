Class WS.DE.DE030002400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Parameter Category = "健康危险因素";

Parameter Description = "运动时长(月)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE030002400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030002400State</State>
<StreamLocation>^WS.DE.DE030002400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
