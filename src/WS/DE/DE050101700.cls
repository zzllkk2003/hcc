Class WS.DE.DE050101700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "肺结核标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE050101700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050101700State</State>
<StreamLocation>^WS.DE.DE050101700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
