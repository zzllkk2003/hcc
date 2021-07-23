Class WS.DE.DE043005700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "临床辅助检查";

Parameter Description = "前羊水量";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Storage Default
{
<Data name="DE043005700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043005700State</State>
<StreamLocation>^WS.DE.DE043005700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
