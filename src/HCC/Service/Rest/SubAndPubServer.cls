/// 接收订阅消息
Class HCC.Service.Rest.SubAndPubServer Extends %CSP.REST
{

Parameter HandleCorsRequest = 1;

/// 添加订阅者
ClassMethod NewSubscriber() As %Status
{
}

/// 修改订阅者
ClassMethod EditSubscriber() As %Status
{
    Set sc = $$$OK
   
    Return sc
}

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
