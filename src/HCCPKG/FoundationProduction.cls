/// 
/// Author: Jeff Liu
/// Date: 2021-08-26 11:02:59
/// LastEditTime: 2021-08-27 17:56:04
/// LastEditors: Jeff Liu
/// Description: 
/// FilePath: /hcc/src/HCCPKG/FoundationProduction.cls
/// Jeff.liu@intersytems.com
/// 
Class HCCPKG.FoundationProduction Extends Ens.Production [ Not ProcedureBlock ]
{

XData ProductionDefinition
{
<Production Name="HCCPKG.FoundationProduction" TestingEnabled="true" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>1</ActorPoolSize>
  <Item Name="Ens.Activity.Operation.Local" Category="" ClassName="Ens.Activity.Operation.Local" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
  </Item>
  <Item Name="HCC.SVR.Prod.BS.HIPMessageServer" Category="" ClassName="HCC.SVR.Prod.BS.HIPMessageServer" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
  </Item>
  <Item Name="HCC.SVR.Prod.BP.MainControl" Category="" ClassName="HCC.SVR.Prod.BP.MainControl" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="MsgSchemaValidate">1</Setting>
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
  </Item>
  <Item Name="HCC.SVR.Prod.BP.SubscribeAndPublish" Category="" ClassName="HCC.SVR.Prod.BP.SubscribeAndPublish" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
  </Item>
  <Item Name="HCC.SVR.Prod.BO.SaveCDAOperation" Category="" ClassName="HCC.SVR.Prod.BO.SaveCDAOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
  </Item>
  <Item Name="EnsLib.PubSub.PubSubOperation" Category="" ClassName="EnsLib.PubSub.PubSubOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="DomainName">HLHT</Setting>
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
  </Item>
  <Item Name="HCC.SVR.Prod.BO.AccessCDAOperation" Category="" ClassName="HCC.SVR.Prod.BO.AccessCDAOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="DocAccessXSL">/isc/irishealth/mgr/HCC/xsl/DocumentAccess.xsl</Setting>
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
  </Item>
  <Item Name="HCC.SVR.Prod.BO.RetrieveCDAOperation" Category="" ClassName="HCC.SVR.Prod.BO.RetrieveCDAOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="DocRetrieveXSL">/isc/irishealth/mgr/HCC/xsl/DocRetrieve.xsl</Setting>
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
  </Item>
  <Item Name="HCC.SVR.Prod.BP.SubscribeAndPublishSync" Category="" ClassName="HCC.SVR.Prod.BP.SubscribeAndPublishSync" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
  </Item>
  <Item Name="HCC.SVR.Prod.BO.StandardHCCOutBound" Category="" ClassName="HCC.SVR.Prod.BO.StandardHCCOutBound" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="WebServiceURL">http://172.19.822225.68:52773/csp/healthshare/hcc/services/HCC.SVR.Prod.BS.HIPMessageServer.cls</Setting>
    <Setting Target="Adapter" Name="Credentials">ws</Setting>
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
  </Item>
  <Item Name="EMR" Category="" ClassName="HCC.SVR.Prod.BO.StandardHCCOutBound" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="WebServiceURL">http://bjsvmse01:52773/csp/healthshare/mocksys/services/EMR.WS.PatientService.cls</Setting>
    <Setting Target="Adapter" Name="SOAPCredentials">ws</Setting>
    <Setting Target="Host" Name="SoapAction">urn:hl7-org:v3/EMR.WS.PatientService.HIPMessageServer</Setting>
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
  </Item>
</Production>
}

}
