Class WS.DE.DE060011600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "喂养方式类别代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:纯母乳喂养;2:混合喂养;3:人工喂养";

Parameter ValueSet = "DE06.00.116.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.116.00");

Storage Default
{
<Data name="DE060011600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060011600State</State>
<StreamLocation>^WS.DE.DE060011600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
