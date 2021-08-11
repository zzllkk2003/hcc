Class WS.DE.DE043005900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Parameter Category = "临床辅助检查";

Parameter Description = "绕颈身（圈）";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE043005900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043005900State</State>
<StreamLocation>^WS.DE.DE043005900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
