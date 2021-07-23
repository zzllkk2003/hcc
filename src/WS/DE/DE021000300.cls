Class WS.DE.DE021000300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "出生缺陷儿标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE021000300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021000300State</State>
<StreamLocation>^WS.DE.DE021000300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
