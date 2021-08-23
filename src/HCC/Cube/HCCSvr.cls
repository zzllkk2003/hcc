/// 
Class HCC.Cube.HCCSvr Extends %DeepSee.CubeDefinition [ DependsOn = HCC.SVR.ServiceLog, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="HCCSvr" displayName="互联互通服务统计" disabled="false" abstract="false" sourceClass="HCC.SVR.ServiceLog" namedFactNums="true" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false" enableSqlRestrict="false">
  <dimension name="ServiceType" disabled="false" hasAll="false" allCaption="All ServiceType" allDisplayName="ServiceType" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="ServiceType" disabled="false" sourceProperty="ServiceType" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="2">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="EndTS" disabled="false" hasAll="false" allCaption="All EndTS" allDisplayName="EndTS" sourceProperty="EndTS" type="time" calendar="gregorian" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="EYear" disabled="false" timeFunction="Year" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="3">
      </level>
      <level name="EMonthYear" disabled="false" timeFunction="MonthYear" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="4">
      </level>
      <level name="EDate" disabled="false" timeFunction="DayMonthYear" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="5">
      </level>
      <level name="EHour" disabled="false" timeFunction="HourNumber" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="6">
      </level>
      <level name="EMinute" disabled="false" timeFunction="MinuteNumber" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="7">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="Result" disabled="false" hasAll="false" allCaption="All Result" allDisplayName="Result" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Result" disabled="false" sourceProperty="Result" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="8">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="BeginTS" disabled="false" hasAll="false" allCaption="All BeginTS" allDisplayName="BeginTS" sourceProperty="BeginTS" type="time" calendar="gregorian" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Year" disabled="false" timeFunction="Year" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="9">
      </level>
      <level name="MonthYear" disabled="false" timeFunction="MonthYear" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="10">
      </level>
      <level name="Date" disabled="false" timeFunction="DayMonthYear" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="11">
      </level>
      <level name="Hour" disabled="false" timeFunction="HourNumber" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="12">
      </level>
      <level name="Minute" disabled="false" timeFunction="MinuteNumber" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="13">
      </level>
    </hierarchy>
  </dimension>
  <measure name="Duration" disabled="false" sourceProperty="Duration" aggregate="SUM" type="number" hidden="false" searchable="false" factNumber="1">
  </measure>
</cube>
}

Parameter DOMAIN;

}
