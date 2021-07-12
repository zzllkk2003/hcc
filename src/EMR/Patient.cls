Class EMR.Patient Extends (%Persistent, %XML.Adaptor)
{

Property IDCard As %String;

// Index IDCardI On IDCard [ Unique ];

/// 身份证唯一
Property PatNo As %String;

Property Name As %String;

Property Gender As %String;

Property DOB As %String;

Property Citizenship As %String;

Property PhoneNumber As %String;

Storage Default
{
<Data name="PatientDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>IDCard</Value>
</Value>
<Value name="3">
<Value>PatNo</Value>
</Value>
<Value name="4">
<Value>Name</Value>
</Value>
<Value name="5">
<Value>Gender</Value>
</Value>
<Value name="6">
<Value>DOB</Value>
</Value>
<Value name="7">
<Value>Citizenship</Value>
</Value>
<Value name="8">
<Value>PhoneNumber</Value>
</Value>
</Data>
<DataLocation>^EMR.PatientD</DataLocation>
<DefaultData>PatientDefaultData</DefaultData>
<IdLocation>^EMR.PatientD</IdLocation>
<IndexLocation>^EMR.PatientI</IndexLocation>
<StreamLocation>^EMR.PatientS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
