Class WS.DE.DE030004700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "配偶/固定性伴标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE030004700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030004700State</State>
<StreamLocation>^WS.DE.DE030004700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
