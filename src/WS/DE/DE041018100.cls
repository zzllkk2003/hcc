Class WS.DE.DE041018100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "体格检查";

Parameter Description = "胎儿胎头和母亲骨盆衔接标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE041018100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041018100State</State>
<StreamLocation>^WS.DE.DE041018100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
