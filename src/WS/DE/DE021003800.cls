Class WS.DE.DE021003800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "家庭成员患乙肝患者标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE021003800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021003800State</State>
<StreamLocation>^WS.DE.DE021003800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
