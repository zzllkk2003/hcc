/// HealthConnect消息及服务的一些统计示例<br/>
/// Business logic class defined by OpenAPI in HCC.Interface.Monitor.spec<br/>
/// Updated Sep 15, 2021 14:20:26
Class HCC.Interface.Monitor.impl Extends %REST.Impl [ ProcedureBlock ]
{

/// If ExposeServerExceptions is true, then details of internal errors will be exposed.
Parameter ExposeServerExceptions = 0;

/// 服务列表
ClassMethod getServices() As %Stream.Object
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
}

/// 包括总数，成功数（返回AA的数字），失败（返回AE），错误（内部错误，BS向web application返回500）。统计的时长为。。。<br/>
/// The method arguments hold values for:<br/>
///     action, action<br/>
ClassMethod getHCCServiceStatistic(action As %String) As %Stream.Object
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
}

/// 关于什么是服务暂时定义为：1. running production里的BS,2. REST服务，没在produciton中的SOAP暂时不考虑。输出为service名字，类型(BS或者REST),如果是REST打印url<br/>
/// The method arguments hold values for:<br/>
///     namespace<br/>
ClassMethod getOneNamespaceServices(namespace As %String) As %Stream.Object
{
    set currentNS=$Namespace
    set queryNS=$ZCVT(namespace,"U")
   	set formatter = ##class(%JSON.Formatter).%New()
    set code ="", message=""
    set pResponse=[], errorResponse={}
    
    zn queryNS
   
   	//process SQL
   	set sqlstring="call Ens_Util.Statistics_EnumerateHostStatus()"
   	set tStatement = ##class(%SQL.Statement).%New()
 	
 	set qStatus = tStatement.%Prepare(sqlstring)
   	IF qStatus'=1 {
	   set errorResponse.code=500
	   	set errorResponse.message = $SYSTEM.Status.GetErrorText(qStatus)
		set tSC= formatter.FormatToStream(pResponse,.formattedResponse)
        quit formattedResponse
	}
  	set resultSet = tStatement.%Execute()
  	
    // Process SQL resultSet
	if (resultSet.%SQLCODE = 0) 
    {   
	    while (resultSet.%Next() '= 0) 
    	{   
            if resultSet.%Get("Type")="BusinessService"
            {   set record = {}   //why not out?
                set record.hostname=resultSet.%Get("Name")
                set record.type=resultSet.%Get("Type")
                set record.status=resultSet.%Get("Status")
                //do dynamicObject.%Set(resultSet.%Get("Name"),resultSet.%Get("Type"))
           	    set stupid=pResponse.%Push(record)  
            }        
    	}   	
    }
    else 
    { 	set pResponse = {"code":500,"message":"sorry"}
    } 
  	set tSC= formatter.FormatToStream(pResponse,.formattedResponse)
   	zn currentNS
    quit formattedResponse
}

/// 获取单一命名空间正在运行的production的业务组件信息<br/>
/// The method arguments hold values for:<br/>
///     namespace<br/>
ClassMethod getBusinessHostInfo(namespace As %String) As %Stream.Object
{
     set currentNS=$Namespace
    set queryNS=$ZCVT(namespace,"U")
   	set formatter = ##class(%JSON.Formatter).%New()
    set code ="", message=""
    set pResponse=[], errorResponse={}
    
    zn queryNS
   
   	//process SQL
   	set sqlstring="call Ens_Util.Statistics_EnumerateHostStatus()"
   	set tStatement = ##class(%SQL.Statement).%New()
 	
 	set qStatus = tStatement.%Prepare(sqlstring)
   	IF qStatus'=1 {
	   set errorResponse.code=500
	   	set errorResponse.message = $SYSTEM.Status.GetErrorText(qStatus)
		set tSC= formatter.FormatToStream(pResponse,.formattedResponse)
        quit formattedResponse
	}
  	set resultSet = tStatement.%Execute()
  	
    // Process SQL resultSet
	if (resultSet.%SQLCODE = 0) 
    {   
	    while (resultSet.%Next() '= 0) 
    	{   set record = {}   //why not out?
            set record.hostname=resultSet.%Get("Name")
            set record.type=resultSet.%Get("Type")
            set record.status=resultSet.%Get("Status")
            //do dynamicObject.%Set(resultSet.%Get("Name"),resultSet.%Get("Type"))
           	set stupid=pResponse.%Push(record)          
    	}   	
    }
    else 
    { 	set pResponse = {"code":500,"message":"sorry"}
    } 
  	set tSC= formatter.FormatToStream(pResponse,.formattedResponse)

    //get rest app
    Set sc=##class(%REST.API).GetRESTApps(namespace,.appList)
    If $$$ISOK(sc) Set sc=##class(%REST.API).ListToArray(appList,.response)
    
   	zn currentNS
    quit formattedResponse
}

