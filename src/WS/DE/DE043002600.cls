Class WS.DE.DE043002600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Parameter Category = "临床辅助检查";

Parameter Description = "脾脏长径测量值(cm)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE043002600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043002600State</State>
<StreamLocation>^WS.DE.DE043002600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}