Class WS.DE.DE060008700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 200, MINLEN = 0);

Parameter Category = "计划与干预";

Parameter Description = "其他医学处置";

Parameter Format = "AN..200";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE060008700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060008700State</State>
<StreamLocation>^WS.DE.DE060008700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
