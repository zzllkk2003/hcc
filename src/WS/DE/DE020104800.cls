Class WS.DE.DE020104800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "育子/女标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE020104800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020104800State</State>
<StreamLocation>^WS.DE.DE020104800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
