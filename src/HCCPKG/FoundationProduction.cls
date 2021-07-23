Class HCCPKG.FoundationProduction Extends Ens.Production [ Not ProcedureBlock ]
{

XData ProductionDefinition
{
<Production Name="HCCPKG.FoundationProduction" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>1</ActorPoolSize>
  <Item Name="Ens.Activity.Operation.Local" Category="" ClassName="Ens.Activity.Operation.Local" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="HCC.SVR.Prod.BS.HIPMessageServer" Category="" ClassName="HCC.SVR.Prod.BS.HIPMessageServer" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="HCC.SVR.Prod.BP.MainControl" Category="" ClassName="HCC.SVR.Prod.BP.MainControl" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="HCC.SVR.Prod.BP.SubscribeAndPublish" Category="" ClassName="HCC.SVR.Prod.BP.SubscribeAndPublish" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="HCC.SVR.Prod.BO.StandardHCCOutBound" Category="" ClassName="HCC.SVR.Prod.BO.StandardHCCOutBound" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="RegistryID">MockSys||HCC||1</Setting>
    <Setting Target="Adapter" Name="SOAPCredentials">ws</Setting>
  </Item>
  <Item Name="HCC.SVR.Prod.BO.SearchCDAOperation" Category="" ClassName="HCC.SVR.Prod.BO.SearchCDAOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="HCC.SVR.Prod.BO.SaveCDAOperation" Category="" ClassName="HCC.SVR.Prod.BO.SaveCDAOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="EnsLib.PubSub.PubSubOperation" Category="" ClassName="EnsLib.PubSub.PubSubOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
