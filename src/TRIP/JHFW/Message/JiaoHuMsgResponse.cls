Class TRIP.JHFW.Message.JiaoHuMsgResponse Extends Ens.Response [ Language = objectscript ]
{

/// 返回消息流
Property Message As %Stream.GlobalCharacter(XMLSTREAMMODE = "LINE");

/// 返回是否成功
Property Result As %Boolean;

Storage Default
{
<Data name="JiaoHuMsgResponseDefaultData">
<Subscript>"JiaoHuMsgResponse"</Subscript>
<Value name="1">
<Value>Content</Value>
</Value>
<Value name="2">
<Value>Result</Value>
</Value>
<Value name="3">
<Value>Message</Value>
</Value>
</Data>
<DefaultData>JiaoHuMsgResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
