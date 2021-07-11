Class WS.DE.DE051001300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "初次产前检查孕周";

Parameter Format = "N2..3";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 999, MINVAL = 10);

Storage Default
{
<Data name="DE051001300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051001300State</State>
<StreamLocation>^WS.DE.DE051001300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
