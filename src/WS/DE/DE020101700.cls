Class WS.DE.DE020101700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "患者与本人关系";

Parameter Format = "N2";

Parameter ValueSet = "GBT.4761.2008";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "GBT.4761.2008");

Storage Default
{
<Data name="DE020101700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020101700State</State>
<StreamLocation>^WS.DE.DE020101700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
