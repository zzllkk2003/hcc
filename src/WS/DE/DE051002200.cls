Class WS.DE.DE051002200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "发育程度代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:正力型;2:无力型;3:超力型";

Parameter ValueSet = "DE05.10.022.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.10.022.00");

Storage Default
{
<Data name="DE051002200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051002200State</State>
<StreamLocation>^WS.DE.DE051002200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
