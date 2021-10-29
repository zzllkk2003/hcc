/// 
Class HCC.Cube.DataQuality Extends %DeepSee.CubeDefinition [ DependsOn = HIP.DataGov.Log, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="DataQuality" displayName="数据质量分析" disabled="false" abstract="false" sourceClass="HIP.DataGov.Log" namedFactNums="true" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false" enableSqlRestrict="false">
  <dimension name="SQLTable" disabled="false" hasAll="false" allCaption="All SQLTable" allDisplayName="SQLTable" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="SQLTable" disabled="false" sourceProperty="SQLTable" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="2">
      </level>
      <level name="ColumnName" disabled="false" sourceProperty="ColumnName" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="3">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="ErrorCode" disabled="false" hasAll="false" allCaption="All ErrorCode" allDisplayName="ErrorCode" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="ErrorCode" disabled="false" sourceExpression="##class(HIP.DataGov.Code).GetDisplay(%source.ErrorCode)" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="4">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="Batch" disabled="false" hasAll="false" allCaption="All Batch" allDisplayName="Batch" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Batch" disabled="false" sourceProperty="Batch" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="5">
      </level>
    </hierarchy>
  </dimension>
  <listing name="detail" displayName="明细" disabled="false" listingType="table" fieldList="SQLTable,RecordId,ColumnName,Value,Error,ErrorCode,Batch">
  </listing>
</cube>
}

Parameter DOMAIN;

}
