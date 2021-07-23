Class WS.DE.DE030001600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "共用血液污染器具标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE030001600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030001600State</State>
<StreamLocation>^WS.DE.DE030001600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
