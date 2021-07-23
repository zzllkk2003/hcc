Class WS.DE.DE041024700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "出口横径";

Parameter Format = "N..4";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 9999, MINVAL = 0);

Storage Default
{
<Data name="DE041024700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041024700State</State>
<StreamLocation>^WS.DE.DE041024700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
