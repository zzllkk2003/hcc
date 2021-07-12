/// 接收订阅消息
Class HCC.SVR.API.PubSub.SubscriptionServer Extends %CSP.REST
{

Parameter HandleCorsRequest = 1;

/*
/// 添加订阅者
ClassMethod NewSubscriber() As %Status
{
   
 If '..GetJSONFromRequest(.obj) {
 Set %response.Status = ..#HTTP400BADREQUEST Set error = {"errormessage": "JSON not found"} Write error.%ToJSON()
 Quit $$$OK
 }
 If '..ValidateJSON(obj,.error) {
 Set %response.Status = ..#HTTP400BADREQUEST Write error.%ToJSON()
 Quit $$$OK
 }
 Set cm = ##class(TRIP.JHFW.PubSub.PubSubModel).%New() Do ..CopyToCoffeemakerFromJSON(.cm,obj)
 Set sc = cm.%Save()
 Set result={}
 do result.%Set("Status",$s($$$ISERR(sc):$system.Status.GetOneErrorText(sc),1:"OK")) Write result.%ToJSON()
 Quit sc
}

/// 修改订阅者
ClassMethod EditSubscriber() As %Status
{
    Set sc = $$$OK
   
    Return sc
}
*/
/// rest map
XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
      <Route Url="/test" Method="GET" Call="test"/>
      <Route Url="/newsubscriber" Method="POST" Call="NewSubscriber" />
      <Route Url="/editsubscriber/:id" Method="PUT" Call="EditSubscriber" />
      <Route Url="/cancelsubscriber/:id" Method="DELETE" Call="RemoveSubscriber"/>
      <Route Url="/getsubscriberlist/:id" Method="GET" Call="GetAllSubscribers"/>
</Routes>
}

}
