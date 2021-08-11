Class WS.DE.DE041008700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "黄疸状况代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:未褪尽;2:已褪尽";

Parameter ValueSet = "DE04.10.087.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.10.087.00");

Storage Default
{
<Data name="DE041008700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041008700State</State>
<StreamLocation>^WS.DE.DE041008700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
