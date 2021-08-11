Class WS.DE.DE041015700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Parameter Category = "体格检查";

Parameter Description = "龋齿数(颗)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE041015700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041015700State</State>
<StreamLocation>^WS.DE.DE041015700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
