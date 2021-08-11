Class WS.DE.DE030001300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "健康危险因素";

Parameter Description = "非安全性行为标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE030001300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030001300State</State>
<StreamLocation>^WS.DE.DE030001300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
