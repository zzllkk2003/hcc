Class WS.HSDE.HDSD0011099 Extends WS.HSDE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生费用";

Parameter DECode = "DE07.00.001.00";

Parameter Description = "西药费-抗菌药物费用";

Parameter Format = "N..10,2";

Parameter ValueSet;

Parameter WSDT = "F";

/// Code System
Parameter CodeSystem = "2.16.156.10011.2.2.4";

/// Code System Name
Parameter CodeSystemName = "住院病案首页基本数据集";

Property Value As %Decimal(SCALE = 2);

Storage Default
{
<Data name="HDSD0011099State">
<Subscript>"HDSD0011099"</Subscript>
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>HDSD0011099State</State>
<Type>%Storage.Serial</Type>
}

}
