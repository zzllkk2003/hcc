Class WS.DE.DE020105200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

/*
    数据元DE02.01.052.00在WS363.3-2011中定义为使用值集GB/T6565。
    但WST500.32-2016示例中，该数据元使用的是GB/T 2261.4（从业状况代码表）
    现将数据元DE02.01.052.00的值集改为GB/T 2261.4
*/
Parameter Category = "人口学及社会经济学特征";

Parameter Description = "职业类别代码";

Parameter Format = "AN3";

// Parameter ValueSet = "GB/T 6565";

Parameter ValueSet = "GBT.2261.4.2003";

Parameter WSDT = "S3";

// Property Value As WS.DT.CodedString(ValueSet = "GBT.6565");

Property Value As WS.DT.CodedString(ValueSet = "GBT.2261.4.2003");

Storage Default
{
<Data name="DE020105200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE020105200State</State>
<StreamLocation>^WS.DE.DE020105200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
