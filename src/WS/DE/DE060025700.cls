Class WS.DE.DE060025700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "手术切口类别";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:0类切口;2:Ⅰ类切口;3:Ⅱ类切口;4:Ⅲ类切口;";

Parameter ValueSet = "DE06.00.257.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.257.00");

Storage Default
{
<Data name="DE060025700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060025700State</State>
<StreamLocation>^WS.DE.DE060025700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
