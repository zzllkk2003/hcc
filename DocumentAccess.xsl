<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc"
    xmlns:isc="http://extension-functions.intersystems.com" xmlns:exsl="http://exslt.org/common"
    xmlns:set="http://exslt.org/sets" exclude-result-prefixes="isc sdtc exsl set">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/DocRetrieveModel">      
    <RCMR_IN000030UV01 ITSVersion="XML_1.0" xmlns="urn:hl7-org:v3"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="urn:hl7-org:v3 ../multicacheschemas/RCMR_IN000030UV01.xsd">      
        <!--id-消息流水号-->
        <id root="2.16.156.10011.2.5.1.1" extension="{MessageID}"/>
        <!--creationTime-消息创建时间-->
        <creationTime value="{ResultResponseTime}"/>
        <!--interactionId-消息的服务标识-->
        <interactionId root="2.16.156.10011.2.5.1.2" extension="RCMR_IN000030UV01"/>
        <!--processingCode-处理代码。标识此消息是否是产品、训练、调试系统的一部分。D：调试；P：产品；T：训练-->
        <processingCode code="P"/>
        <!--processingModeCode-处理模型代码。定义此消息是一个文档处理还是一个初始装载的一部分。A：存档；I：初始装载；R：从存档中恢复；T：当前处理，间隔传递。-->
        <processingModeCode/>
        <!--acceptAckCode-接收确认类型 AL：总是确认；NE：从不确认；ER：仅在错误/或拒绝时确认；SU：仅在成功完成时确认。-->
        <acceptAckCode code="AL"/>
        <receiver typeCode="RCV">
            <device classCode="DEV" determinerCode="INSTANCE">
                <id>
                    <item root="2.16.156.10011.2.5.1.3" extension="{SenderID}"/>
                </id>
            </device>
        </receiver>
        <sender typeCode="SND">
            <device classCode="DEV" determinerCode="INSTANCE">
                <id>
                    <item root="2.16.156.10011.2.5.1.3" extension="{ReceiverID}"/>
                </id>
            </device>
        </sender>
        <!--typeCode为处理结果，AA表示成功 AE表示失败-->
        <acknowledgement typeCode="AA">
            <targetMessage>
                <id root="2.16.156.10011.2.5.1.1" extension="1ee83ff1-08ab-4fe7-b573-ea777e9bad51"/>
            </targetMessage>
            <acknowledgementDetail>
                <text value="{ResultDetail}"/>
            </acknowledgementDetail>
        </acknowledgement>
        <controlActProcess classCode="INFO" moodCode="EVN">
            <!--可重复-->
            <xsl:apply-templates select="DocRetrieveResults/LatestDocs"></xsl:apply-templates>
            <queryAck>
                <queryId extension="22a0f9e0-4454-11dc-a6be-3603d6866807"/>
                <queryResponseCode code="OK"/>
                <resultTotalQuantity value="{ResultQuantity}"/>
            </queryAck>
        </controlActProcess>
    </RCMR_IN000030UV01>
   </xsl:template>
    <xsl:template match="DocRetrieveResults/LatestDocs">
       <subject typeCode="SUBJ">
           <clinicalDocument classCode="DOCCLIN" moodCode="EVN">
               <!--文档流水号-->
               <id>
                   <item root="2.16.156.10011.2.5.1.24" extension="{DocId}"/>
               </id>
               <!--文档类型代码-->
               <code code="{DocCode}" codeSystem="2.16.156.10011.2.5.1.23" codeSystemName="文档类型代码">
                   <displayName value="{DocName}"/>
               </code>
               <statusCode/>
               <!--文档生成日期时间-->
               <xsl:apply-templates select ="DocCreatTime"></xsl:apply-templates>
               <!--文档保密级别-->
               <confidentialityCode code="N" codeSystem="2.16.156.10011.2.5.1.25"
                   codeSystemName="文档保密级别代码">
                   <displayName value="正常访问保密级别"/>
               </confidentialityCode>
               <!--文档版本号-->
               <versionNumber value="{VersionNumber}"/>
               <recordTarget typeCode="RCT">
                   <patient classCode="PAT">
                       <!--本地系统的患者ID -->
                       <id>
                           <!--PatientID-->
                           <item root="2.16.156.10011.2.5.1.4" extension="{Patient/PatId}"/>
                           <!--住院号标识 -->
                           <item root="2.16.156.10011.1.12" extension="{PatInHosCode}"/>
                           <!--门诊号标识 -->
                           <item root="2.16.156.10011.1.11" extension="{PatOutHosCode}"/>
                       </id>
                       <statusCode/>
                       <!--患者就诊日期时间-->
                       <effectiveTime>
                           <low value="{translate(PatEffectiveLowTime,'-T:Z','')}"/>
                           <high/>
                       </effectiveTime>
                       <patientPerson classCode="PSN" determinerCode="INSTANCE">
                           <!--患者身份证号-->
                           <id>
                               <item root="2.16.156.10011.1.3" extension="{Patient/PatCardId}"/>
                           </id>
                           <!--姓名-->
                           <name xsi:type="DSET_EN">
                               <item>
                                   <part value="{Patient/PatName}"/>
                               </item>
                           </name>
                       </patientPerson>
                       <providerOrganization classCode="ORG" determinerCode="INSTANCE">
                           <id>
                               <item root="2.16.156.10011.1.5" extension="{ProHosCode}"/>
                           </id>
                           <name xsi:type="DSET_EN">
                               <item>
                                   <part value="{ProHosName}"/>
                               </item>
                           </name>
                           <!--科室标识-->
                           <organizationContains classCode="PART">
                               <id>
                                   <item root="2.16.156.10011.1.26" extension="{DeptCode}"/>
                               </id>
                           </organizationContains>
                       </providerOrganization>
                   </patient>
               </recordTarget>
               <!--文档创建者-->
               <author typeCode="AUT">
                   <time/>
                   <assignedAuthor classCode="ASSIGNED">
                       <id>
                           <item root="2.16.156.10011.1.4" extension="{DocUserCode}"/>
                       </id>
                       <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                           <name xsi:type="DSET_EN">
                               <item>
                                   <part value="{DocUserName}"/>
                               </item>
                           </name>
                       </assignedPerson>
                   </assignedAuthor>
               </author>
               <!--文档保管单位-->
               <custodian typeCode="CST">
                   <assignedCustodian classCode="ASSIGNED">
                       <representedOrganization classCode="ORG" determinerCode="INSTANCE">
                           <id>
                               <item root="2.16.156.10011.1.5" extension="{RepHosCode}"/>
                           </id>
                           <name xsi:type="DSET_EN">
                               <item>
                                   <part value="{RepHosName}"/>
                               </item>
                           </name>
                       </representedOrganization>
                   </assignedCustodian>
               </custodian>
           </clinicalDocument>
       </subject>
   </xsl:template>
    <xsl:template match="DocCreatTime">
        <effectiveTime value ="{translate(.,'-T:Z','')}">          
        </effectiveTime>
    </xsl:template>
</xsl:stylesheet>