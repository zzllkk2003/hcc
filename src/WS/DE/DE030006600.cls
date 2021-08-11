Class WS.DE.DE030006600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "健康危险因素";

Parameter Description = "吸食非卷烟标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE030006600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030006600State</State>
<StreamLocation>^WS.DE.DE030006600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
