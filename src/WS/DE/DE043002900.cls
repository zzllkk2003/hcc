Class WS.DE.DE043002900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "临床辅助检查";

Parameter Description = "脾肿大分级代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:Ⅰ期;2:Ⅱ期;3:Ⅲ期;";

Parameter ValueSet = "DE04.30.029.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.30.029.00");

Storage Default
{
<Data name="DE043002900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043002900State</State>
<StreamLocation>^WS.DE.DE043002900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
