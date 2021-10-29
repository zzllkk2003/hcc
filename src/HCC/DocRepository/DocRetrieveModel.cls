/// 
/// Author: Jeff Liu
/// Date: 2021-09-27 13:36:33
/// LastEditTime: 2021-10-29 18:00:55
/// LastEditors: Jeff Liu
/// Description: 
/// FilePath: /hcc/src/HCC/DocRepository/DocRetrieveModel.cls
/// Jeff.liu@intersytems.com
/// 
/// 文档检索中建模型
Class HCC.DocRepository.DocRetrieveModel Extends (%RegisteredObject, %XML.Adaptor)
{

/// Description
Parameter XMLNamespace = "urn:hl7-org:v3";

/// 检索请求ID
Property queryId As %String;

/// 检索返回状态编码
Property queryResponseCode As %String;

/// 发送方设备代码
Property SenderID As %String;

/// 接收方设备代码
Property ReceiverID As %String;

/// 检索结果
Property DocRetrieveResults As list Of HCC.DocRepository.LatestDocs;

/// 处理结果代码 AA 或 AE
Property AckTypeCode As %String;

/// 处理结果说明
Property ResultDetail As %String;

/// 检所结果数量
Property ResultQuantity As %String;

/// 检索消息ID
Property TargetMessageID As %String;

/// 返回消息ID
Property ResponseMessageID As %String;

/// 返回消息创建时间
Property ResultResponseTime As %String;

Relationship Patient As HCC.DocRepository.Patient(XMLPROJECTION = "element") [ Cardinality = one, Inverse = DocA ];

}
