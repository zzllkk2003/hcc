Class WS.DE.DE030002200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 999, MINVAL = 0);

Parameter Category = "健康危险因素";

Parameter Description = "患病对家庭社会的影响次数(次)";

Parameter Format = "N..3";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE030002200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030002200State</State>
<StreamLocation>^WS.DE.DE030002200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
