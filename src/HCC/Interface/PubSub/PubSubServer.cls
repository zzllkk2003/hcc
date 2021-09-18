/// 
/// Author: Jeff Liu
/// Date: 2021-07-15 09:58:06
/// LastEditTime: 2021-09-18 13:39:17
/// LastEditors: Jeff Liu
/// Description: 
/// FilePath: /hcc/src/HCC/Interface/PubSub/PubSubServer.cls
/// Jeff.liu@intersytems.com
/// 
/// 接收订阅消息
Class HCC.Interface.PubSub.PubSubServer Extends %CSP.REST
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
   set tsc=$$$OK
    #Dim PubSub as HCC.Interface.PubSub.PubSubModel
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
  
  Set PubSub = ##class(HCC.Interface.PubSub.PubSubModel).%New()
  Do ..CopyToPubSubModelFromJSON(.PubSub,obj)
  set PubSub.SubscriberBusinessHostName=$ZCONVERT(PubSub.SubscriberBusinessHostName,"I","UTF8") 
  set PubSub.SubscriberName =$ZCONVERT(PubSub.SubscriberName,"I","UTF8")
  set bName = PubSub.SubscriberBusinessHostName
    set cID=""
   // 加入 BO
    &sql(select %ID into :cID from Ens_Config.Item where Name = :bName)
	// if bo doesn't exist add 
   if ( cID ="")
   {	   
  #Dim BusinessHost as Ens.Config.Item = ##class(Ens.Config.Item).%New()
  #Dim Setting as Ens.Config.Setting = ##class(Ens.Config.Setting).%New()
  #dim SettingCre as Ens.Config.Setting = ##class(Ens.Config.Setting).%New()
  #dim SettingSA as Ens.Config.Setting = ##class(Ens.Config.Setting).%New()
  Set Setting.Name="WebServiceURL"
  Set Setting.Value=PubSub.SubscriberEndPointURL
  #Dim production as Ens.Config.Production = ##class(Ens.Config.Production).%OpenId("HCCPKG.FoundationProduction")
  Set BusinessHost.ClassName="HCC.SVR.Prod.BO.StandardHCCOutBound"
  
  Set BusinessHost.Name=PubSub.SubscriberBusinessHostName
  Set BusinessHost.Production = production
  Do BusinessHost.Settings.Insert(Setting)
  // 插入soap credential
  Set SettingCre.Name="SOAPCredentials"
  Set SettingCre.Value=PubSub.SubAuth
  // 插入soap action
  Set SettingSA.Name="SoapAction"
  set SettingSA.Target="Host"
  Set SettingSA.Value=PubSub.SoapAction
  Do BusinessHost.Settings.Insert(SettingCre)
  Do BusinessHost.Settings.Insert(SettingSA)
  Do production.Items.Insert(BusinessHost)
  Set tsc = production.%Save()
  If tsc = 0
  {
      Do result.%Set("Status",$ZCONVERT($SELECT($$$ISERR(tsc):$SYSTEM.Status.GetOneErrorText(tsc)),"O","UTF8"))
      Write result.%ToJSON()
      Quit
  }
  Do ##class(Ens.Director).UpdateProduction()
   }
   else
   {
     
	   set cItem= ##class(Ens.Config.Item).%OpenId(cID)

	      for index=1:1:cItem.Settings.Count()
	      {
		      if (cItem.Settings.GetAt(index).Name ="WebServiceURL")
		           {
			           set newS =##class(Ens.Config.Setting).%New()
			           set newS.Name="WebServiceURL"
			           set newS.Value=PubSub.SubscriberEndPointURL
			           do cItem.Settings.SetAt(newS,index)
			           }
			       if (cItem.Settings.GetAt(index).Name ="SOAPCredentials")  
			       {
				       set newS =##class(Ens.Config.Setting).%New()
			           set newS.Name="SOAPCredentials"
			           set newS.Value=PubSub.SubAuth
			           do cItem.Settings.SetAt(newS,index)
				       }  
                 if (cItem.Settings.GetAt(index).Name ="SoapAction")  
			       {
				       set newS =##class(Ens.Config.Setting).%New()
			           set newS.Name="SoapAction"
                 set newS.Target="Host"
			           set newS.Value=PubSub.SoapAction
			           do cItem.Settings.SetAt(newS,index)
				       }  
		      }
		do cItem.%Save() 
		    Do ##class(Ens.Director).UpdateProduction() 	  
	   }
   
   
  //TODO: Domain 目前写死
  set SubscriberExit= ##class(EnsLib.PubSub.Subscriber).FindSubscriberId("HLHT",PubSub.SubscriberName)
  if (SubscriberExit ="")
  {
  Set tsc = ..AddSubscriber("HLHT",PubSub.SubscriberName,PubSub.SubscriberBusinessHostName)
  
  If tsc = 0
  {
      //失败返回消息并回退删除已经添加的BO
      Do result.%Set("Status",$SELECT($$$ISERR(tsc):$SYSTEM.Status.GetOneErrorText(tsc)))
      Write result.%ToJSON()
      Do ..RollBackConfigItem(production,BusinessHost."%%OID",PubSub.SubscriberBusinessHostName)
      do ##class(Ens.Config.Item).%DeleteId(BusinessHost.%Id())
      Quit $$$OK
  } 
  }
  else{
    &sql(update EnsLib_PubSub.Subscriber set Target=:bName where Name= :PubSub.SubscriberName)
  }
  
   set sqlstr= "select Topic from EnsLib_PubSub.Subscription where Subscriber = ?"
    Set tStatement = ##class(%SQL.Statement).%New()
    Set qStatus = tStatement.%Prepare(sqlstr)
    If qStatus'=1 {Write "%Prepare failed:" Do $SYSTEM.Status.DisplayError(qStatus) Quit}
    Set rset = tStatement.%Execute(SubscriberExit)
    set TMarker=""
    while rset.%Next()
    {
	    set topic = rset.%Get("Topic")
	    if (topic = PubSub.SubTopic)
	    {SET TMarker=1}
	 }
	 if (TMarker '=1){
  Set tsc = ##Class(EnsLib.PubSub.Utils).AddSubscription("HLHT",PubSub.SubscriberName,PubSub.SubTopic)}

    If tsc = 0
  {
      //失败返回错误并回退添加的BO 和 subscriber
      Do result.%Set("Status",$SELECT($$$ISERR(tsc):$SYSTEM.Status.GetOneErrorText(tsc)))
      Write result.%ToJSON()
      //Do ..RollBackConfigItem(production,BusinessHost."%%OID",PubSub.SubscriberBusinessHostName)
      //do ##class(Ens.Config.Item).%DeleteId(BusinessHost.%Id())
     // Do ..RollBackSubscriber(PubSub)
      Quit $$$OK
  } 
  
    If tsc = 0
  {
      Do result.%Set("Status",$SELECT($$$ISERR(tsc):$SYSTEM.Status.GetOneErrorText(tsc)))
      Write result.%ToJSON()
      Quit
  } 
  Do result.%Set("Status",$ZCONVERT("订阅者注册/更新成功","O","UTF8"))
  Write result.%ToJSON()
  
  Quit $$$OK
}

