Class WS.DE.DE051007300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "体弱儿童标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE051007300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051007300State</State>
<StreamLocation>^WS.DE.DE051007300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
