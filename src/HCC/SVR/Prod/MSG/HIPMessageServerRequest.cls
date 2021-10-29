Class HCC.SVR.Prod.MSG.HIPMessageServerRequest Extends Ens.Request [ ProcedureBlock ]
{

Parameter RESPONSECLASSNAME = "HCC.SVR.Prod.MSG.HIPMessageServerResponse";

Property action As %String;

Property message As %String;

Storage Default
{
<Data name="HIPMessageServerRequestDefaultData">
<Subscript>"HIPMessageServerRequest"</Subscript>
<Value name="1">
<Value>action</Value>
</Value>
<Value name="2">
<Value>message</Value>
</Value>
</Data>
<DefaultData>HIPMessageServerRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
