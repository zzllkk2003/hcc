/// 地址
Class HCC.SQL.Addr Extends (%SerialObject, %XML.Adaptor)
{

/// 地址-门牌号
Property houseNum As WS.DE.DE020100906 [ SqlFieldName = house ];

/// 地址-村（街、路、弄等）
Property streetName As WS.DE.DE020100905 [ SqlFieldName = street ];

/// 地址-乡（镇、街道办事处）
Property township As WS.DE.DE020100904 [ SqlFieldName = town ];

/// 地址-县（区）
Property county As WS.DE.DE020100903 [ SqlFieldName = county ];

/// 地址-市（地区、州）
Property city As WS.DE.DE020100902 [ SqlFieldName = city ];

/// 地址-省（自治区、直辖市）
Property state As WS.DE.DE020100901 [ SqlFieldName = state ];

/// 地址-邮政编码
Property postCode As WS.DE.DE020104700 [ SqlFieldName = post ];

Storage Default
{
<Data name="AddrState">
<Value name="1">
<Value>houseNum</Value>
</Value>
<Value name="2">
<Value>streetName</Value>
</Value>
<Value name="3">
<Value>township</Value>
</Value>
<Value name="4">
<Value>county</Value>
</Value>
<Value name="5">
<Value>city</Value>
</Value>
<Value name="6">
<Value>state</Value>
</Value>
<Value name="7">
<Value>postCode</Value>
</Value>
</Data>
<State>AddrState</State>
<StreamLocation>^HCC.SQL.AddrS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
