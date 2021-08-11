Class WS.DE.DE041025400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 9999, MINVAL = 0);

Parameter Category = "体格检查";

Parameter Description = "会阴血肿大小";

Parameter Format = "N..4";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE041025400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041025400State</State>
<StreamLocation>^WS.DE.DE041025400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
