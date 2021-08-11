Class WS.DE.DE081000400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 999999, MINVAL = 0);

Parameter Category = "卫生机构";

Parameter Description = "发生执法过错的下级责任单位数";

Parameter Format = "N..6";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE081000400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081000400State</State>
<StreamLocation>^WS.DE.DE081000400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
