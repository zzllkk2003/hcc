Class WS.DE.DE040109000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "性欲减退标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE040109000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040109000State</State>
<StreamLocation>^WS.DE.DE040109000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
