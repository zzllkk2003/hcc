Class WS.DE.DE060026800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "输液量（ml）";

Parameter Format = "N..5";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99999, MINVAL = 0);

Storage Default
{
<Data name="DE060026800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060026800State</State>
<StreamLocation>^WS.DE.DE060026800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
