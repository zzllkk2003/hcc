Class WS.DE.DE060013200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "药物流产使用药物类别代码";

Parameter Format = "N1";

Parameter ValueSet = "1:米非司酮药物;2:前列腺素类药物";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.132.00");

Storage Default
{
<Data name="DE060013200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060013200State</State>
<StreamLocation>^WS.DE.DE060013200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
