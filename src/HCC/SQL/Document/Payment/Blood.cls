/// 费用章节
/// 血液制品费
Class HCC.SQL.Document.Payment.Blood Extends (%SerialObject, %XML.Adaptor, HCC.SQL.Base)
{

/// 血液制品费-血费 
Property blood As WS.HSDE.HDSD0011115 [ SqlFieldName = blood ];

/// 血液制品费-白蛋白类制品费 
Property albumin As WS.HSDE.HDSD0011111 [ SqlFieldName = albumin ];

/// 血液制品费-球蛋白类制品费 
Property globulin As WS.HSDE.HDSD0011113 [ SqlFieldName = globulin ];

/// 血液制品费-凝血因子类制品费 
Property clotfactor As WS.HSDE.HDSD0011112 [ SqlFieldName = clotfactor ];

/// 血液制品费-细胞因子类制品费 
Property cellfactor As WS.HSDE.HDSD0011114 [ SqlFieldName = cellfactor ];

Storage Default
{
<Data name="BloodState">
<Value name="1">
<Value>Blood</Value>
</Value>
<Value name="2">
<Value>albumin</Value>
</Value>
<Value name="3">
<Value>globulin</Value>
</Value>
<Value name="4">
<Value>clotfactor</Value>
</Value>
<Value name="5">
<Value>cellfactor</Value>
</Value>
<Value name="6">
<Value>blood</Value>
</Value>
</Data>
<State>BloodState</State>
<StreamLocation>^HCC.SQL.Document.Pay7798.BloodS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
