/// 
/// Author: Jeff Liu
/// Date: 2021-07-15 09:58:06
/// LastEditTime: 2021-07-31 20:01:19
/// LastEditors: Jeff Liu
/// Description: 
/// FilePath: /hcc/src/HCC/Service/Rest/SubAndPubServer.cls
/// Jeff.liu@intersytems.com
/// 
/// 接收订阅消息
Class HCC.Service.Rest.SubAndPubServer Extends %CSP.REST
{

Parameter HandleCorsRequest = 1;

/// 添加订阅者
/// 
/// EnsLib.PubSub.Utils 发布订阅工具类
///  Ens.ServiceRegistry.External.API 注册外部服务工具类
ClassMethod NewSubscriber() As %Status
{
    #Dim PubSub as HCC.SVR.API.PubSub.PubSubModel
    If '..GetJSONFromRequest(.obj) {
    Set %response.Status = ..#HTTP400BADREQUEST
    Set error = {"errormessage": "JSON not found"}
    Write error.%ToJSON()
    Quit $$$OK
  }
  
  If '..ValidateJSON(obj,.error) {
    Set %response.Status = ..#HTTP400BADREQUEST
    Write error.%ToJSON()
    Quit $$$OK
  }
  
  Set PubSub = ##class(HCC.SVR.API.PubSub.PubSubModel).%New()
  Do ..CopyToPubSubModelFromJSON(.PubSub,obj)
  
  
  
  Set result={}
  do result.%Set("Status",$s($$$ISERR(sc):$system.Status.GetOneErrorText(sc),1:"OK"))
  write result.%ToJSON()
  Quit sc
}

/// 修改订阅者
ClassMethod EditSubscriber() As %Status
{
    Set sc = $$$OK
   
    Return sc
}

/// 删除订阅者
ClassMethod RemoveSubscriber() As %Status
{
    Set sc = $$$OK
    // do something
    Return sc
}

/// json转换到订阅发布模型
ClassMethod CopyToPubSubModelFromJSON(ByRef cm As HCC.Service.Rest.PubSubModel, obj As %DynamicObject) As %Status
{
    set cm.BusiHostStatus=obj.BusiHostStatus
    set cm.SubAuth=obj.SubAuth
    set cm.SubscriberBusinessHost=obj.SubscriberBusinessHost
    set cm.SubscriberURL=obj.SubscriberURL
    set cm.SubTopic=obj.SubTopic
    set cm.WSDL=obj.WSDL
    set cm.SubscriptionName=obj.SubscriptionName
    set cm.SubscriberName=obj.SubscriberName
}

/// 从请求获得json
ClassMethod GetJSONFromRequest(Output obj As %DynamicObject) As %Status
{
   	Set ok = 1
	Try {
		Set obj = ##class(%DynamicObject).%FromJSON(%request.Content)
	} Catch ex {
		Set ok = 0
	}
	Quit ok
}

/// 验证json字符串
ClassMethod ValidateJSON(obj As %DynamicObject, Output error As %DynamicObject) As %Status
{
   	Set error = {}
	set error.errormessage=""
	If obj.%Get("SubscriberBusinessHost") = "" {
		Set error.errormessage = "业务操作组件为空"_$CHAR(10)_error.errormessage
	}	
	
	If obj.%Get("SubscriberURL") = "" {
		Set error.errormessage = "订阅者url为空"_$CHAR(10)_error.errormessage
	}

    If obj.%Get("SubTopic") = "" {
		Set error.errormessage = "订阅主题为空"_$CHAR(10)_error.errormessage
	}
     If obj.%Get("SubscriptionName") = "" {
		Set error.errormessage = "订阅名为空"_$CHAR(10)_error.errormessage
	}
    If obj.%Get("SubscriberName") = "" {
		Set error.errormessage = "订阅者名为空"_$CHAR(10)_error.errormessage
	}
	if error.errormessage '= ""
    {
        quit 0
    }
	Quit 1
}

ClassMethod MethodName() As %Status
{
    Set sc = $$$OK
    // do something
    Return sc
}

/// 获取全部订阅者
ClassMethod GetAllSubscribers() As %Stream.GlobalCharacter
{
    #dim ExServices as %Stream.GlobalCharacter = ##class(%Stream.GlobalCharacter).%New()
    //获得external service 的服务json
    set tsc = ##class(Ens.ServiceRegistry.External.API).ListServices(ExServices)

    Set sc = $$$OK
    
    // do something
    Return ExServices
}

/// rest map
XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
      <Route Url="/test" Method="GET" Call="test"/>
      <Route Url="/newsubscriber" Method="POST" Call="NewSubscriber" />
      <Route Url="/editsubscriber/:id" Method="PUT" Call="EditSubscriber" />
      <Route Url="/cancelsubscriber/:id" Method="DELETE" Call="RemoveSubscriber"/>
      <Route Url="/getsubscriberlist" Method="GET" Call="GetAllSubscribers"/>
</Routes>
}

}
