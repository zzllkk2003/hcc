Class WS.DE.DE030009200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "职业病危害类别代码";

Parameter Format = "N1";

Parameter ValueSet = "1:轻微;2:一般;3:严重;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE03.00.092.00");

Storage Default
{
<Data name="DE030009200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030009200State</State>
<StreamLocation>^WS.DE.DE030009200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
