Class WS.DE.DE020102600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "年龄";

Parameter Format = "N3";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 999, MINVAL = 0);

Storage Default
{
<Data name="DE020102600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020102600State</State>
<StreamLocation>^WS.DE.DE020102600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
