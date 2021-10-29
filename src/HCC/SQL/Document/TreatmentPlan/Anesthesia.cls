/// 治疗计划章节 - 拟实施麻醉方法
Class HCC.SQL.Document.TreatmentPlan.Anesthesia Extends (%SerialObject, %XML.Adaptor, HCC.SQL.Base)
{

/// 麻醉方法代码
Property code As WS.DE.DE060007300 [ SqlFieldName = code ];

/// 术前麻醉医嘱
Property anesthesiaOrder As WS.DE.DE060028700 [ SqlFieldName = anesth_order ];

/// 麻醉适应证
Property indication As WS.DE.DE060022700 [ SqlFieldName = indic ];

/// 注意事项
Property notes As WS.DE.DE090011900 [ SqlFieldName = notes ];

/// 拟实施时间
Property time As WS.DE.DE060022100 [ SqlFieldName = time ];

/// 拟实施手术
Property procedure As WS.DE.DE060009300 [ SqlFieldName = procd ];

/// 拟行有创操作和检测方法。用于《麻醉知情同意书》。WST500.27-2016 《麻醉知情同意书》中定义的该项，数据元是“麻醉方法代码”，是由值集CV06.00.103约束的（由WS363.12-2011定义）。这是错误的！Property test As WS.DE.DE060007300 [ SqlFieldName = test ];
Property test As %String [ SqlFieldName = test ];

/// 基础疾病对麻醉可能产生的影响
Property effectFromBasicDisease As WS.DE.DE051014600 [ SqlFieldName = eff_frm_bas_dise ];

/// 基础疾病
Property basicDisease As WS.DE.DE040112100 [ SqlFieldName = bas_dise ];

/// 使用麻醉镇痛泵标志
Property analgesicPump As WS.DE.DE060024000 [ SqlFieldName = anal_pump ];

/// 参加麻醉安全保险标志
Property insurance As WS.DE.DE010001600 [ SqlFieldName = ins ];

Storage Default
{
<Data name="AnesthesiaState">
<Value name="1">
<Value>code</Value>
</Value>
<Value name="2">
<Value>anesthesiaOrder</Value>
</Value>
<Value name="3">
<Value>indication</Value>
</Value>
<Value name="4">
<Value>notes</Value>
</Value>
<Value name="5">
<Value>time</Value>
</Value>
<Value name="6">
<Value>procedure</Value>
</Value>
<Value name="7">
<Value>test</Value>
</Value>
<Value name="8">
<Value>effectFromBasicDisease</Value>
</Value>
<Value name="9">
<Value>basicDisease</Value>
</Value>
<Value name="10">
<Value>analgesicPump</Value>
</Value>
<Value name="11">
<Value>insurance</Value>
</Value>
</Data>
<State>AnesthesiaState</State>
<StreamLocation>^HCC.SQL.Documen63C8.AnesthesiaS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
