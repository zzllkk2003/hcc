Class HCC.SVR.Prod.DT.SearchDOCRetrive Extends Ens.DataTransformDTL [ DependsOn = (HCC.DocRepository.DocRetrieveModel, EnsLib.EDI.XML.Document) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='HCC.DocRepository.DocRetrieveModel' targetClass='EnsLib.EDI.XML.Document' targetDocType='RCMR_IN000030UV01:RCMR_IN000030UV01' create='new' language='objectscript' >
<foreach property='source.DocRetrieveResults(1)' key='k1' >
<assign value='source.DocRetrieveResults.(k1).DocId' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).id(1).item(1).extension}' action='set' />
<assign value='"SUBJ"' property='target.{controlActProcess(1).subject(k1).typeCode}' action='set' />
<assign value='"DOCCLIN"' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).classCode}' action='set' />
<assign value='"EVN"' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).id(1)}' action='set' />
<assign value='"2.16.156.10011.2.5.1.24"' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).id(1).item(1).root}' action='set' />
<assign value='"2.16.156.10011.2.5.1.23"' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).code(1).codeSystem}' action='set' />
<assign value='"文档类型代码"' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).code(1).codeSystemName}' action='set' />
<assign value='source.DocRetrieveResults.(k1).DocName' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).code(1).displayName.value}' action='set' />
<assign value='##class(Ens.Util.Time).ConvertDateTime(source.DocRetrieveResults.(k1).DocCreatTime,"%q(1)","%q(0)")' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).effectiveTime(1).value}' action='set' />
<assign value='"N"' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).confidentialityCode(1).code}' action='set' />
<assign value='"2.16.156.10011.2.5.1.25"' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).confidentialityCode(1).codeSystem}' action='set' />
<assign value='"文档保密级别代码"' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).confidentialityCode(1).codeSystemName}' action='set' />
<assign value='"正常访问保密级别"' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).confidentialityCode(1).displayName.value}' action='set' />
<assign value='"RCT"' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).recordTarget(1).typeCode}' action='set' />
<assign value='"PAT"' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).recordTarget(1).patient(1).classCode}' action='set' />
<assign value='source.DocRetrieveResults.(k1).DocCode' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).code(1).code}' action='set' />
<assign value='"2.16.156.10011.2.5.1.4"' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).recordTarget(1).patient(1).id.item(1).root}' action='set' />
<assign value='source.DocRetrieveResults.(k1).PatId' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).recordTarget(1).patient(1).id.item(1).extension}' action='set' />
<assign value='"2.16.156.10011.1.12"' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).recordTarget(1).patient(1).id.item(2).root}' action='set' />
<assign value='source.DocRetrieveResults.(k1).PatInHosCode' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).recordTarget(1).patient(1).id.item(2).extension}' action='set' />
<assign value='"2.16.156.10011.1.11"' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).recordTarget(1).patient(1).id.item(3).root}' action='set' />
<assign value='source.DocRetrieveResults.(k1).PatOutHosCode' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).recordTarget(1).patient(1).id.item(3).extension}' action='set' />
<assign value='source.DocRetrieveResults.(k1).PatEffectiveLowTime' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).recordTarget(1).patient(1).effectiveTime.low.value}' action='set' />
<assign value='"2.16.156.10011.1.3"' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).recordTarget(1).patient(1).choice.patientPerson.id.item(1).root}' action='set' />
<assign value='source.DocRetrieveResults.(k1).VersionNumber' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).versionNumber.value}' action='set' />
<assign value='source.DocRetrieveResults.(k1).PatCardId' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).recordTarget(1).patient(1).choice.patientPerson.id.item(1).extension}' action='set' />
<assign value='"PSN"' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).recordTarget(1).patient(1).choice.patientPerson.classCode}' action='set' />
<assign value='"INSTANCE"' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).recordTarget(1).patient(1).choice.patientPerson.determinerCode}' action='set' />
<assign value='source.DocRetrieveResults.(k1).PatName' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).recordTarget(1).patient(1).choice.patientPerson.name(1).item(1).part(1).value}' action='set' />
<assign value='"ORG"' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).recordTarget(1).patient(1).providerOrganization.classCode}' action='set' />
<assign value='"INSTANCE"' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).recordTarget(1).patient(1).providerOrganization.determinerCode}' action='set' />
<assign value='"2.16.156.10011.1.5"' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).recordTarget(1).patient(1).providerOrganization.id(1).item(1).root}' action='set' />
<assign value='source.DocRetrieveResults.(k1).ProHosCode' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).recordTarget(1).patient(1).providerOrganization.id(1).item(1).extension}' action='set' />
<assign value='source.DocRetrieveResults.(k1).ProHosName' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).recordTarget(1).patient(1).providerOrganization.name.item(1).part(1).value}' action='set' />
<assign value='"PART"' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).recordTarget(1).patient(1).providerOrganization.organizationContains(1).id}' action='set' />
<assign value='"2.16.156.10011.1.26"' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).recordTarget(1).patient(1).providerOrganization.organizationContains(1).id.item(1).root}' action='set' />
<assign value='source.DocRetrieveResults.(k1).DeptCode' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).recordTarget(1).patient(1).providerOrganization.organizationContains(1).id.item(1).extension}' action='set' />
<assign value='"AUT"' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).author(1).typeCode}' action='set' />
<assign value='"ASSIGNED"' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).author(1).assignedAuthor(1).classCode}' action='set' />
<assign value='"2.16.156.10011.1.4"' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).author(1).assignedAuthor(1).id(1).item(1).root}' action='set' />
<assign value='source.DocRetrieveResults.(k1).DocUserCode' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).author(1).assignedAuthor(1).id(1).item(1).extension}' action='set' />
<assign value='"PSN"' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).author(1).assignedAuthor(1).choice.assignedPerson.classCode}' action='set' />
<assign value='"INSTANCE"' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).author(1).assignedAuthor(1).choice.assignedPerson.determinerCode}' action='set' />
<assign value='source.DocRetrieveResults.(k1).DocUserName' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).author(1).assignedAuthor(1).choice.assignedPerson.name.item(1).part(1).value}' action='set' />
<assign value='"CST"' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).custodian(1).typeCode}' action='set' />
<assign value='"ASSIGNED"' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).custodian(1).assignedCustodian(1).classCode}' action='set' />
<assign value='"ORG"' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).custodian(1).assignedCustodian(1).representedOrganization(1).classCode}' action='set' />
<assign value='"INSTANCE"' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).custodian(1).assignedCustodian(1).representedOrganization(1).determinerCode}' action='set' />
<assign value='"2.16.156.10011.1.5"' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).custodian(1).assignedCustodian(1).representedOrganization(1).id(1).item(1).root}' action='set' />
<assign value='source.DocRetrieveResults.(k1).RepHosCode' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).custodian(1).assignedCustodian(1).representedOrganization(1).id(1).item(1).extension}' action='set' />
<assign value='source.DocRetrieveResults.(k1).RepHosName' property='target.{controlActProcess(1).subject(k1).clinicalDocument(1).custodian(1).assignedCustodian(1).representedOrganization(1).name.item(1).part(1).value}' action='set' />
</foreach>
<assign value='"2.16.156.10011.2.5.1.1"' property='target.{id(1).root}' action='set' />
<assign value='##Class(%SYSTEM.Util).CreateGUID()' property='target.{id(1).extension}' action='set' />
<assign value='##class(Ens.Util.Time).ConvertDateTime($HOROLOG,"%q(3)","%Y%m%d%H%M%S")' property='target.{creationTime(1)}' action='set' />
<assign value='"2.16.156.10011.2.5.1.2"' property='target.{interactionId(1).root}' action='set' />
<assign value='"P"' property='target.{processingCode(1).code}' action='set' />
<assign value='"AL"' property='target.{acceptAckCode(1).code}' action='set' />
<assign value='"RCV"' property='target.{receiver(1).typeCode}' action='set' />
<assign value='"DEV"' property='target.{receiver(1).device(1).classCode}' action='set' />
<assign value='"INSTANCE"' property='target.{receiver(1).device(1).determinerCode}' action='set' />
<assign value='"2.16.156.10011.2.5.1.3"' property='target.{receiver(1).device(1).id(1).item(1).root}' action='set' />
<assign value='source.SenderID' property='target.{receiver(1).device(1).id(1).item(1).extension}' action='set' />
<assign value='"SND"' property='target.{sender(1).typeCode}' action='set' />
<assign value='"DEV"' property='target.{sender(1).device(1).classCode}' action='set' />
<assign value='"INSTANCE"' property='target.{sender(1).device(1).determinerCode}' action='set' />
<assign value='"2.16.156.10011.2.5.1.3"' property='target.{sender(1).device(1).id(1).item(1).root}' action='set' />
<assign value='"TRIP"' property='target.{sender(1).device(1).id(1).item(1).extension}' action='set' >
<annotation>发送方默认为平台 代号暂定为TRIP</annotation>
</assign>
<assign value='source.AckTypeCode' property='target.{acknowledgement(1).typeCode}' action='set' />
<assign value='"2.16.156.10011.2.5.1.1"' property='target.{acknowledgement(1).targetMessage(1).id(1).root}' action='set' />
<assign value='source.queryId' property='target.{acknowledgement(1).targetMessage(1).id(1).extension}' action='set' />
<assign value='source.ResultDetail' property='target.{acknowledgement(1).acknowledgementDetail(1).text.value}' action='set' />
<assign value='"INFO"' property='target.{controlActProcess(1).classCode}' action='set' />
<assign value='"EVN"' property='target.{controlActProcess(1).moodCode}' action='set' />
<assign value='source.queryId' property='target.{controlActProcess(1).queryAck(1).queryId.extension}' action='set' />
<assign value='source.queryResponseCode' property='target.{controlActProcess(1).queryAck(1).queryResponseCode(1).code}' action='set' />
<assign value='source.ResultQuantity' property='target.{controlActProcess(1).queryAck(1).resultTotalQuantity.value}' action='set' />
</transform>
}

}
