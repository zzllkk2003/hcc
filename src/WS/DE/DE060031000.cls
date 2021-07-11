Class WS.DE.DE060031000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "实际住院天数";

Parameter Format = "N..5";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99999, MINVAL = 0);

Storage Default
{
<Data name="DE060031000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060031000State</State>
<StreamLocation>^WS.DE.DE060031000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
