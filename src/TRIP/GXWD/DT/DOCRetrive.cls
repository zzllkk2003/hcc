Class TRIP.GXWD.DT.DOCRetrive Extends Ens.DataTransformDTL [ DependsOn = (TRIP.GXWD.MODEL.DocRetrieveModel, EnsLib.EDI.XML.Document) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='TRIP.GXWD.MODEL.DocRetrieveModel' targetClass='EnsLib.EDI.XML.Document' targetDocType='RCMR_IN000030UV01:RCMR_IN000030UV01' create='new' language='objectscript' >
<foreach property='source.DocRetrieveResults(1)' key='k1' >
<assign value='source.DocRetrieveResults.(k1).DocId' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).id(1).item(1).extension}' action='set' />
<assign value='"SUBJ"' property='target.{controlActProcess(1).subject(k1).typeCode}' action='set' />
<assign value='"DOCCLIN"' property='target.{controlActProcess(1).subject(k1).clinicalDocument().classCode}' action='set' />
<assign value='"EVN"' property='target.{controlActProcess(1).subject(k1).clinicalDocument().id()}' action='set' />
<assign value='"2.16.156.10011.2.5.1.24"' property='target.{controlActProcess(1).subject(k1).clinicalDocument().id().item().root}' action='set' />
<assign value='"2.16.156.10011.2.5.1.23"' property='target.{controlActProcess(1).subject(k1).clinicalDocument().code().codeSystem}' action='set' />
<assign value='"文档类型代码"' property='target.{controlActProcess(1).subject(k1).clinicalDocument().code().codeSystemName}' action='set' />
<assign value='source.DocRetrieveResults.(k1).DocName' property='target.{controlActProcess(1).subject(k1).clinicalDocument().code().displayName.value}' action='set' />
<assign value='##class(Ens.Util.Time).ConvertDateTime(source.DocRetrieveResults.(k1).DocCreatTime,"%q(1)","%q(0)")' property='target.{controlActProcess(1).subject(k1).clinicalDocument().effectiveTime().value}' action='set' />
<assign value='"N"' property='target.{controlActProcess(1).subject(k1).clinicalDocument().confidentialityCode().code}' action='set' />
<assign value='"2.16.156.10011.2.5.1.25"' property='target.{controlActProcess(1).subject(k1).clinicalDocument().confidentialityCode().codeSystem}' action='set' />
<assign value='"文档保密级别代码"' property='target.{controlActProcess(1).subject(k1).clinicalDocument().confidentialityCode().codeSystemName}' action='set' />
<assign value='"正常访问保密级别"' property='target.{controlActProcess(1).subject(k1).clinicalDocument().confidentialityCode().displayName.value}' action='set' />
<assign value='"RCT"' property='target.{controlActProcess(1).subject(k1).clinicalDocument().recordTarget().typeCode}' action='set' />
<assign value='"PAT"' property='target.{controlActProcess(1).subject(k1).clinicalDocument().recordTarget().patient().classCode}' action='set' />
<assign value='source.DocRetrieveResults.(k1).DocCode' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).code(1).code}' action='set' />
<assign value='"2.16.156.10011.2.5.1.4"' property='target.{controlActProcess(1).subject(k1).clinicalDocument().recordTarget().patient().id.item(1).root}' action='set' />
<assign value='source.DocRetrieveResults.(k1).PatId' property='target.{controlActProcess(1).subject(k1).clinicalDocument().recordTarget().patient().id.item(1).extension}' action='set' />
<assign value='"2.16.156.10011.1.12"' property='target.{controlActProcess(1).subject(k1).clinicalDocument().recordTarget().patient().id.item(2).root}' action='set' />
<assign value='source.DocRetrieveResults.(k1).PatInHosCode' property='target.{controlActProcess(1).subject(k1).clinicalDocument().recordTarget().patient().id.item(2).extension}' action='set' />
<assign value='"2.16.156.10011.1.11"' property='target.{controlActProcess(1).subject(k1).clinicalDocument().recordTarget().patient().id.item(3).root}' action='set' />
<assign value='source.DocRetrieveResults.(k1).PatOutHosCode' property='target.{controlActProcess(1).subject(k1).clinicalDocument().recordTarget().patient().id.item(3).extension}' action='set' />
<assign value='source.DocRetrieveResults.(k1).PatEffectiveLowTime' property='target.{controlActProcess(1).subject(k1).clinicalDocument().recordTarget().patient().effectiveTime.low.value}' action='set' />
<assign value='"2.16.156.10011.1.3"' property='target.{controlActProcess(1).subject(k1).clinicalDocument().recordTarget().patient().choice.patientPerson.id.item().root}' action='set' />
<assign value='source.DocRetrieveResults.(k1).VersionNumber' property='target.{controlActProcess(1).subject(k1).clinicalDocument().versionNumber.value}' action='set' />
<assign value='source.DocRetrieveResults.(k1).PatCardId' property='target.{controlActProcess(1).subject(k1).clinicalDocument().recordTarget().patient().choice.patientPerson.id.item().extension}' action='set' />
<assign value='"PSN"' property='target.{controlActProcess(1).subject(k1).clinicalDocument().recordTarget().patient().choice.patientPerson.classCode}' action='set' />
<assign value='"INSTANCE"' property='target.{controlActProcess(1).subject(k1).clinicalDocument().recordTarget().patient().choice.patientPerson.determinerCode}' action='set' />
<assign value='source.DocRetrieveResults.(k1).PatName' property='target.{controlActProcess(1).subject(k1).clinicalDocument().recordTarget().patient().choice.patientPerson.name().item().part().value}' action='set' />
<assign value='"ORG"' property='target.{controlActProcess(1).subject(k1).clinicalDocument().recordTarget().patient().providerOrganization.classCode}' action='set' />
<assign value='"INSTANCE"' property='target.{controlActProcess(1).subject(k1).clinicalDocument().recordTarget().patient().providerOrganization.determinerCode}' action='set' />
<assign value='"2.16.156.10011.1.5"' property='target.{controlActProcess(1).subject(k1).clinicalDocument().recordTarget().patient().providerOrganization.id().item().root}' action='set' />
<assign value='source.DocRetrieveResults.(k1).ProHosCode' property='target.{controlActProcess(1).subject(k1).clinicalDocument().recordTarget().patient().providerOrganization.id().item().extension}' action='set' />
<assign value='source.DocRetrieveResults.(k1).ProHosName' property='target.{controlActProcess(1).subject(k1).clinicalDocument().recordTarget().patient().providerOrganization.name.item().part().value}' action='set' />
<assign value='"PART"' property='target.{controlActProcess(1).subject(k1).clinicalDocument().recordTarget().patient().providerOrganization.organizationContains().id}' action='set' />
<assign value='"2.16.156.10011.1.26"' property='target.{controlActProcess(1).subject(k1).clinicalDocument().recordTarget().patient().providerOrganization.organizationContains().id.item().root}' action='set' />
<assign value='source.DocRetrieveResults.(k1).DeptCode' property='target.{controlActProcess(1).subject(k1).clinicalDocument().recordTarget().patient().providerOrganization.organizationContains().id.item().extension}' action='set' />
<assign value='"AUT"' property='target.{controlActProcess(1).subject(k1).clinicalDocument().author().typeCode}' action='set' />
<assign value='"ASSIGNED"' property='target.{controlActProcess(1).subject(k1).clinicalDocument().author().assignedAuthor().classCode}' action='set' />
<assign value='"2.16.156.10011.1.4"' property='target.{controlActProcess(1).subject(k1).clinicalDocument().author().assignedAuthor().id().item().root}' action='set' />
<assign value='source.DocRetrieveResults.(k1).DocUserCode' property='target.{controlActProcess(1).subject(k1).clinicalDocument().author().assignedAuthor().id().item().extension}' action='set' />
<assign value='"PSN"' property='target.{controlActProcess(1).subject(k1).clinicalDocument().author().assignedAuthor().choice.assignedPerson.classCode}' action='set' />
<assign value='"INSTANCE"' property='target.{controlActProcess(1).subject(k1).clinicalDocument().author().assignedAuthor().choice.assignedPerson.determinerCode}' action='set' />
<assign value='source.DocRetrieveResults.(k1).DocUserName' property='target.{controlActProcess(1).subject(k1).clinicalDocument().author().assignedAuthor().choice.assignedPerson.name.item().part().value}' action='set' />
<assign value='"CST"' property='target.{controlActProcess(1).subject(k1).clinicalDocument().custodian().typeCode}' action='set' />
<assign value='"ASSIGNED"' property='target.{controlActProcess(1).subject(k1).clinicalDocument().custodian().assignedCustodian().classCode}' action='set' />
<assign value='"ORG"' property='target.{controlActProcess(1).subject(k1).clinicalDocument().custodian().assignedCustodian().representedOrganization().classCode}' action='set' />
<assign value='"INSTANCE"' property='target.{controlActProcess(1).subject(k1).clinicalDocument().custodian().assignedCustodian().representedOrganization().determinerCode}' action='set' />
<assign value='"2.16.156.10011.1.5"' property='target.{controlActProcess(1).subject(k1).clinicalDocument().custodian().assignedCustodian().representedOrganization().id().item().root}' action='set' />
<assign value='source.DocRetrieveResults.(k1).RepHosCode' property='target.{controlActProcess(1).subject(k1).clinicalDocument().custodian().assignedCustodian().representedOrganization().id().item().extension}' action='set' />
<assign value='source.DocRetrieveResults.(k1).RepHosName' property='target.{controlActProcess(1).subject(k1).clinicalDocument().custodian().assignedCustodian().representedOrganization().name.item().part().value}' action='set' />
</foreach>
<assign value='"2.16.156.10011.2.5.1.1"' property='target.{id().root}' action='set' />
<assign value='##Class(%SYSTEM.Util).CreateGUID()' property='target.{id().extension}' action='set' />
<assign value='##class(Ens.Util.Time).ConvertDateTime($HOROLOG,"%q(3)","%Y%m%d%H%M%S")' property='target.{creationTime()}' action='set' />
<assign value='"2.16.156.10011.2.5.1.2"' property='target.{interactionId().root}' action='set' />
<assign value='"P"' property='target.{processingCode().code}' action='set' />
<assign value='"AL"' property='target.{acceptAckCode().code}' action='set' />
<assign value='"RCV"' property='target.{receiver().typeCode}' action='set' />
<assign value='"DEV"' property='target.{receiver().device().classCode}' action='set' />
<assign value='"INSTANCE"' property='target.{receiver().device().determinerCode}' action='set' />
<assign value='"2.16.156.10011.2.5.1.3"' property='target.{receiver().device().id().item().root}' action='set' />
<assign value='source.SenderID' property='target.{receiver().device().id().item().extension}' action='set' />
<assign value='"SND"' property='target.{sender().typeCode}' action='set' />
<assign value='"DEV"' property='target.{sender().device().classCode}' action='set' />
<assign value='"INSTANCE"' property='target.{sender().device().determinerCode}' action='set' />
<assign value='"2.16.156.10011.2.5.1.3"' property='target.{sender().device().id().item().root}' action='set' />
<assign value='"TRIP"' property='target.{sender().device().id().item().extension}' action='set' >
<annotation>发送方默认为平台 代号暂定为TRIP</annotation>
</assign>
<assign value='source.AckTypeCode' property='target.{acknowledgement().typeCode}' action='set' />
<assign value='"2.16.156.10011.2.5.1.1"' property='target.{acknowledgement().targetMessage().id().root}' action='set' />
<assign value='source.queryId' property='target.{acknowledgement().targetMessage().id().extension}' action='set' />
<assign value='source.ResultDetail' property='target.{acknowledgement().acknowledgementDetail().text.value}' action='set' />
<assign value='"INFO"' property='target.{controlActProcess().classCode}' action='set' />
<assign value='"EVN"' property='target.{controlActProcess().moodCode}' action='set' />
<assign value='source.queryId' property='target.{controlActProcess().queryAck().queryId.extension}' action='set' />
<assign value='source.queryResponseCode' property='target.{controlActProcess().queryAck().queryResponseCode().code}' action='set' />
<assign value='source.ResultQuantity' property='target.{controlActProcess().queryAck().resultTotalQuantity.value}' action='set' />
</transform>
}

}
