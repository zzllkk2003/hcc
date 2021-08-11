/// 文档记录对象或健康保健对象的患者信息
Class HCC.SQL.Document.Header.RecordTarget.Patient Extends (%SerialObject, %XML.Adaptor)
{

/// 患者身份证号标识
Property patientId As WS.DE.DE020103000 [ SqlFieldName = id ];

/// 患者姓名
Property patientName As WS.DE.DE020103900 [ Required, SqlFieldName = name ];

/// 患者性别代码
Property administrativeGender As WS.DE.DE020104000 [ Required, SqlFieldName = gender ];

/// 患者出生日期
Property birthTime As WS.DE.DE020100501 [ Required, SqlFieldName = birth_time ];

/// 婚姻状况代码
Property maritalStatusCode As WS.DE.DE020101800 [ SqlFieldName = mrtl_stat_code ];

/// 民族
Property ethnicGroupCode As WS.DE.DE020102500 [ SqlFieldName = ethnic_grp_code ];

/// 出生地
Property birthplace As HCC.SQL.Addr [ SqlFieldName = bp ];

/// 国籍
Property nationality As WS.DE.DE020101500 [ SqlFieldName = ntl ];

/// 年龄
Property ageInYear As WS.DE.DE020102600 [ SqlFieldName = age ];

/// 工作单位
Property employer As HCC.SQL.Document.Header.RecordTarget.Employer [ SqlFieldName = emp ];

/// 户口信息
Property household As HCC.SQL.Addr [ SqlFieldName = hh ];

/// 籍贯信息
Property nativePlace As HCC.SQL.Addr [ SqlFieldName = np ];

/// 实足月龄
Property ageInMonth As WS.DE.DE020103200 [ SqlFieldName = age_month ];

/// 职业类别代码
Property occupationCode As WS.DE.DE020105200 [ Required, SqlFieldName = occp_code ];

Storage Default
{
<Data name="PatientState">
<Value name="1">
<Value>patientId</Value>
</Value>
<Value name="2">
<Value>patientName</Value>
</Value>
<Value name="3">
<Value>administrativeGender</Value>
</Value>
<Value name="4">
<Value>birthTime</Value>
</Value>
<Value name="5">
<Value>maritalStatusCode</Value>
</Value>
<Value name="6">
<Value>ethnicGroupCode</Value>
</Value>
<Value name="7">
<Value>birthplace</Value>
</Value>
<Value name="8">
<Value>nationality</Value>
</Value>
<Value name="9">
<Value>ageInYear</Value>
</Value>
<Value name="10">
<Value>employer</Value>
</Value>
<Value name="11">
<Value>household</Value>
</Value>
<Value name="12">
<Value>nativePlace</Value>
</Value>
<Value name="13">
<Value>ageInMonth</Value>
</Value>
<Value name="14">
<Value>occupationCode</Value>
</Value>
<Value name="15">
<Value>providerOrganizationId</Value>
</Value>
<Value name="16">
<Value>providerOrganizationName</Value>
</Value>
</Data>
<State>PatientState</State>
<StreamLocation>^HCC.SQL.Document.HD122.PatientS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
