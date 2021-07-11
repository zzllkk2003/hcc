Class WS.DE.DE020102400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "人口学及社会经济学特征";

Parameter Description = "居住地区类别代码";

Parameter Format = "N1";

/// Parameter ValueSet = "1:平原;2:山区;9:其他;";
Parameter ValueSet = "DE02.01.024.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE02.01.024.00");

Storage Default
{
<Data name="DE020102400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020102400State</State>
<StreamLocation>^WS.DE.DE020102400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
