Class WS.DE.DE060014700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99999, MINVAL = 0);

Parameter Category = "计划与干预";

Parameter Description = "用药天数";

Parameter Format = "N..5";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE060014700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060014700State</State>
<StreamLocation>^WS.DE.DE060014700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
