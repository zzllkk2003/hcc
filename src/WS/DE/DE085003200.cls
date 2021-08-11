Class WS.DE.DE085003200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "药品、设备与材料";

Parameter Description = "处方类别代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:中药饮片处方;2:中成药处方;";

Parameter ValueSet = "DE08.50.032.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE08.50.032.00");

Storage Default
{
<Data name="DE085003200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE085003200State</State>
<StreamLocation>^WS.DE.DE085003200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
