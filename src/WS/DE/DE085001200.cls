Class WS.DE.DE085001200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "药品、设备与材料";

Parameter Description = "胰岛素用药使用频率(次/d)";

Parameter Format = "N1";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 9, MINVAL = 1);

Storage Default
{
<Data name="DE085001200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE085001200State</State>
<StreamLocation>^WS.DE.DE085001200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
