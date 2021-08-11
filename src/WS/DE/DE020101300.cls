Class WS.DE.DE020101300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "分娩地点类别代码";

Parameter Format = "N1";

Parameter ValueSet = "CV02.01.102";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV02.01.102");

Storage Default
{
<Data name="DE020101300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020101300State</State>
<StreamLocation>^WS.DE.DE020101300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
