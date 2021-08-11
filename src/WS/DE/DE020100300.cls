Class WS.DE.DE020100300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "常住地址户籍标志";

Parameter Format;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE020100300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020100300State</State>
<StreamLocation>^WS.DE.DE020100300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
