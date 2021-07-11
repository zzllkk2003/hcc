Class WS.DE.DE020101500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "国籍";

Parameter Format = "AN..3";

Parameter ValueSet = "GBT.2659";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "GBT.2659");

Storage Default
{
<Data name="DE020101500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020101500State</State>
<StreamLocation>^WS.DE.DE020101500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
