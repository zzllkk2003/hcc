Class WS.DE.DE083003000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生人员";

Parameter Description = "资质证有效期开始日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Property Value As %Date(FORMAT = 8);

Storage Default
{
<Data name="DE083003000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE083003000State</State>
<StreamLocation>^WS.DE.DE083003000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
