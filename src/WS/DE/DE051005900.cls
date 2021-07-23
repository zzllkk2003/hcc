Class WS.DE.DE051005900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "身体活动类别代码";

Parameter Format = "N1";

Parameter ValueSet = "1:工作、农业及家务性;2:交通性;3:休闲性";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.059.00");

Storage Default
{
<Data name="DE051005900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051005900State</State>
<StreamLocation>^WS.DE.DE051005900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
