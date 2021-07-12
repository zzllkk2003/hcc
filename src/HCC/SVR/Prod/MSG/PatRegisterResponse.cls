Class HCC.SVR.Prod.MSG.PatRegisterResponse Extends Ens.Response [ ProcedureBlock ]
{

Property PatRegisterResult As %String;

Storage Default
{
<Data name="PatRegisterResponseDefaultData">
<Subscript>"PatRegisterResponse"</Subscript>
<Value name="1">
<Value>PatRegisterResult</Value>
</Value>
</Data>
<DefaultData>PatRegisterResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
