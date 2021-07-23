Class WS.DE.DE021008000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "乙肝疫苗接种针次(针)";

Parameter Format = "N1";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 9, MINVAL = 1);

Storage Default
{
<Data name="DE021008000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021008000State</State>
<StreamLocation>^WS.DE.DE021008000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
