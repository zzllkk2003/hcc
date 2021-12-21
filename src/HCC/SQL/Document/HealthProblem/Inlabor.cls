/// 主要健康问题章节 - 待产记录
Class HCC.SQL.Document.HealthProblem.Inlabor Extends (%SerialObject, %XML.Adaptor, HCC.SQL.Base)
{

/// 待产日期时间
Property laborTime As WS.DE.DE060019700 [ SqlFieldName = labor_time ];

/// 孕次
Property pregTimes As WS.DE.DE040110800 [ SqlFieldName = preg_times ];

/// 产次
Property deliverTimes As WS.DE.DE021000200 [ SqlFieldName = deliver_times ];

/// 末次月经日期
Property LMP As WS.DE.DE021005100 [ SqlFieldName = LMP ];

/// 受孕形式代码
Property conceptionForm As WS.DE.DE060026100 [ SqlFieldName = conception_form ];

/// 预产期
Property EDC As WS.DE.DE051009800 [ SqlFieldName = EDC ];

/// 产前检查标志
Property prenatalExam As WS.DE.DE041001300 [ SqlFieldName = prenatal_exam ];

/// 产前检查异常情况
Property abnormal As WS.DE.DE051016100 [ SqlFieldName = abnormal ];

/// 此次妊娠特殊情况
Property specialCase As WS.DE.DE051007000 [ SqlFieldName = special ];

Storage Default
{
<Data name="InlaborState">
<Value name="1">
<Value>laborTime</Value>
</Value>
<Value name="2">
<Value>pregTimes</Value>
</Value>
<Value name="3">
<Value>deliverTimes</Value>
</Value>
<Value name="4">
<Value>LMP</Value>
</Value>
<Value name="5">
<Value>conceptionForm</Value>
</Value>
<Value name="6">
<Value>EDC</Value>
</Value>
<Value name="7">
<Value>prenatalExam</Value>
</Value>
<Value name="8">
<Value>abnormal</Value>
</Value>
<Value name="9">
<Value>specialCase</Value>
</Value>
</Data>
<State>InlaborState</State>
<StreamLocation>^HCC.SQL.Document.HDAD8.InlaborS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