/// 失败回退BO
ClassMethod RollBackConfigItem(Production As Ens.Config.Production, BusinessHostOID As %String, PubSubBusinessHostName As %String) As %Status
{
   Job ##class(Ens.Director).EnableConfigItem(PubSubBusinessHostName,0)
   Set key= Production.Items.Find(BusinessHostOID)
   Do Production.Items.RemoveAt(key)
   //Do ##class(Ens.Config.Item).%DeleteId(BusinessHostID)
   Do Production.%Save()
   Do ##class(Ens.Director).UpdateProduction()
   quit $$$OK
}

/// 回退订阅者
ClassMethod RollBackSubscriber(PubSub As HCC.Interface.PubSub.PubSubModel) As %Status
{
    Set a = ""
    Set SubscriberName= PubSub.SubscriberName
    &SQL(select %ID into :a from EnsLib.PubSub.Subscriber where Name = :SubscriberName)
    //TODO: 写死的domain name
    Set tsc = ##class(EnsLib.PubSub.Utils).DeleteSubscriber(a,"HLHT")
    Quit tsc
}

/// 修改订阅者
/// 
ClassMethod EditSubscriber() As %Status
{
    Set sc = $$$OK
    
    Return sc
}

/// 删除订阅者
/// EnsLib.PubSub.Utils
ClassMethod RemoveSubscriber(ID As %String) As %Status
{
	set a =""
   set b =""
   Set result  ={}
    #dim Sub as EnsLib.PubSub.Subscriber 
    #dim ConItem as Ens.Config.Item
    set Sub = ##class(EnsLib.PubSub.Subscriber).%OpenId(ID)
    if Sub=""
    {
	    Do result.%Set("Status",$ZCONVERT("订阅者未找到","O","UTF8"))
	    Write result.%ToJSON()
        Quit $$$OK
	    }
    Set tsc = ##class(EnsLib.PubSub.Utils).DeleteSubscriber(ID,"HLHT") 
      If tsc = 0
  {
      Do result.%Set("Status",$SELECT($$$ISERR(tsc):$SYSTEM.Status.GetOneErrorText(tsc)))
      Write result.%ToJSON()
      Quit $$$OK
  } 
  #Dim production as Ens.Config.Production = ##class(Ens.Config.Production).%OpenId("HCCPKG.FoundationProduction")
  set ConfigItemName= Sub.Target
  set myquery= "select ID from Ens_Config.Item where Name= ? and ClassName='HCC.SVR.Prod.BO.StandardHCCOutBound'"
  Set tStatement = ##class(%SQL.Statement).%New()
    Set qStatus = tStatement.%Prepare(myquery)
    If qStatus'=1 {Write "%Prepare failed:" Do $SYSTEM.Status.DisplayError(qStatus) Quit}
    Set rset = tStatement.%Execute(ConfigItemName)
    While rset.%Next() {
      Set a= rset.%Get("ID")    
    }
    if a=""
    {
	    Do result.%Set("Status",$ZCONVERT("订阅者未找到","O","UTF8"))
	    Write result.%ToJSON()
        Quit $$$OK
	    }
  set ConItem=##class(Ens.Config.Item).%OpenId(a)
  set tsc= ..RollBackConfigItem(production,ConItem."%%OID",Sub.Target)
  do ##class(Ens.Config.Item).%DeleteId(a)
  Do result.%Set("Status",$ZCONVERT("订阅者已删除","O","UTF8"))
  Write result.%ToJSON()
    Quit tsc
}

