Class TRIPPKG.FoundationProduction Extends Ens.Production [ Not ProcedureBlock ]
{

XData ProductionDefinition
{
<Production Name="TRIPPKG.FoundationProduction" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>1</ActorPoolSize>
  <Item Name="Ens.Activity.Operation.Local" Category="" ClassName="Ens.Activity.Operation.Local" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="TRIP.JHFW.BP.TRIP00BPL" Category="" ClassName="TRIP.JHFW.BP.TRIP00BPL" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="MsgSchemaValidate">0</Setting>
    <Setting Target="Host" Name="MsgValueSetValidate">0</Setting>
  </Item>
  <Item Name="TRIP.JHFW.BS.JiaoHuService" Category="" ClassName="TRIP.JHFW.BS.JiaoHuService" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="TRIP.JHFW.BP.SubscribeAndPublish" Category="" ClassName="TRIP.JHFW.BP.SubscribeAndPublish" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="EnsLib.PubSub.PubSubOperation" Category="" ClassName="EnsLib.PubSub.PubSubOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="TRIP.GXWD.BO.Operation" Category="" ClassName="TRIP.GXWD.BO.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="DocSchemaValidate">0</Setting>
    <Setting Target="Host" Name="DocValueSetValidate">0</Setting>
  </Item>
  <Item Name="TRIP.JHFW.BO.TestService" Category="" ClassName="TRIP.JHFW.BO.TestService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="EMR" Category="" ClassName="HCC.JHFW.BO.JiaoHuServiceSoap" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="RegistryID">EMR||HCC||1</Setting>
    <Setting Target="Adapter" Name="SOAPCredentials">WS</Setting>
  </Item>
  <Item Name="PACS" Category="" ClassName="HCC.JHFW.BO.JiaoHuServiceSoap" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="RegistryID">PACS||HCC||1</Setting>
    <Setting Target="Adapter" Name="SOAPCredentials">WS</Setting>
  </Item>
</Production>
}

}
