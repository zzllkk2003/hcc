/// 
/// Author: Jeff Liu
/// Date: 2021-07-15 09:58:06
/// LastEditTime: 2021-08-04 23:54:06
/// LastEditors: Jeff Liu
/// Description: 
/// FilePath: \hcc\src\HCC\Service\Rest\SubAndPubServer.cls
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
/// Ens.Config.Credentials 连接密码类
///  EnsPortal.ProductionConfig 
ClassMethod NewSubscriber() As %Status
{
   
    #Dim PubSub as HCC.SVR.API.PubSub.PubSubModel
    Set result={}
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
  
  Set PubSub = ##class(HCC.Service.Rest.PubSubModel).%New()
  do ..CopyToPubSubModelFromJSON(.PubSub,obj)
   // 加入 BO
  #Dim BusinessHost as Ens.Config.Item = ##class(Ens.Config.Item).%New()
  #Dim Setting as Ens.Config.Setting = ##class(Ens.Config.Setting).%New()
  set Setting.Name="WebServiceURL"
  set Setting.Value=PubSub.SubscriberEndPointURL
  #Dim production as Ens.Config.Production = ##class(Ens.Config.Production).%OpenId("HCCPKG.FoundationProduction")
  set BusinessHost.ClassName="HCC.SVR.Prod.BO.StandardHCCOutBound"
  set BusinessHost.Name =PubSub.SubscriberBusinessHostName
  set BusinessHost.Production = production
  do BusinessHost.Settings.Insert(Setting)
  set Setting.Name="SOAPCredentials"
  set Setting.Value=PubSub.SubAuth
  do BusinessHost.Settings.Insert(Setting)
  Do production.Items.Insert(BusinessHost)
  Set tsc = production.%Save()
  if tsc = 0
  {
      Do result.%Set("Status",$SELECT($$$ISERR(tsc):$SYSTEM.Status.GetOneErrorText(tsc)))
      Write result.%ToJSON()
      quit
  }
  do ##class(Ens.Director).UpdateProduction()
  //TODO: Domain 目前写死
  set tsc = ..AddSubscriber("HLHT",PubSub.SubscriberName,PubSub.SubscriberBusinessHostName)

  if tsc = 0
  {
      //失败返回消息并回退删除已经添加的BO
      Do result.%Set("Status",$SELECT($$$ISERR(tsc):$SYSTEM.Status.GetOneErrorText(tsc)))
      Write result.%ToJSON()
      do ..RollBackConfigItem(production,BusinessHost,PubSub)
      quit $$$OK
  } 
  set tsc = ##Class(EnsLib.PubSub.Utils).AddSubscription("HLHT",PubSub.SubscriberName,PubSub.SubTopic)

    if tsc = 0
  {
      //失败返回错误并回退添加的BO 和 subscriber
      Do result.%Set("Status",$SELECT($$$ISERR(tsc):$SYSTEM.Status.GetOneErrorText(tsc)))
      Write result.%ToJSON()
      do ..RollBackConfigItem(production,BusinessHost,PubSub)
      do ..RollBackSubscriber(PubSub)
      quit $$$OK
  } 
  
    if tsc = 0
  {
      Do result.%Set("Status",$SELECT($$$ISERR(tsc):$SYSTEM.Status.GetOneErrorText(tsc)))
      Write result.%ToJSON()
      quit
  } 
  Do result.%Set("Status","订阅者注册成功")
  Write result.%ToJSON()
  quit $$$OK
}

/// 失败回退BO
ClassMethod RollBackConfigItem(Production As Ens.Config.Production, BusinessHost As Ens.Config.Item, PubSub As HCC.Service.Rest.PubSubModel) As %Status
{
  #Dim Con as Ens.Config.Item
   job ##class(Ens.Director).EnableConfigItem(PubSub.SubscriberBusinessHostName,0)
   set key= Production.Items.Find(BusinessHost."%%OID")
   do Production.Items.RemoveAt(key)
   do ##class(Ens.Config.Item).%DeleteId()
   do Production.%Save()
   do ##class(Ens.Director).UpdateProduction()
}

