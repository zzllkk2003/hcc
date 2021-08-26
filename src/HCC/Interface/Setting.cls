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

/// 设置HCC系统设置
ClassMethod SetSystemSettting() As %Status
{
}

/// 启动后台产生SQL互联互通文档的服务
/// 考虑是否用系统task实现！？
ClassMethod StartSQLDocGenJob()
{
    job ##class(HCC.Util).CreateDocTask()
    W 1
}

/// 停止后台产生SQL互联互通文档的服务
ClassMethod StopSQLDocGenJob()
{
    W ##class(HCC.Util).StopCreateDocTask()
}

}
