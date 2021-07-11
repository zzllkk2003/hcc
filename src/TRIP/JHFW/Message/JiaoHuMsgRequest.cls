/// 用于BS消息和BP交互
Class TRIP.JHFW.Message.JiaoHuMsgRequest Extends Ens.Request [ Language = objectscript ]
{

/// 消息流
Property Message As %Stream.GlobalCharacter(XMLSTREAMMODE = "LINE");

/// 服务代码
Property Action As %String;

/// 文档类型
Property DocType As %String;

/// 消息请求ID
Property MsgId As %String;

Storage Default
{
<Data name="JiaoHuMsgRequestDefaultData">
<Subscript>"JiaoHuMsgRequest"</Subscript>
<Value name="1">
<Value>Message</Value>
</Value>
<Value name="2">
<Value>Action</Value>
</Value>
<Value name="3">
<Value>DocType</Value>
</Value>
<Value name="4">
<Value>MsgId</Value>
</Value>
</Data>
<DefaultData>JiaoHuMsgRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
