/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
Class HCC.SQL.Document.HealthProblem.ComaAfterAdmit Extends (%SerialObject, %XML.Adaptor)
{

/// 颅脑损伤患者入院后昏迷时间(天)  
Property days As WS.DE.DE051013801 [ SqlFieldName = days ];

/// 颅脑损伤患者入院后昏迷时间(小时)  
Property hours As WS.DE.DE051013802 [ SqlFieldName = hours ];

/// 颅脑损伤患者入院后昏迷时间(分钟)  
Property minutes As WS.DE.DE051013803 [ SqlFieldName = minutes ];

Storage Default
{
<Data name="ComaAfterAdmitState">
<Value name="1">
<Value>days</Value>
</Value>
<Value name="2">
<Value>hours</Value>
</Value>
<Value name="3">
<Value>minutes</Value>
</Value>
</Data>
<State>ComaAfterAdmitState</State>
<StreamLocation>^HCC.SQL.DocDAD8.ComaAfterAdmitS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
