Class WS.DE.DE020102300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "经济状况代码";

Parameter Format = "N1";

/// Parameter ValueSet = "1:贫困，在当地贫困线标准以下;2:非贫困;3:不详;";
Parameter ValueSet = "DE02.01.023.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE02.01.023.00");

Storage Default
{
<Data name="DE020102300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020102300State</State>
<StreamLocation>^WS.DE.DE020102300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
