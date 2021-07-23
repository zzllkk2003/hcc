Class WS.DE.DE081002900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生机构";

Parameter Description = "派出(分支)机构数量";

Parameter Format = "N2";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99, MINVAL = 10);

Storage Default
{
<Data name="DE081002900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081002900State</State>
<StreamLocation>^WS.DE.DE081002900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
