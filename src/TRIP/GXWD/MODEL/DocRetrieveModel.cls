/// 文档检索中建模型
Class TRIP.GXWD.MODEL.DocRetrieveModel Extends (%RegisteredObject, %XML.Adaptor)
{

/// Description
Parameter XMLNamespace = "urn:hl7-org:v3";

/// 检索请求ID
Property queryId As %String;

/// 检索返回状态编码
Property queryResponseCode As %String;

/// 发送方设备代码
Property SenderID As %String;

/// 检索结果
Property DocRetrieveResults As list Of TRIP.GXWD.MODEL.GXWDDOC;

/// 处理结果代码 AA 或 AE
Property AckTypeCode As %String;

/// 处理结果说明
Property ResultDetail As %String;

/// 检所结果数量
Property ResultQuantity As %String;

}