/// 回退订阅者
ClassMethod RollBackSubscriber(PubSub As HCC.Service.Rest.PubSubModel) As %Status
{
    set a = ""
    set SubscriberName= PubSub.SubscriberName
    &SQL(select %ID into :a from EnsLib.PubSub.Subscriber where Name = :SubscriberName)
    //TODO: 写死的domain name
    set tsc = ##class(EnsLib.PubSub.Utils).DeleteSubscriber(a,"HLHT")
    quit tsc
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
    //set cm.BusiHostStatus=obj.BusiHostStatus
    Set cm.SubAuth=obj.SubAuth
    Set cm.SubscriberBusinessHostName=obj.SubscriberBusinessHostName
    Set cm.SubscriberEndPointURL=obj.SubscriberEndPointURL
    Set cm.SubTopic=obj.SubTopic
    //set cm.WSDL=obj.WSDL
    Set cm.SubscriptionName=obj.SubscriptionName
    Set cm.SubscriberName=obj.SubscriberName
    quit $$$OK
}

/// 保存到subscriber 
ClassMethod AddSubscriber(pDomain As %String = "", pName As %String, pTarget As %String = "", pAddress As %String = "") As %Status
{
   
    #dim tSubscriber as EnsLib.PubSub.Subscriber
	Set tSC = $$$OK
	Do {
		Set tSubscriber = ##class(EnsLib.PubSub.Subscriber).%New()
		Set tSubscriber.Name = pName
        set tSubscriber.DomainName= ##class(EnsLib.PubSub.DomainName).%OpenId(pDomain)
		Set tSubscriber.Target = pTarget
		Set tSubscriber.Address = pAddress
		Set tSC = tSubscriber.%Save()
		If $$$ISERR(tSC) Quit
	} While(0)
	Quit tSC
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
	Set error.errormessage=""
	If obj.%Get("SubscriberBusinessHostName") = "" {
		Set error.errormessage = "业务操作组件为空"_$CHAR(10)_error.errormessage
	}	
	
	If obj.%Get("SubscriberEndPointURL") = "" {
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
	If error.errormessage '= ""
    {
        Quit 0
    }
	Quit 1
}

/// 获取全部订阅者
ClassMethod GetAllSubscribers() As %Status
{
   
    //TODO: 标准类名为HCC.SVR.Prod.BO.StandardHCCOutBound
    set myquery="select a.ID, a.DomainName ,a.Name ,a.Target, b.Topic,c.ClassName FROM  EnsLib_PubSub.Subscriber as a inner join EnsLib_PubSub.Subscription as b on a.ID = b.Subscriber inner join Ens_Config.Item as c on a.Target = c.Name where c.ClassName ='HCC.SVR.Prod.BO.StandardHCCOutBound'"
    #Dim JSONResult AS AllSubscriber
    set JSONResult = ##class(HCC.Service.Rest.AllSubscriber).%New()
   
    SET tStatement = ##class(%SQL.Statement).%New()
    SET qStatus = tStatement.%Prepare(myquery)
    IF qStatus'=1 {WRITE "%Prepare failed:" DO $System.Status.DisplayError(qStatus) QUIT}
    SET rset = tStatement.%Execute()
    WHILE rset.%Next() {
         #Dim col as HCC.Service.Rest.PubSubModel = ##Class(HCC.Service.Rest.PubSubModel).%New()
      set col.SubTopic= rset.%Get("Topic")
      set col.SubscriberBusinessHostName=rset.%Get("Target")
      set col.SubscriberName =rset.%Get("Name")
      set col.SubscriberID= rset.%Get("ID")
      do JSONResult.Subscribers.Insert(col)
    }
   do JSONResult.%JSONExportToString(.result)
  
   Write result
   QUIT $$$OK
}

/// rest map
XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
      <Route Url="/test" Method="GET" Call="test"/>
      <Route Url="/newsubscriber" Method="POST" Call="NewSubscriber" />
      <Route Url="/editsubscriber/:id" Method="PUT" Call="EditSubscriber" />
      <Route Url="/removesubscriber/:id" Method="DELETE" Call="RemoveSubscriber"/>
      <Route Url="/getsubscriberlist" Method="GET" Call="GetAllSubscribers"/>
</Routes>
}

}
