<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="xml" indent="yes"/>
	<xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
	<xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
	<xsl:include href="CDA-Support-Files/Location.xsl"/>
	<xsl:include href="CDA-Support-Files/Procedures.xsl"/>
	<xsl:template match="/Document">
		<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<realmCode code="CN"/>
			<typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
			<templateId root="2.16.156.10011.2.1.1.52"/>
			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			<title>术后首次病程记录</title>
			<!-- 文档机器生成时间 -->
			<xsl:call-template name="effectiveTime"/>
			<xsl:call-template name="Confidentiality"/>
			<xsl:call-template name="languageCode"/>
			<setId/>
			<versionNumber/>
			<!--文档记录对象（患者）-->
			<recordTarget typeCode="RCT" contextControlCode="OP">
				<patientRole classCode="PAT">
					<!-- 住院号标识 -->
					<xsl:apply-templates select="Header/recordTarget/inpatientNum" mode="inpatientNum"/>
					
					<patient classCode="PSN" determinerCode="INSTANCE">
						
						<!--患者身份证号码，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientId" mode="nationalIdNumber"/>
						<!--患者姓名，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientName" mode="Name"/>
						<!-- 性别，必选 -->
						<xsl:apply-templates select="Header/recordTarget/patient/administrativeGender" mode="Gender"/>
						<!-- 年龄 -->
						<xsl:apply-templates select="Header/recordTarget/patient/ageInYear" mode="Age"/>
					</patient>
				</patientRole>
			</recordTarget>
			<!-- 文档创作者 -->
			<xsl:apply-templates select="Header/author" mode="AuthorWithOrganization"/>
			<!-- 保管机构-数据录入者信息 -->
			<xsl:apply-templates select="Header/custodian" mode="Custodian"/>
			<!-- Authenticator签名 -->
			<xsl:for-each select="Header/Authenticators/Authenticator">
				<xsl:if test="assignedEntityCode = '医师'">
					<xsl:comment><xsl:value-of select="assignedEntityCode"/>签名</xsl:comment>
					<authenticator>
						<time/>
						<signatureCode/>
						<assignedEntity>
							<id root="2.16.156.10011.1.4" extension="{assignedEntityId}"/>
							<code displayName="{assignedEntityCode}"/>
							<assignedPerson classCode="PSN" determinerCode="INSTANCE">
								<name>
									<xsl:value-of select="assignedPersonName/Display"/>
								</name>
							</assignedPerson>
						</assignedEntity>
					</authenticator>
				</xsl:if>
			</xsl:for-each>
			<!-- 检验申请机构及科室 -->
			<xsl:for-each select="Header/Participants/Participant">
				<xsl:if test="typeCode = 'NOT'">
					<xsl:comment>检验申请机构及科室</xsl:comment>
					<participant typeCode="NOT">
						<associatedEntity classCode="ECON">
							<code/>
							<!--HDSD00.09.038 DE02.01.010.00 联系人电话号码 -->
							<telecom  use="MP" value="{telcom/Value}"/>
							<!--联系人-->
							<associatedPerson>
								<!--HDSD00.09.039 DE02.01.039.00 联系人姓名 -->
								<name><xsl:value-of select="wholeOrganization/Display"/></name>
							</associatedPerson>
						</associatedEntity>
					</participant>
				</xsl:if>
			</xsl:for-each>
			<!--关联活动信息-->
			<xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument" mode="relatedDocument"/>
			<!--文档中医疗卫生事件的就诊场景,即入院场景记录-->
			<componentOf>
				<xsl:apply-templates select="Header/encompassingEncounter/Locations/Location" mode="EncompassingEncounter"/>
			</componentOf>
			
			<!--****************************文档体Body********************-->
			<component>
				<structuredBody>
					<!--手术操作章节-->
					<xsl:apply-templates select="Procedure/Items/ProcedureItem[1]" mode="C0048P1"/>
					<!--术后诊断章节-->
					<xsl:apply-templates select="PostOpDiags" mode="C0048P2"/>
					<!--注意事项章节-->
					<xsl:apply-templates select="Attention" mode="C0048P3"/>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>
</xsl:stylesheet>
