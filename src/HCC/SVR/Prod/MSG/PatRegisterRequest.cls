Class HCC.SVR.Prod.MSG.PatRegisterRequest Extends Ens.Request [ ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "HCC.SVR.Prod.MSG.PatRegisterResponse";

Property pat As HCC.SVR.Prod.BO.Proxy.s0.PatientReq;

Storage Default
{
<Data name="PatRegisterRequestDefaultData">
<Subscript>"PatRegisterRequest"</Subscript>
<Value name="1">
<Value>pat</Value>
</Value>
</Data>
<DefaultData>PatRegisterRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
