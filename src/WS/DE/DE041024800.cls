Class WS.DE.DE041024800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 9999, MINVAL = 0);

Parameter Category = "体格检查";

Parameter Description = "宫颈厚度";

Parameter Format = "N..4";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE041024800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041024800State</State>
<StreamLocation>^WS.DE.DE041024800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
