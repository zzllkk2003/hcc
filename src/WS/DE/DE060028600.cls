Class WS.DE.DE060028600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "医嘱类别代码";

Parameter Format = "N1";

Parameter ValueSet = "1:长期医嘱;2:临时医嘱;9:其他;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.286.00");

Storage Default
{
<Data name="DE060028600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060028600State</State>
<StreamLocation>^WS.DE.DE060028600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
