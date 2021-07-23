Class WS.DE.DE045002400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "低血糖反应代码";

Parameter Format = "N1";

Parameter ValueSet = "1:无;2:偶尔;3:频繁;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.50.024.00");

Storage Default
{
<Data name="DE045002400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045002400State</State>
<StreamLocation>^WS.DE.DE045002400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
