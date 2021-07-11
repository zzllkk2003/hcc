Class WS.DE.DE021008800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "肿瘤家族史瘤别";

Parameter Format = "AN..5";

Parameter ValueSet = "ICD-10";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "ICD-10");

Storage Default
{
<Data name="DE021008800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021008800State</State>
<StreamLocation>^WS.DE.DE021008800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
