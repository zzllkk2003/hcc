Class WS.DE.DE041023400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "子宫位置代码";

Parameter Format = "N1";

Parameter ValueSet = "1:前位;2:中位;3:后位";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.10.234.00");

Storage Default
{
<Data name="DE041023400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041023400State</State>
<StreamLocation>^WS.DE.DE041023400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
