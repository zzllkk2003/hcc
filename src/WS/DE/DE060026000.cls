Class WS.DE.DE060026000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "手术体位代码";

Parameter Format = "N1";

Parameter ValueSet = "1:仰卧位;2:俯卧位;3:左侧卧位;4:右侧卧位;5:截石位;6:屈氏位;9:其他;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.260.00");

Storage Default
{
<Data name="DE060026000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060026000State</State>
<StreamLocation>^WS.DE.DE060026000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
