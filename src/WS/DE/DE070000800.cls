Class WS.DE.DE070000800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生费用";

Parameter Description = "住院费用分类代码";

Parameter Format = "N2";

Parameter ValueSet;

Parameter WSDT = "S3";

Property Value;

Storage Default
{
<Data name="DE070000800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE070000800State</State>
<StreamLocation>^WS.DE.DE070000800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
