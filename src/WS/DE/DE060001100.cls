Class WS.DE.DE060001100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "产妇会阴缝合针数";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Storage Default
{
<Data name="DE060001100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060001100State</State>
<StreamLocation>^WS.DE.DE060001100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
