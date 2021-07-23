Class WS.DE.DE051008700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "新生儿疾病筛查标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE051008700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051008700State</State>
<StreamLocation>^WS.DE.DE051008700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
