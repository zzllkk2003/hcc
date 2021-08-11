/// 
/// Author: Jeff Liu
/// Date: 2021-08-04 23:31:50
/// LastEditTime: 2021-08-04 23:36:55
/// LastEditors: Jeff Liu
/// Description: 
/// FilePath: \hcc\src\HCC\Service\Rest\AllSubscriber.cls
/// Jeff.liu@intersytems.com
/// 
/// Description
Class HCC.Service.Rest.AllSubscriber Extends (%RegisteredObject, %JSON.Adaptor, %XML.Adaptor)
{

/// Description
Property Subscribers As list Of HCC.Service.Rest.PubSubModel;

}
