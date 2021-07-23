Class WS.DE.DE041002200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "触诊脾脏肋下测量值(cm)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Storage Default
{
<Data name="DE041002200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041002200State</State>
<StreamLocation>^WS.DE.DE041002200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
