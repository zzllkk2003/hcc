Class WS.DE.DE041008100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "呼吸次数（次/min）";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Storage Default
{
<Data name="DE041008100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041008100State</State>
<StreamLocation>^WS.DE.DE041008100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
