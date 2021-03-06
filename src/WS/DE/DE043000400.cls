Class WS.DE.DE043000400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Parameter Category = "临床辅助检查";

Parameter Description = "B超脾脏肋下测量值(cm)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE043000400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043000400State</State>
<StreamLocation>^WS.DE.DE043000400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
