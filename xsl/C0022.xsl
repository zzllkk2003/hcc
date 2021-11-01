<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="xml"/>
	<xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
	<xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
	<xsl:include href="CDA-Support-Files/Location.xsl"/>
	<xsl:template match="/Document">
		<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif"
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<realmCode code="CN"/>
			<typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
			<templateId root="2.16.156.10011.2.1.1.42"/>
			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			<title>高值耗材使用记录</title>
			<!--文档生成日期时间：记录日期时间：DE09.00.053.00-->
			<xsl:call-template name="effectiveTime"/>
			<xsl:call-template name="Confidentiality"/>
			<xsl:call-template name="languageCode"/>
			<setId/>
			<versionNumber/>
			<recordTarget typeCode="RCT" contextControlCode="OP">
				<patientRole classCode="PAT">
					<!-- 住院号标识 todo-->
					<xsl:apply-templates select="Header/recordTarget/inpatientNum" mode="inpatientNum"/>
					<patient classCode="PSN" determinerCode="INSTANCE">
						<!--患者姓名，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientName" mode="Name"/>
						<!-- 性别，必选 -->
						<xsl:apply-templates select="Header/recordTarget/patient/administrativeGender" mode="Gender"/>
						<!-- 年龄 -->
						<xsl:apply-templates select="Header/recordTarget/patient/ageInYear" mode="Age"/>
					</patient>
					<!--提供患者服务机构-->
					<xsl:apply-templates select="Header/recordTarget/providerOrganization" mode="providerOrganization"/>
				</patientRole>
			</recordTarget>
			<!-- 文档创作者 -->
			<xsl:apply-templates select="Header/author" mode="AuthorWithOrganization"/>
			<!-- 保管机构-数据录入者信息 -->
			<xsl:if test="Header/custodian">
				<xsl:apply-templates select="Header/custodian" mode="Custodian"/>
			</xsl:if>
					
			<!-- Authenticator签名 -->
			<xsl:for-each select="Header/Authenticators/Authenticator">
				<xsl:if test="contains(assignedEntityCode,'护士')  ">
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
			<!--关联活动信息-->
			<xsl:if test="Header/RelatedDocuments/RelatedDocument">
				<xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument" mode="relatedDocument"/>
			</xsl:if>
			
			<!--文档中医疗卫生事件的就诊场景,即入院场景记录-->
			<componentOf typeCode="COMP">
				<!--就诊-->
				<encompassingEncounter classCode="ENC" moodCode="EVN">
					<code/>
					<effectiveTime nullFlavor="NI"/>
					<location typeCode="LOC">
						<healthCareFacility classCode="SDLOC">
							<!--机构角色-->
							<serviceProviderOrganization classCode="ORG" determinerCode="INSTANCE">
								<asOrganizationPartOf classCode="PART">
									<!--病床号：DE01.00.026.00-->
									<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
										<!--N:加上OID-->
										<xsl:if test="Header/encompassingEncounter/Locations/Location/bedId">
											<id root="2.16.156.10011.1.22" extension="{Header/encompassingEncounter/Locations/Location/bedId}"/>
										</xsl:if>
										
										<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/bedNum/Value"/></name>
										<!--病房号：DE01.00.019.00-->
										<asOrganizationPartOf classCode="PART">
											<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
												<!--N:加上OID-->
												<xsl:if test="Header/encompassingEncounter/Locations/Location/wardId">
													<id root="2.16.156.10011.1.21" extension="{Header/encompassingEncounter/Locations/Location/wardId}"/>
												</xsl:if>
												
												<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/wardName/Value"/></name>
												<!--病区名称：DE08.10.054.00-->
												<asOrganizationPartOf classCode="PART">
												<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
												<!--N:加上OID-->
												<xsl:if test="Header/encompassingEncounter/Locations/Location/areaId">
													<id root="2.16.156.10011.1.27" extension="{Header/encompassingEncounter/Locations/Location/areaId}"/>
												</xsl:if>
													
												<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/areaName/Value"/></name>
												<!--科室名称：DE08.10.026.00-->
												<asOrganizationPartOf classCode="PART">
												<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
												<!--N:加上OID-->
												<xsl:if test="Header/encompassingEncounter/Locations/Location/deptId">
													<id root="2.16.156.10011.1.26" extension="{Header/encompassingEncounter/Locations/Location/deptId}"/>
												</xsl:if>
													
												<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/deptName/Value"/></name>
												</wholeOrganization>
												</asOrganizationPartOf>
												</wholeOrganization>
												</asOrganizationPartOf>
											</wholeOrganization>
										</asOrganizationPartOf>
									</wholeOrganization>
								</asOrganizationPartOf>
							</serviceProviderOrganization>
						</healthCareFacility>
					</location>
				</encompassingEncounter>
			</componentOf>
			<component>
				<structuredBody>
					<!--疾病诊断章节-->
					<xsl:comment>疾病诊断章节</xsl:comment>
					<xsl:apply-templates select="Diagnosis"/>
					<!--高值耗材章节（同用药章节） -->
					<xsl:comment>高值耗材章节</xsl:comment>
					<xsl:apply-templates select="HighValueConsumables/HighValueConsumable[1]"/>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>

	<!--诊断记录章节模板-->
	<xsl:template match="Diagnosis">
		<component>
			<section>
				<code code="29548-5" displayName="Diagnosis" codeSystem="2.16.840.1.113883.6.1"
					codeSystemName="LOINC"/>
				<title>疾病诊断章节</title>
				<text/>
				<!--疾病诊断条目-->
				<xsl:comment>疾病诊断条目</xsl:comment>
				<xsl:apply-templates select="Westerns/Western"/>
			</section>
		</component>
	</xsl:template>
	<!--疾病诊断条目-->
	<xsl:template match="Westerns/Western">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1"
					codeSystemName="卫生信息数据元目录" displayName="疾病诊断编码"/>
				<value xsi:type="CD" code="{diag/code/Value}" codeSystem="2.16.156.10011.2.3.3.11.5"
					codeSystemName="疾病代码表（ICD-10）"/>
			</observation>
		</entry>
	</xsl:template>

	<!--高值耗材章节模板-->
	<xsl:template match="HighValueConsumables/HighValueConsumable[1]">
		<component>
			<section>
				<code code="10160-0" codeSystem="2.16.840.1.113883.6.1"
					displayName="HISTORY OF MEDICATION USE" codeSystemName="LOINC"/>
				<title>高值耗材章节</title>
				<text/>
				<entry>
					<substanceAdministration classCode="SBADM" moodCode="EVN">
						<text/>
						<!--使用途径：DE06.00.242.00-->
						<xsl:comment>使用途径</xsl:comment>
						<routeCode nullFlavor="OTH">
							<originalText>
								<xsl:value-of select="route/Value"/>
							</originalText>
						</routeCode>
						<!--耗材数量DE06.00.241.00、耗材单位DE08.50.034.00 -->
						<xsl:comment>耗材数量</xsl:comment>
						<doseQuantity value="{quantity/Value}" unit="{unit/Value}"/>
						<consumable>
							<manufacturedProduct>
								<!--产品编码-->
								<xsl:comment>产品编码</xsl:comment>
								<id root="{productNo/codeSystem}" extension="{productNo/Value}"/>
								<manufacturedMaterial>
									<!--材料名称 -->
									<xsl:comment>材料名称</xsl:comment>
									<code/>
									<name>
										<xsl:value-of select="name/Value"/>
									</name>
								</manufacturedMaterial>
								<manufacturerOrganization>
									<name>
										<xsl:value-of select="manufacture/Value"/>
									</name>
									<asOrganizationPartOf>
										<wholeOrganization>
											<name>
												<xsl:value-of select="provider/Value"/>
											</name>
										</wholeOrganization>
									</asOrganizationPartOf>
								</manufacturerOrganization>
							</manufacturedProduct>
						</consumable>
						<entryRelationship typeCode="COMP">
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE08.50.058.00" codeSystem="2.16.156.10011.2.2.1"
									codeSystemName="卫生信息数据元目录" displayName="植入性耗材标志"/>
								<!-- 植入性耗材标志：DE08.50.058.00 -->
								<xsl:comment>植入性耗材标志</xsl:comment>
								<value xsi:type="BL" value="{implantable/Value}"/>
							</observation>
						</entryRelationship>
					</substanceAdministration>
				</entry>
			</section>
		</component>
	</xsl:template>
</xsl:stylesheet>
