/// Author: QP
/// Version: 1.0
/// Date:2021/08/23
/// RESTful interface for HCC system setting
Class HCC.Interface.Setting Extends %CSP.REST
{

Parameter HandleCorsRequest = 1;

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
<Route Url="/SystemSetting" Method="GET" Call="GetSystemSetting"/>
<Route Url="/StopSQLDocTask" Method="GET" Call="StopSQLDocGenJob"/>
<Route Url="/StartSQLDocTask" Method="GET" Call="StartSQLDocGenJob"/>
<Route Url="/SkipDEVal" Method="GET" Call="SkipDEValidation"/>
<Route Url="/EnforceDEVal" Method="GET" Call="EnforceDEValidation"/>
<Route Url="/SetXSLPath" Method="PUT" Call="SetXSLPath"/>
<Route Url="/SetDebugFilePath" Method="PUT" Call="SetDebugFilePath"/>
<Route Url="/EnableDebugMode" Method="GET" Call="EnableDebugMode"/>
<Route Url="/DisableDebugMode" Method="GET" Call="DisableDebugMode"/>

</Routes>
}

/// 获得HCC系统设置
ClassMethod GetSystemSetting() As %Status
{
    Set tOutput = ##class(%DynamicObject).%New()
    Set tOutput."跳过值集检查" = $bit(^WS.Setting.Validation,1)
    Set tOutput."跳过数据元必要性约束检查" = $bit(^WS.Setting.Validation,2)
    Set tOutput."跳过章节必要性检查" = $bit(^WS.Setting.Validation,3)
    Set tOutput.HostFacility=##class(%DynamicObject).%New()
    Set tOutput.HostFacility.Id = $LG($G(^HCC("HostFacility")),1)
    Set tOutput.HostFacility.Name=$LG($G(^HCC("HostFacility")),2)
    Set tOutput."XSLFilePath"=$G(^HCC("XSLFilePath"))
    Set tOutput."DocGenTask"=$G(^HCC("DocGenTask"))
    Set tOutput."Debug模式"=$G(^HCC("Debug"))

    w tOutput.%ToJSON()
    Return $$$OK
}

/// 禁用数据元约束检查
ClassMethod SkipDEValidation() As %Status
{
    Set tSC = ##class(HCC.Util).SkipDEValidation()
    W $$$ISOK(tSC)
    Quit tSC
}

/// 启用数据元约束检查
ClassMethod EnforceDEValidation() As %Status
{
    Set tSC = ##class(HCC.Util).EnforceDEValidation()
    W $$$ISOK(tSC)
    Quit tSC
}

/// 设置xsl目录
/// xsl 目录设置应该放在body中，格式为：
/// {"Path":"C:\HCC\XSLT1"}
/// 注意，路径字符串应该先以JSON方式转译。在IRIS中，可以用$ZCVT(tPath,"O","JSON")进行转译
ClassMethod SetXSLPath() As %Status
{
    #; Ensure we are only passed json
    If %request.ContentType'="application/json" 
    {  
        Set %response.Status=..#HTTP415UNSUPPORTEDMEDIATYPE
        Quit
    }

    If '$IsObject(%request.Content) 
    {
        Set tSC=$$$ERROR(-10001,"没有提交的Content")
        Set %response.Status=..#HTTP400BADREQUEST
        Quit    
    }

    #; Parse the content (JSON object)
    #dim tFilePath As %DynamicObject
    Set tFilePath=##class(%DynamicObject).%FromJSON(%request.Content)
    
    //Set tSC = ##class(HCC.Util).SetXSLPath($ZCVT(tFilePath.Path,"I","URI"))
    Set tSC = ##class(HCC.Util).SetXSLPath(tFilePath.Path)

    W $$$ISOK(tSC)
    Quit tSC
}

/// 启动Debug模式
ClassMethod EnableDebugMode() As %Status
{
    Set tSC = ##class(HCC.Util).EnableDebugMode()
    W $$$ISOK(tSC)
    Quit tSC
}

/// 禁用Debug模式
ClassMethod DisableDebugMode() As %Status
{
    Set tSC = ##class(HCC.Util).DisableDebugMode()
    W $$$ISOK(tSC)
    Quit tSC
}

/// 启动后台产生SQL互联互通文档的服务
/// 考虑是否用系统task实现！？
ClassMethod StartSQLDocGenJob()
{
    job ##class(HCC.Util).CreateDocTask()
    W 1
    Quit $$$OK
}

/// 停止后台产生SQL互联互通文档的服务
ClassMethod StopSQLDocGenJob()
{
    W ##class(HCC.Util).StopCreateDocTask()
    Quit $$$OK
}

/// 设置Debug模式下输出文档的路径
/// 输出文档的路径应该放在body中，格式为：
/// {"Path":"C:\HCC\XSLT1"}
/// 注意，路径字符串应该先以JSON方式转译。在IRIS中，可以用$ZCVT(tPath,"O","JSON")进行转译
ClassMethod SetDebugFilePath() As %Status
{
    #; Ensure we are only passed json
    If %request.ContentType'="application/json" 
    {  
        Set %response.Status=..#HTTP415UNSUPPORTEDMEDIATYPE
        Quit
    }

    If '$IsObject(%request.Content) 
    {
        Set tSC=$$$ERROR(-10001,"没有提交的Content")
        Set %response.Status=..#HTTP400BADREQUEST
        Quit    
    }

    #; Parse the content (JSON object)
    #dim tFilePath As %DynamicObject
    Set tFilePath=##class(%DynamicObject).%FromJSON(%request.Content)

    Set tSC = ##class(HCC.Util).SetDebugFilePath(tFilePath.Path)
    W $$$ISOK(tSC)
    Quit tSC
}

}
