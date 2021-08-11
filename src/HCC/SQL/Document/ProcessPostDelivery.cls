/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 产后处置章节表
Class HCC.SQL.Document.ProcessPostDelivery Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode = "57076-2";

Parameter SectionName = "postpartum hospitalization treatment";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 产后诊断                                                           
Property diag As WS.DE.DE051000700 [ Required, SqlFieldName = diag ];

/// 产后观察日期时间                                                       
Property obsTime As WS.DE.DE060021800 [ Required, SqlFieldName = obs_time ];

/// 产后检查时间(min)                                                    
Property checkTime As WS.DE.DE041024600 [ Required, SqlFieldName = check_time ];

/// 收缩压                                                            
Property systolic As WS.DE.DE041017400 [ Required, SqlFieldName = systolic ];

/// 舒张压                                                            
Property diastolic As WS.DE.DE041017600 [ Required, SqlFieldName = diastolic ];

/// 产后脉搏(次/min)                                                   
Property pulse As WS.DE.DE041011800 [ Required, SqlFieldName = pulse ];

/// 产后心率(次/min)                                                   
Property heartRate As WS.DE.DE041020600 [ Required, SqlFieldName = heart_rate ];

/// 产后出血量(mL)                                                      
Property postpartumHemorrhage As WS.DE.DE041001200 [ Required, SqlFieldName = pph ];

/// 产后宫缩                                                           
Property uterineContraction As WS.DE.DE041024500 [ Required, SqlFieldName = uterine_contraction ];

/// 产后宫底高度(cm)                                                     
Property uterusFundusHeight As WS.DE.DE041006700 [ Required, SqlFieldName = uterus_fundus_height ];

/// 肛查                                                             
Property analExam As WS.DE.DE041024000 [ Required, SqlFieldName = anal_exam ];

Storage Default
{
<Data name="ProcessPostDeliveryDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>chzd</Value>
</Value>
<Value name="3">
<Value>chgcrqsj</Value>
</Value>
<Value name="4">
<Value>chjcsj</Value>
</Value>
<Value name="5">
<Value>ssy</Value>
</Value>
<Value name="6">
<Value>szy</Value>
</Value>
<Value name="7">
<Value>chmb</Value>
</Value>
<Value name="8">
<Value>chxl</Value>
</Value>
<Value name="9">
<Value>chcxl</Value>
</Value>
<Value name="10">
<Value>chgs</Value>
</Value>
<Value name="11">
<Value>chgdgd</Value>
</Value>
<Value name="12">
<Value>gc</Value>
</Value>
<Value name="13">
<Value>diag</Value>
</Value>
<Value name="14">
<Value>obsTime</Value>
</Value>
<Value name="15">
<Value>checkTime</Value>
</Value>
<Value name="16">
<Value>systolic</Value>
</Value>
<Value name="17">
<Value>diastolic</Value>
</Value>
<Value name="18">
<Value>pulse</Value>
</Value>
<Value name="19">
<Value>heartrate</Value>
</Value>
<Value name="20">
<Value>postpartumHemorrhage</Value>
</Value>
<Value name="21">
<Value>uterineContraction</Value>
</Value>
<Value name="22">
<Value>uterusFundusHeight</Value>
</Value>
<Value name="23">
<Value>analExam</Value>
</Value>
<Value name="24">
<Value>heartRate</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Do70F6.ProcessPost7653D</DataLocation>
<DefaultData>ProcessPostDeliveryDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.ProcessPost7653D</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.ProcessPost7653I</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.ProcessPost7653S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
