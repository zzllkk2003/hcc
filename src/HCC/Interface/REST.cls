/// Author: QP
/// Version: 1.0
/// Date:2021/07/08
/// RESTful interface for HCC management
Class HCC.Interface.REST Extends %CSP.REST
{

Parameter HandleCorsRequest = 1;

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
<Route Url="/DocumentHTML/:Id" Method="GET" Call="GetDocumentHTML"/>
<Route Url="/Document/:Id" Method="GET" Call="GetDocument"/>
<Route Url="/Document/:Id" Method="DELETE" Call="DeleteDoc"/>
<Route Url="/GenDocument/:Id" Method="GET" Call="GenerateDocFromSQL"/>
<Route Url="/DataSet" Method="GET" Call="ListDE"/>
<Route Url="/DataSet/:Id" Method="GET" Call="GetDE"/>
<Route Url="/DocSection/:Doctype" Method="GET" Call="GetDocSections"/>
<Route Url="/SystemSetting" Method="GET" Call="GetSystemSetting"/>
</Routes>
}

/// 根据文档号，输出其HTML格式
/// pDocNo：文档编号
ClassMethod GetDocumentHTML(pDocNo) As %Status
{
        #dim tSC As %Status = $$$OK    
        #dim e As %Exception.AbstractException    
        Try     
        {    
            Set tInput = ##class(TRIP.GXWD.MODEL.GXWDDOC).%OpenId(6).Content
            Set tXSL = "C:\HCC\XSLT\C32ViewerJW.xsl"
            Set tHTML=""
            If tInput '="" 
            {
                Set tInput = $P(tInput,"<?xml version=""1.0"" encoding=""UTF-8""?>",2)
                Set tParams="",tCompiledStyleSheet=""
                
                Set tSC=##class(%XML.XSLT.CompiledStyleSheet).CreateFromFile(tXSL,.tCompiledStyleSheet)
                If $$$ISERR(tSC) Quit
                
                Set tSC=##class(%XML.XSLT.Transformer).TransformStringWithCompiledXSL(tInput,tCompiledStyleSheet,.tHTML,,.tParams)
                //W:($$$ISERR(tSC)) tSC
                Set tHTML = $ZCVT(tHTML,"I","UTF8")
                W tHTML
            }        
        } 
        Catch (e) 
        {        
            Set tSC=e.AsStatus()    
        }    
        Quit tSC
}

/// 产生文档 
ClassMethod GenerateDocFromSQL(pDocNo As %String) As %Status
{
    Set tOutput=""
    Set tRet = ##class(HCC.SQL.Tools).GenerateHCCDocument(pDocNo,.tOutput)
    W tOutput
    Return tRet
}

/// 删除文档的SQL记录 
ClassMethod DeleteDoc(pDocNo As %String) As %Status
{
    W ##class(HCC.SQL.Tools).ClearDoc(pDocNo)
    Return $$$OK
}

/// 获取文档章节设置 
ClassMethod GetDocSections(pDocType As %Numeric) As %Status
{
    &SQL(
    SELECT JSON_ARRAYAGG(JSON_OBJECT('Section':DocumentSection,'Cardinality':Cardinality))
      INTO :tRet
      FROM WS_DOC.DocumentConfig
    )
    W tRet
    Return $$$OK
}

/// 更新文档章节设置 
ClassMethod UpdateDocSections(pDocType As %Numeric, pJSONSetting As %String) As %Status
{
    Return $$$OK
}

/// 列出所有数据元
ClassMethod ListDE() As %Status
{
    &SQL(
        SELECT JSON_ARRAYAGG(
        JSON_OBJECT(
        'name':name, 
        'category':category, 
        'description':description, 
        'format':format, 
        'valueset':valueset, 
        'datatype':datatype
        ))
      INTO :tRet
      FROM HCC.WSDataElement
    )
    W tRet
    Return $$$OK
}

/// 获取数据元
ClassMethod GetDE(pDECode As %String) As %Status
{
    Set tRet=""
    Set tDEName = "WS.DE."_$Replace(pDECode,".","")
    Try
    { 
        &SQL(
            SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
            'name':name, 
            'category':category, 
            'description':description, 
            'format':format, 
            'valueset':valueset, 
            'datatype':datatype
            ))
          INTO :tRet
          FROM HCC.WSDataElement
          WHERE name = :tDEName
        )
        
        If SQLCODE = 100
        {
            Set tRet="数据元"_pDECode_"不存在"
        }
    }
    Catch (e)
    {
        Set tRet=$$$ERROR(-10001,"数据元"_pDECode_"不存在")
    }
    w tRet
    Return $$$OK
}

/// 更新&新建数据元
ClassMethod PutDE(pDEJSON) As %Status
{
}

/// 列出值集所有元素
ClassMethod ListValueSetItems() As %Status
{
}

/// 获取值集元素
ClassMethod GetValueSetItem() As %Status
{
}

/// 更新值集元素
ClassMethod PutValueSetItem() As %Status
{
}

/// 注册订阅者
ClassMethod RegisterSubscriber() As %Status
{
}

/// 注册订阅
ClassMethod RegisterSubscription() As %Status
{
}

/// 获得HCC系统设置
ClassMethod GetSystemSetting() As %Status
{
    Set tOutput = ##class(%DynamicObject).%New()
    Set tOutput."跳过值集检查" = $bit(^WS.Setting.Validation,1)
    Set tOutput."跳过数据元必要性约束检查" = $bit(^WS.Setting.Validation,2)
    Set tOutput."跳过章节必要性检查" = $bit(^WS.Setting.Validation,3)
    w tOutput.%ToJSON()
    Return $$$OK
}

/// 设置HCC系统设置
ClassMethod SetSystemSettting() As %Status
{
}

}
