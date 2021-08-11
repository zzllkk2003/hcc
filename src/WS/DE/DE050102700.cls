Class WS.DE.DE050102700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "医学诊断";

Parameter Description = "淋巴管或淋巴结炎发作伴随高热寒战标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE050102700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050102700State</State>
<StreamLocation>^WS.DE.DE050102700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
