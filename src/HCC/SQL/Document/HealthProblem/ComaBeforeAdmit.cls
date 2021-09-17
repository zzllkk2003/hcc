/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
Class HCC.SQL.Document.HealthProblem.ComaBeforeAdmit Extends (%SerialObject, %XML.Adaptor, HCC.SQL.Base)
{

/// 颅脑损伤患者入院前昏迷时间(天)  
Property days As WS.DE.DE051013801 [ SqlFieldName = days ];

/// 颅脑损伤患者入院前昏迷时间(小时)  
Property hours As WS.DE.DE051013802 [ SqlFieldName = hours ];

/// 颅脑损伤患者入院前昏迷时间(分钟)  
Property minutes As WS.DE.DE051013803 [ SqlFieldName = minutes ];

Storage Default
{
<Data name="ComaBeforeAdmitState">
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
<State>ComaBeforeAdmitState</State>
<StreamLocation>^HCC.SQL.DoDAD8.ComaBeforeA8ACCS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
