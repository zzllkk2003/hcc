Class WS.DE.DE030001000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "低脂高蛋白饮食标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE030001000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030001000State</State>
<StreamLocation>^WS.DE.DE030001000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
