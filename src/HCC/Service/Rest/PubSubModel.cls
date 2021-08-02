/// 
/// Author: Jeff Liu
/// Date: 2021-07-15 09:58:06
/// LastEditTime: 2021-07-16 16:13:40
/// LastEditors: Jeff Liu
/// Description: 
/// FilePath: /hcc/src/HCC/Service/Rest/PubSubModel.cls
/// Jeff.liu@intersytems.com
/// 
/// Description
Class HCC.Service.Rest.PubSubModel Extends %RegisteredObject
{

/// 订阅者名称
Property SubscriberName As %String;

/// 订阅名
Property SubscriptionName As %String;

/// 订阅的主题
/// 
Property SubTopic As %String;

/// 订阅者url
Property SubscriberURL As %String;

/// 订阅者目标production 组件
Property SubscriberBusinessHost As %String;

/// 订阅者调用验证方式
Property SubAuth As %String;

/// 组件状态
Property BusiHostStatus As %String;

/// 订阅者WSDL 
/// TODO:暂时不用
Property WSDL As %Stream.GlobalCharacter;

}
