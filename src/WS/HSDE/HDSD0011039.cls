Class WS.HSDE.HDSD0011039 Extends WS.HSDE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生费用";

Parameter DECode = "DE07.00.001.00";

Parameter Description = "一次性医用材料费-手术用";

Parameter Format = "N..10,2";

Parameter ValueSet;

Parameter WSDT = "F";

/// Code System
Parameter CodeSystem = "2.16.156.10011.2.2.4";

/// Code System Name
Parameter CodeSystemName = "住院病案首页基本数据集";

Property Value As WS.DT.Decimal(SCALE = 2);

Storage Default
{
<Data name="HDSD0011039State">
<Subscript>"HDSD0011039"</Subscript>
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>HDSD0011039State</State>
<Type>%Storage.Serial</Type>
}

}
