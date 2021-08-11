Class WS.DE.DE030001100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "健康危险因素";

Parameter Description = "毒品注射史标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE030001100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030001100State</State>
<StreamLocation>^WS.DE.DE030001100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
