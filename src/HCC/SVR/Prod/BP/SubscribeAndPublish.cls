/// 
Class HCC.SVR.Prod.BP.SubscribeAndPublish Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='HCC.SVR.Prod.MSG.SVRRequest' response='HCC.SVR.Prod.MSG.SVRResponse' height='2000' width='2000' >
<context>
<property name='TargetList' type='EnsLib.PubSub.Target' collection='list' instantiate='0' />
<property name='k1' type='%Integer' initialexpression='1' instantiate='0' />
<property name='Target' type='EnsLib.PubSub.Target' instantiate='0' />
<property name='Source' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='Iterator' type='%Integer' initialexpression='1' instantiate='0' />
<property name='EventName' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='tResponse' type='HCC.SVR.Prod.MSG.SVRResponse' instantiate='1' />
</context>
<sequence xend='200' yend='1000' >
<assign name="设定订阅topic" property="context.EventName" value="request.Action" action="set" xpos='200' ypos='250' >
<annotation><![CDATA[根据请求消息的Action]]></annotation>
</assign>
<call name='查询事件订阅列表' target='EnsLib.PubSub.PubSubOperation' async='0' xpos='200' ypos='350' >
<request type='EnsLib.PubSub.Request' >
<assign property="callrequest.Topic" value="request.Action" action="set" />
<assign property="callrequest.DomainName" value="&quot;HLHT&quot;" action="set" />
</request>
<response type='EnsLib.PubSub.Response' >
<assign property="context.TargetList" value="callresponse.TargetList" action="set" />
</response>
</call>
<if name='判断是否有订户' condition='context.TargetList.Count()=0' xpos='200' ypos='450' xend='200' yend='800' >
<true>
<code name='业务未实现，没有订户' xpos='200' ypos='600' >
<![CDATA[ set context.tResponse= ##class(HCC.Utils.ResponseHelper).ReturnErrorMsgNoSenderInfo(request.MsgId,"异常服务代码，系统未实现该业务流程,没有订阅方.")]]>
</code>
</true>
<false>
<foreach name='发送请求消息到订阅者' property='context.TargetList' key='context.Iterator' xpos='470' ypos='600' xend='200' yend='650' >
<annotation><![CDATA[根据订阅列表发送消息到目标处理过程]]></annotation>
<assign name="取出Target" property="context.Target" value="context.TargetList.GetAt(context.Iterator)" action="set" xpos='200' ypos='250' />
<trace name='get' value='context.Target.Target' xpos='200' ypos='350' />
<call name='同步订阅者' target='@context.Target.Target' async='1' xpos='200' ypos='550' >
<request type='HCC.SVR.Prod.MSG.SVRRequest' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='HCC.SVR.Prod.MSG.SVRResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</foreach>
<code name='交互服务成功' xpos='470' ypos='700' >
<![CDATA[ set context.tResponse= ##class(HCC.Utils.ResponseHelper).ReturnSuccessMsgNoContentAndSenderInfo(request.MsgId)]]>
</code>
</false>
</if>
<assign name="返回消息" property="response" value="context.tResponse" action="set" xpos='200' ypos='900' />
</sequence>
</process>
}

}
