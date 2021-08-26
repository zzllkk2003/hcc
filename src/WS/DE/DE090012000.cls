Class WS.DE.DE090012000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生管理";

Parameter Description = "质控日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Property Value As WS.DT.Date(FORMAT = 8);

Storage Default
{
<Data name="DE090012000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE090012000State</State>
<StreamLocation>^WS.DE.DE090012000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
