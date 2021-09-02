/// 
/// Author: Jeff Liu
/// Date: 2021-08-26 11:02:59
/// LastEditTime: 2021-08-27 09:31:31
/// LastEditors: Jeff Liu
/// Description: 
/// FilePath: /hcc/src/HCC/Interface/RestHandler.cls
/// Jeff.liu@intersytems.com
/// 
Class HCC.Interface.RestHandler Extends %CSP.REST
{

Parameter CONTENTTYPE = "application/json";

XData UrlMap
{
<Routes>
 		<Map Prefix="/pubsub" Forward="HCC.Interface.PubSub.PubSubServer"/>
    <Map Prefix="/setting" Forward="HCC.Interface.Setting"/>
    <Map Prefix="/WS" Forward="HCC.Interface.WS"/>
    <Map Prefix="/monitor" Forward="HCC.Interface.Monitor.disp"/>
  </Routes>
}

}
