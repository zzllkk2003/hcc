Class WS.DE.DE081000600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生机构";

Parameter Description = "房屋竣工面积(m2)";

Parameter Format = "N..8,2";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(MAXVAL = 99999.99, MINVAL = 0, SCALE = 2);

Storage Default
{
<Data name="DE081000600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081000600State</State>
<StreamLocation>^WS.DE.DE081000600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
