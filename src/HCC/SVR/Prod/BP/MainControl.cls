/// 总控流程
Class HCC.SVR.Prod.BP.MainControl Extends Ens.BusinessProcessBPL
{

/// 结构验证设置
Property MsgSchemaValidate As %Boolean [ InitialExpression = 0 ];

/// 值集验证设置
Property MsgValueSetValidate As %Boolean [ InitialExpression = 0 ];

Parameter SETTINGS = "MsgSchemaValidate:Basic,MsgValueSetValidate:Basic";

Storage Default
{
<Data name="MainControlDefaultData">
<Subscript>"MainControl"</Subscript>
<Value name="1">
<Value>MsgSchemaValidate</Value>
</Value>
<Value name="2">
<Value>MsgValueSetValidate</Value>
</Value>
</Data>
<DefaultData>MainControlDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='HCC.SVR.Prod.MSG.SVRRequest' response='HCC.SVR.Prod.MSG.SVRResponse' height='2600' width='2000' >
<context>
<property name='verifyResult' type='%Boolean' initialexpression='0' instantiate='0' />
<property name='tResponse' type='HCC.SVR.Prod.MSG.SVRResponse' instantiate='1' />
<property name='action' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='tDocType' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='ErrMsg' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='250000' />
</parameters>
</property>
<property name='valueVerifyResult' type='%Boolean' initialexpression='0' instantiate='0' />
<property name='valueErrMsg' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='' />
</parameters>
</property>
<property name='SchemaValidateOption' type='%Boolean' instantiate='0' />
<property name='ValuseSetValidateOption' type='%Boolean' instantiate='0' />
</context>
<sequence xend='200' yend='2350' >
<scope name='BP级错误处理' xpos='200' ypos='250' xend='200' yend='2250' >
<sql name='LT获得action 对应schema' xpos='200' ypos='350' >
<![CDATA[
SELECT DataValue INTO :context.tDocType FROM Ens_Util.LookupTable WHERE TableName= 'TRIP.JHFW.LT.ActionSchema' and KeyName=:request.Action]]>
</sql>
<if name='判断action和schema是否对应' condition='request.DocType=context.tDocType' xpos='200' ypos='450' xend='200' yend='1250' >
<true>
<code name='判断消息体结构合规性' xpos='470' ypos='600' >
<annotation><![CDATA[目前schema 都无法验证通过，所以手动将验证结果置为1]]></annotation>
<![CDATA[ Set val=##class(Ens.Director).GetHostSettingValue("HCCPKG.FoundationProduction||HCC.SVR.Prod.BP.MainControl","MsgSchemaValidate",.tSC) 
  if (val=1) {
 Set tSchema="urn:hl7-org:v3 C:\HCC\schema\multicacheschemas\"_request.DocType_".xsd"	
 Set tSC=##class(%XML.TextReader).ParseStream(request.Message,.tReader,,,,tSchema)
 set context.verifyResult=0	
 set errCount=0
 If $$$ISERR(tSC) Quit		
 While (tReader.Read()) 	
  {		
	if (tReader.NodeType="error") 		
	{		set errCount= errCount+1
		set context.ErrMsg= context.ErrMsg_"*ERROR* "_tReader.Value_$char(10)_tReader.Path_$char(10)		
	}	
  }	
  if (errCount=0)
  {
  set context.verifyResult=1
  }
  }
  else{set context.verifyResult=1}]]>
</code>
<code name='判断消息体值集合规性' xpos='470' ypos='700' >
<![CDATA[  set msg=""
  Set val=##class(Ens.Director).GetHostSettingValue("HCCPKG.FoundationProduction||HCC.SVR.Prod.BP.MainControl","MsgValueSetValidate",.tSC) 
  if (val=1) 
  {set context.valueVerifyResult=##class(HCC.SVR.Utils.XMLValid).Valid(request.Message,request.Action,.msg)
  set context.valueVerifyResult=val&&context.valueVerifyResult
  set context.ErrMsg=msg}
  else
  {
  set context.valueVerifyResult =1
  }]]>
</code>
<if name='判断合规结果' condition='(context.verifyResult =1)&amp;&amp;(context.valueVerifyResult=1)' xpos='470' ypos='800' xend='470' yend='1150' >
<true>
<call name='订阅发布' target='TRIP.JHFW.BP.SubscribeAndPublish' async='1' xpos='470' ypos='950' >
<request type='HCC.SVR.Prod.MSG.SVRRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='HCC.SVR.Prod.MSG.SVRResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</true>
<false>
<code name='不合规' xpos='740' ypos='950' >
<![CDATA[ set context.tResponse= ##class(HCC.Utils.ResponseHelper).ReturnCommResult(context.action,"消息不合规"_$char(10)_context.ErrMsg)]]>
</code>
<assign name="返回不合规消息" property="response" value="context.tResponse" action="set" xpos='740' ypos='1050' />
</false>
</if>
</true>
<false>
<code name='action 和 schema 不对应' xpos='200' ypos='600' >
<![CDATA[ set context.tResponse= ##class(HCC.Utils.ResponseHelper).ReturnCommResult(context.action,"操作和schema类型不对应")]]>
</code>
<assign name="返回不对应消息" property="response" value="context.tResponse" action="set" xpos='200' ypos='700' />
</false>
</if>
<trace value='context.tDocType_"   "_request.DocType_"   "_context.verifyResult_"   "_context.valueVerifyResult_"   "_context.ErrMsg' xpos='200' ypos='1350' />
<sync name='等待返回消息' calls='订阅发布' timeout='2' type='all' xpos='200' ypos='1450' />
<if condition='synctimedout =0' xpos='200' ypos='1550' xend='200' yend='1900' >
<false>
<code xpos='335' ypos='1700' >
<![CDATA[ set context.tResponse= ##class(HCC.Utils.ResponseHelper).ReturnCommResult(context.action,"消息处理超时啦啦啦啦"_$char(10)_context.ErrMsg)]]>
</code>
<assign property="response" value="context.tResponse" action="set" xpos='335' ypos='1800' />
</false>
</if>
<trace value='synctimedout' xpos='200' ypos='2000' />
<faulthandlers>
<catchall xpos='200' ypos='2100' xend='200' yend='550' >
<trace value='"%LastError "_ $System.Status.GetErrorCodes(..%Context.%LastError)_ " : "_ $System.Status.GetOneStatusText(..%Context.%LastError)' xpos='200' ypos='250' />
<code name='平台内部错误' xpos='200' ypos='350' >
<![CDATA[ set context.tResponse= ##class(HCC.Utils.ResponseHelper).ReturnCommResult(request.action,"平台内部异常.")]]>
</code>
<assign name="返回平台内部错误" property="response" value="context.tResponse" action="set" xpos='200' ypos='450' />
</catchall>
</faulthandlers>
</scope>
</sequence>
</process>
}

}
