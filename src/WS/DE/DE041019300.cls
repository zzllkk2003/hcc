Class WS.DE.DE041019300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "透光试验结果代码";

Parameter Format = "N1";

Parameter ValueSet = "1:阳性;2:阴性";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.10.193.00");

Storage Default
{
<Data name="DE041019300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041019300State</State>
<StreamLocation>^WS.DE.DE041019300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
