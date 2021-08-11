Class WS.DE.DE051014700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "手术切口愈合等级";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:甲;2:乙;3:丙;9:其他;";

Parameter ValueSet = "DE05.10.147.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.147.00");

Storage Default
{
<Data name="DE051014700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051014700State</State>
<StreamLocation>^WS.DE.DE051014700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
