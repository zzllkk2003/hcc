Class WS.DE.DE021007600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "性病代码";

Parameter Format = "N1";

Parameter ValueSet = "1:有;2:无;3:不详;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE02.10.076.00");

Storage Default
{
<Data name="DE021007600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021007600State</State>
<StreamLocation>^WS.DE.DE021007600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
