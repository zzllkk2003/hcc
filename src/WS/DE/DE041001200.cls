Class WS.DE.DE041001200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "产后2小时出血量(ml)";

Parameter Format = "N..5";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99999, MINVAL = 0);

Storage Default
{
<Data name="DE041001200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041001200State</State>
<StreamLocation>^WS.DE.DE041001200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
