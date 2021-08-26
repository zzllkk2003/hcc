Class WS.DE.DE060004800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "检查(测)日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Property Value As WS.DT.Date(FORMAT = 8);

Storage Default
{
<Data name="DE060004800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060004800State</State>
<StreamLocation>^WS.DE.DE060004800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
