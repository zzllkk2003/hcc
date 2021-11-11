Class WS.DE.DE020101800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "婚姻状况代码";

Parameter Format = "N2";

Parameter ValueSet = "GBT.2261.2.2003";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "GBT.2261.2.2003");

Storage Default
{
<Data name="DE020101800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020101800State</State>
<StreamLocation>^WS.DE.DE020101800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