/// 统计当天（从零点到当前时间）各个组件的消息计数，或者当给定时间间隔，统计时间间隔内的消息计算<br/>
/// The method arguments hold values for:<br/>
///     namespace<br/>
///     action, action<br/>
///     beginTime, begin time<br/>
///     endTime, end time<br/>
ClassMethod getActivityData(namespace As %String, action As %String, beginTime As %String, endTime As %String) As %Stream.Object
{
    Set currentNS=$Namespace, queryNS=$ZCVT(namespace,"U")
   	zn queryNS
   	set formatter = ##class(%JSON.Formatter).%New()
   	SET tStatement = ##class(%SQL.Statement).%New()
    set pResponse=[], errorResponse={}
   	set SQLPrefix = "SELECT hostname, totalcount, totalduration/totalcount as AvgDuration, sitedimension FROM Ens_Activity_Data.Hours"

    //仅处理没有参数的查询
    if ('$DATA(action) & '$DATA(beginTime)) 
    {   SET sqlstring="SELECT hostname, totalcount, totalduration/totalcount as AvgDuration, sitedimension FROM  Ens_Activity_Data.Days where timeslot=(select max(timeslot) FROM Ens_Activity_Data.Days)"
   		SET qStatus = tStatement.%Prepare(sqlstring)
   		set resultSet = tStatement.%Execute()
    }elseif ('$DATA(beginTime) & $DATA(action))
    //处理有action参数没有时间段的查询
    {
        SET sqlstring="SELECT hostname, totalcount, totalduration/totalcount as AvgDuration, sitedimension FROM  Ens_Activity_Data.Days where timeslot=(select max(timeslot) FROM Ens_Activity_Data.Days) and sitedimension like '%"_action_"%'"
   		SET qStatus = tStatement.%Prepare(sqlstring)
   		set resultSet = tStatement.%Execute()

    }elseif ($DATA(beginTime) & '$DATA(action))
    //处理有时间段没有action参数的查询
    {   SET sqlstring="SELECT hostname, sum(totalcount) as totalcount, sum(totalduration)/sum(totalcount) as AvgDuration, sitedimension FROM Ens_Activity_Data.hours where timeslot>=? and timeslot<? group by hostname"  	
	   	SET qStatus = tStatement.%Prepare(sqlstring)
   		set resultSet = tStatement.%Execute(beginTime,endTime)
    }else 
    //处理有两种入参的查询
   	{	SET sqlstring="SELECT hostname, sum(totalcount) as totalcount, sum(totalduration)/sum(totalcount) as AvgDuration, sitedimension FROM Ens_Activity_Data.hours where timeslot>=? and timeslot<? and sitedimension =? group by hostname"	
	   	SET qStatus = tStatement.%Prepare(sqlstring)
   		set resultSet = tStatement.%Execute(beginTime,endTime,action)
   	}

   	#; //process time period
   	#; if ('$DATA(beginTime))
   	#; {	SET sqlstring="SELECT hostname, totalcount, totalduration/totalcount as AvgDuration, sitedimension FROM  Ens_Activity_Data.Days where timeslot=(select max(timeslot) FROM Ens_Activity_Data.Days)"
   	#; 	SET qStatus = tStatement.%Prepare(sqlstring)
   	#; 	set resultSet = tStatement.%Execute()
   	#; }else
   	#; { 
	#; 	SET sqlstring="SELECT hostname, totalcount, totalduration/totalcount as AvgDuration, sitedimension FROM Ens_Activity_Data.hours where timeslot>? and timeslot<? group by hostname"  	
	#;    	SET qStatus = tStatement.%Prepare(sqlstring)
   	#; 	set resultSet = tStatement.%Execute(beginTime,endTime)
	#; }
   
   	IF qStatus'=1 {
	    set pResponse={"code":500,"message":"prepare failed"}	
	    set tSC= formatter.FormatToStream(pResponse,.formattedResponse)
   	    w formattedResponse.Read()
        quit formattedResponse
	}
  	
	if (resultSet.%SQLCODE = 0) 
    {
	    while (resultSet.%Next() '= 0) {
           	set record = {}
           	set record.hostname=resultSet.%Get("HostName")
           	set record.totalcount=resultSet.%Get("TotalCount")
            set record.AvgDuration=resultSet.%Get("AvgDuration")
            set record.SiteDimension=resultSet.%Get("SiteDimension")
           	set stupid=pResponse.%Push(record)       
    	}
    }
    else { 	
        set pResponse = {"code":500,"message":"sorry"}
    }
 	 
  	set tSC= formatter.FormatToStream(pResponse,.formattedResponse)
   	zn currentNS
    quit formattedResponse
}

/// 通过level参数返回所有的entry或者只返回warning以上级别的记录<br/>
/// The method arguments hold values for:<br/>
///     namespace<br/>
///     level<br/>
///     beginTime, begin time<br/>
///     endTime, end time<br/>
ClassMethod getEventLog(namespace As %String, level As %String, beginTime As %String, endTime As %String) As %Stream.Object
{
    Set currentNS=$Namespace
   	set queryNS=$ZCVT(namespace,"U")
    set formatter = ##class(%JSON.Formatter).%New()
    set code ="", message=""
    set pResponse=[], errorResponse={}
    
    //Verify level = all or nothing
    //if ($DATA(level))
	//{   set all=1
    #;     set pResponse=##class(%Stream.GlobalCharacter).%New()
	#; 	do pResponse.Write("hello,world")
	#; 	quit pResponse
	#; }

   	zn queryNS
   	
    //process SQL   
   	SET sqlstring="SELECT timelogged,configname,text FROM Ens_Util.Log order by timelogged desc"
   	SET tStatement = ##class(%SQL.Statement).%New()
 	SET qStatus = tStatement.%Prepare(sqlstring)
   	IF qStatus'=1 {
	    set errorResponse.code=500
	   	set errorResponse.message = $SYSTEM.Status.GetErrorText(qStatus)
		set tSC= formatter.FormatToStream(pResponse,.formattedResponse)
        quit formattedResponse
	   	}
  	set resultSet = tStatement.%Execute()
  	
    // Process SQL resultSet
	if (resultSet.%SQLCODE = 0) 
    {   if ($DATA(pageNumber)&& $DATA(pageSize))
        {
            set startpoint= (pageNumber-1)*pageSize+1
            set count=1
            while (resultSet.%Next() '= 0){
            if ((count >=startpoint) && (count<(startpoint+pageSize))){ write "count:"_count,!
                set record=pResponse.%Push(resultSet.timelogged_","_resultSet.configname_","_resultSet.text,"string")
            }
            set count = count + 1
            }     

        }
        else{
    	    while (resultSet.%Next() '= 0){
            set record=pResponse.%Push(resultSet.timelogged_","_resultSet.configname_","_resultSet.text,"string")
            } 
        }    
    }
    else 
    { 	set pResponse = {"code":500,"message":"sorry"}
    }  
  	set tSC= formatter.FormatToStream(pResponse,.formattedResponse)
   Write formattedResponse.Read()
   	zn currentNS
    quit formattedResponse
}

}
