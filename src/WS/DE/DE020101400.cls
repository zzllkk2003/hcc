Class WS.DE.DE020101400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "分娩日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Property Value As WS.DT.Date(FORMAT = 8);

Storage Default
{
<Data name="DE020101400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020101400State</State>
<StreamLocation>^WS.DE.DE020101400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
