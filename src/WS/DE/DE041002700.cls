Class WS.DE.DE041002700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "儿童体检年龄(月 )";

Parameter Format = "N..3";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 999, MINVAL = 0);

Storage Default
{
<Data name="DE041002700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041002700State</State>
<StreamLocation>^WS.DE.DE041002700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
