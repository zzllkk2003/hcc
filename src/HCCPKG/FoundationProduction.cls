Class HCCPKG.FoundationProduction Extends Ens.Production [ Not ProcedureBlock ]
{

XData ProductionDefinition
{
<Production Name="HCCPKG.FoundationProduction" TestingEnabled="true" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>1</ActorPoolSize>
  <Item Name="Ens.Activity.Operation.Local" Category="" ClassName="Ens.Activity.Operation.Local" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="HCC.SVR.Prod.BS.HIPMessageServer" Category="" ClassName="HCC.SVR.Prod.BS.HIPMessageServer" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="HCC.SVR.Prod.BP.MainControl" Category="" ClassName="HCC.SVR.Prod.BP.MainControl" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="MsgSchemaValidate">1</Setting>
  </Item>
  <Item Name="HCC.SVR.Prod.BP.SubscribeAndPublish" Category="" ClassName="HCC.SVR.Prod.BP.SubscribeAndPublish" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="HCC.SVR.Prod.BO.StandardHCCOutBound" Category="" ClassName="HCC.SVR.Prod.BO.StandardHCCOutBound" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="RegistryID"></Setting>
    <Setting Target="Adapter" Name="SOAPCredentials">ws</Setting>
    <Setting Target="Adapter" Name="WebServiceURL">http://172.19.86.217:52773/csp/healthshare/mocksys/EMR.WS.PatientService.cls</Setting>
  </Item>
  <Item Name="HCC.SVR.Prod.BO.SaveCDAOperation" Category="" ClassName="HCC.SVR.Prod.BO.SaveCDAOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="EnsLib.PubSub.PubSubOperation" Category="" ClassName="EnsLib.PubSub.PubSubOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="DomainName">HLHT</Setting>
  </Item>
  <Item Name="HCC.SVR.Prod.BO.AccessCDAOperation" Category="" ClassName="HCC.SVR.Prod.BO.AccessCDAOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="DocAccessXSL">E:\1234\DocumentAccess.xsl</Setting>
  </Item>
  <Item Name="HCC.SVR.Prod.BO.RetrieveCDAOperation" Category="" ClassName="HCC.SVR.Prod.BO.RetrieveCDAOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="DocRetrieveXSL">E:\1234\DocRetrieve.xsl</Setting>
  </Item>
</Production>
}

}