/// json转换到订阅发布模型
ClassMethod CopyToPubSubModelFromJSON(ByRef cm As HCC.Interface.PubSub.PubSubModel, obj As %DynamicObject) As %Status
{
    //set cm.BusiHostStatus=obj.BusiHostStatus
    Set cm.SubAuth=obj.SubAuth
    Set cm.SubscriberBusinessHostName=obj.SubscriberBusinessHostName
    Set cm.SubscriberEndPointURL=obj.SubscriberEndPointURL
    Set cm.SubTopic=obj.SubTopic
    set cm.SoapAction=obj.SoapAction
    Set cm.SubscriberName=obj.SubscriberName
    Quit $$$OK
}

/// 保存到subscriber 
ClassMethod AddSubscriber(pDomain As %String = "", pName As %String, pTarget As %String = "", pAddress As %String = "") As %Status
{
    #dim tSubscriber as EnsLib.PubSub.Subscriber
    
    Set tSC = $$$OK
	Do {
		Set tSubscriber = ##class(EnsLib.PubSub.Subscriber).%New()
		Set tSubscriber.Name = pName
        Set tSubscriber.DomainName= ##class(EnsLib.PubSub.DomainName).%OpenId(pDomain)
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
		Set error.errormessage = $ZCONVERT("业务操作组件为空","O","UTF8")_$CHAR(10)_error.errormessage
	}	
	
	If obj.%Get("SubscriberEndPointURL") = "" {
		Set error.errormessage = $ZCONVERT("订阅者url为空","O","UTF8")_$CHAR(10)_error.errormessage
	}

    If obj.%Get("SubTopic") = "" {
		Set error.errormessage = $ZCONVERT("订阅主题为空","O","UTF8")_$CHAR(10)_error.errormessage
	}
    If obj.%Get("SubscriberName") = "" {
		Set error.errormessage = $ZCONVERT("订阅者名为空","O","UTF8")_$CHAR(10)_error.errormessage
	}
    If obj.%Get("SoapAction") = "" {
		Set error.errormessage = $ZCONVERT("订阅者SoapAction为空","O","UTF8")_$CHAR(10)_error.errormessage
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
		//set %response.ContentType = "application/json"
   
    //TODO: 标准类名为HCC.SVR.Prod.BO.StandardHCCOutBound
    Set myquery="select a.ID, a.DomainName ,a.Name ,a.Target, b.Topic, b.ID as SID, c.ClassName FROM  EnsLib_PubSub.Subscriber as a left join EnsLib_PubSub.Subscription as b on a.ID = b.Subscriber left join Ens_Config.Item as c on a.Target = c.Name where c.ClassName ='HCC.SVR.Prod.BO.StandardHCCOutBound'"
    #Dim JSONResult AS AllSubscriber
    Set JSONResult = ##class(HCC.Interface.PubSub.AllSubscriber).%New()
   
    Set tStatement = ##class(%SQL.Statement).%New()
    Set qStatus = tStatement.%Prepare(myquery)
    If qStatus'=1 {Write "%Prepare failed:" Do $SYSTEM.Status.DisplayError(qStatus) Quit}
    Set rset = tStatement.%Execute()
    While rset.%Next() {
         #Dim col as HCC.Interface.PubSub.PubSubModel = ##Class(HCC.Interface.PubSub.PubSubModel).%New()
      Set col.SubTopic= rset.%Get("Topic")
      Set col.SubscriberBusinessHostName=$ZCONVERT(rset.%Get("Target"),"O","UTF8")
      Set col.SubscriberName =$ZCONVERT(rset.%Get("Name"),"O","UTF8")
      Set col.SubscriberID= rset.%Get("ID")
      set col.SubscriptionID = rset.%Get("SID")
      Do JSONResult.Subscribers.Insert(col)
    }
   Do JSONResult.%JSONExportToString(.result)
  
   Write result
   Quit $$$OK
}

/// 获取全部topic
ClassMethod GetAllTopics() As %Status
{
	set myquery="SELECT KeyName,DataValue from Ens_Util.LookupTable WHERE TableName ='HCC.SVR.Prod.LT.ActionSchema' "
	
  set dynamicArray =##class(%Library.DynamicArray).%New()
	SET tStatement = ##class(%SQL.Statement).%New()
  SET qStatus = tStatement.%Prepare(myquery)
   IF qStatus'=1 {WRITE "%Prepare failed:" DO $System.Status.DisplayError(qStatus) QUIT}
  SET rset = tStatement.%Execute()
  set counter = 0
  //set Topic = "Topics"
  WHILE rset.%Next() {
	  set dynamicObject =##class(%Library.DynamicObject).%New()
	  set topic=rset.%Get("KeyName")
	  set schemaName=rset.%Get("DataValue")
    do dynamicObject.%Set("TopicName",topic)
    do dynamicObject.%Set("SchemaName",schemaName)
	  do dynamicArray.%Push(dynamicObject)
	  set counter= counter+1
	  }
  set array= dynamicArray.%ToJSON()
  write "{ ""Topics"":"_array_"}"
  quit $$$OK
}

ClassMethod RemoveSubscription(ID As %String) As %Status
{
	Set result  ={}
  &sql( delete from EnsLib_PubSub.Subscription where %ID = :ID)
  IF SQLCODE<0 
	{
		Do result.%Set("Status",$ZCONVERT("删除失败，错误信息：","O","UTF8")_SQLCODE_%msg)
       Write result.%ToJSON()
		quit $$$OK
		
		}
	Do result.%Set("Status",$ZCONVERT("订阅已删除","O","UTF8"))
    Write result.%ToJSON()
	quit $$$OK
}

ClassMethod test() As %Status
{
	w "test"
	q 1
}

/// rest map
XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
      <Route Url="/test" Method="GET" Call="test"/>
      <Route Url="/newsubscriber" Method="POST" Call="NewSubscriber" />
      <Route Url="/gettopiclist" Method="GET" Call="GetAllTopics" />
      <Route Url="/removesubscriber/:id" Method="DELETE" Call="RemoveSubscriber"/>
      <Route Url="/getsubscriberlist" Method="GET" Call="GetAllSubscribers"/>
      <Route Url="/removesubscription/:id" Method="DELETE" Call="RemoveSubscription"/>      
</Routes>
}

}
