/// 入出院时间条目
Class HCC.SQL.Document.HealthcareEvent.Time Extends (%SerialObject, %XML.Adaptor, HCC.SQL.Base)
{

/// 入院日期时间
Property admissionTime As WS.DE.DE060009200 [ SqlFieldName = adm ];

/// 出院日期时间
Property dischargeTime As WS.DE.DE060001700 [ SqlFieldName = dchg ];

Storage Default
{
<Data name="TimeState">
<Value name="1">
<Value>admissionTime</Value>
</Value>
<Value name="2">
<Value>dischargeTime</Value>
</Value>
</Data>
<State>TimeState</State>
<StreamLocation>^HCC.SQL.Document.Healt2E2.TimeS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
