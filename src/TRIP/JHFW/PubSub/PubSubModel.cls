/// Description
Class TRIP.JHFW.PubSub.PubSubModel Extends %RegisteredObject
{

/// 订阅者名称
Property SubsriberName As %String;

/// 订阅的类别
/// 
Property SubTopic As %String;

/// 订阅者url
Property SubscriberURL As %String;

/// 订阅者调用用户名
Property SubUserName As %String;

/// 订阅者密码
Property SubPassword As %String;

/// 订阅者WSDL 
/// TODO:暂时不用
Property WSDL As %Stream.GlobalCharacter;

}
