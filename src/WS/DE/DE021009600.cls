Class WS.DE.DE021009600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "产妇结局代码";

Parameter Format = "N1";

Parameter ValueSet = "DE02.10.096.00";

Parameter ValueSetDisplay = "1:存活;2:产时死亡;3:产后死亡;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE02.10.096.00");

Storage Default
{
<Data name="DE021009600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021009600State</State>
<StreamLocation>^WS.DE.DE021009600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
