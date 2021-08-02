Class WS.DE.DE051016600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "宫腔探查肌瘤标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE051016600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051016600State</State>
<StreamLocation>^WS.DE.DE051016600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}