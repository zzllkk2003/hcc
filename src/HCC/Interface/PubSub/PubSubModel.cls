/// 
/// Author: Jeff Liu
/// Date: 2021-07-15 09:58:06
/// LastEditTime: 2021-08-04 23:51:45
/// LastEditors: Jeff Liu
/// Description: 
/// FilePath: \hcc\src\HCC\Service\Rest\PubSubModel.cls
/// Jeff.liu@intersytems.com
/// 
/// Description
Class HCC.Interface.PubSub.PubSubModel Extends (%RegisteredObject, %JSON.Adaptor, %XML.Adaptor)
{

/// 订阅者名称
Property SubscriberName As %String;

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

/// 订阅者ID
Property SubscriberID As %String;

/// 订阅项目ID
Property SubscriptionID As %String;

}
