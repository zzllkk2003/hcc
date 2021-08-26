Class HCC.Interface.RestHandler Extends %CSP.REST
{

Parameter CONTENTTYPE = "application/json";

XData UrlMap
{
<Routes>
 		<Map Prefix="/pubsub" Forward="HCC.Interface.PubSub.PubSubServer"/>
    <Map Prefix="/setting" Forward="HCC.Interface.Setting"/>
    <Map Prefix="/WS" Forward="HCC.Interface.WS"/>
  </Routes>
}

}
