Class HCC.SQL.Document.LabTest.AnesthesiaVisit Extends (%SerialObject, %XML.Adaptor, HCC.SQL.Base)
{

Parameter XMLIGNORENULL = 1;

/// 心电图检查结果                                                          
Property EKG As WS.DE.DE043004300 [ SqlFieldName = EKG ];

/// 胸部X线检查结果                                                         
Property XRay As WS.DE.DE043004500 [ SqlFieldName = XRay ];

/// CT检查结果                                                           
Property CT As WS.DE.DE043000500 [ SqlFieldName = CT ];

/// B超检查结果                                                           
Property ultrasonic As WS.DE.DE043000200 [ SqlFieldName = ultrasonic ];

/// MRI检查结果                                                          
Property MRI As WS.DE.DE043000900 [ SqlFieldName = MRI ];

/// 肺功能检查结果                                                          
Property lungFunc As WS.DE.DE043000900 [ SqlFieldName = lungFunc ];

/// 血常规检查结果                                                          
Property CBC As WS.DE.DE045012800 [ SqlFieldName = CBC ];

/// 尿常规检查结果                                                          
Property urine As WS.DE.DE045004800 [ SqlFieldName = urine ];

/// 凝血功能检查结果                                                         
Property coagulation As WS.DE.DE045014200 [ SqlFieldName = coagulation ];

/// 肝功能检查结果                                                          
Property liver As WS.DE.DE045002600 [ SqlFieldName = liver ];

/// 血气分析检查结果                                                         
Property ABG As WS.DE.DE045012800 [ SqlFieldName = ABG ];

Storage Default
{
<Data name="AnesthesiaVisitState">
<Value name="1">
<Value>EKG</Value>
</Value>
<Value name="2">
<Value>XRay</Value>
</Value>
<Value name="3">
<Value>CT</Value>
</Value>
<Value name="4">
<Value>ultrasonic</Value>
</Value>
<Value name="5">
<Value>MRI</Value>
</Value>
<Value name="6">
<Value>lungFunc</Value>
</Value>
<Value name="7">
<Value>CBC</Value>
</Value>
<Value name="8">
<Value>urine</Value>
</Value>
<Value name="9">
<Value>coagulation</Value>
</Value>
<Value name="10">
<Value>liver</Value>
</Value>
<Value name="11">
<Value>ABG</Value>
</Value>
</Data>
<State>AnesthesiaVisitState</State>
<StreamLocation>^HCC.SQL.Do7824.AnesthesiaVCDB0S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
