/// 
/// Author: Jeff Liu
/// Date: 2021-07-15 09:58:06
/// LastEditTime: 2021-08-03 00:42:52
/// LastEditors: Jeff Liu
/// Description: 
/// FilePath: \hcc\src\HCC\Service\Rest\PubSubModel.cls
/// Jeff.liu@intersytems.com
/// 
/// Description
Class HCC.Service.Rest.PubSubModel Extends (%RegisteredObject, %JSON.Adaptor)
{

/// 订阅者名称
Property SubscriberName As %String;

/// 订阅名
Property SubscriptionName As %String;

/// 订阅的主题
/// 
Property SubTopic As %String;

/// 订阅者url
Property SubscriberEndPointURL As %String;

/// 订阅者目标production 组件
Property SubscriberBusinessHostName As %String;

/// 订阅者调用验证方式
Property SubAuth As %String;

/// 组件状态
Property BusiHostStatus As %String;

/// 订阅者WSDL 
/// TODO:暂时不用
Property WSDL As %Stream.GlobalCharacter;

}
