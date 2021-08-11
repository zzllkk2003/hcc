Class WS.DE.DE051001700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "医学评估";

Parameter Description = "儿童发育评估通过标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE051001700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051001700State</State>
<StreamLocation>^WS.DE.DE051001700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
