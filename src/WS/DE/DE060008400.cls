Class WS.DE.DE060008400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Parameter Category = "计划与干预";

Parameter Description = "皮下埋植剂埋植年限";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE060008400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060008400State</State>
<StreamLocation>^WS.DE.DE060008400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
