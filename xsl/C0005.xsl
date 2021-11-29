<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="xml" indent="yes"/>
	<xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
	<xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
	<xsl:include href="CDA-Support-Files/Location.xsl"/>
	<xsl:include href="CDA-Support-Files/Diagnosis.xsl"/>
	<xsl:template match="/Document">
		<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<realmCode code="CN"/>
			<typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
			<templateId root="2.16.156.10011.2.1.1.46"/>
			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			<title>中药处方</title>
			<xsl:call-template name="effectiveTime"/>
			<xsl:call-template name="Confidentiality"/>
			<xsl:call-template name="languageCode"/>
			<setId/>
			<versionNumber/>
			<!--患者信息-->
			<recordTarget typeCode="RCT" contextControlCode="OP">
				<patientRole>
					<!--门诊号-->
					<xsl:apply-templates select="Header/recordTarget/outpatientNum" mode="outpatientNum"/>
					<!--处方号-->
					<xsl:apply-templates select="Header/recordTarget/prescriptionNum" mode="prescriptionNum"/>
					<patient>
						<!--患者身份证号码，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientId" mode="nationalIdNumber"/>
						<!--患者姓名，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientName" mode="Name"/>
						<!-- 性别，必选 -->
						<xsl:apply-templates select="Header/recordTarget/patient/administrativeGender" mode="Gender"/>
						<!-- 年龄 -->
						<xsl:apply-templates select="Header/recordTarget/patient/ageInYear" mode="Age"/>
					</patient>
					<!-- 开立科室 -->
					<providerOrganization>
						<id root="2.16.156.10011.1.26"/>
						<name><xsl:value-of select="Header/recordTarget/providerOrganization/providerOrganizationId/Display"/></name>
						<asOrganizationPartOf>
							<wholeOrganization>
								<!-- 医疗机构组织机构代码 -->
								<id root="2.16.156.10011.1.26" extension="{Header/recordTarget/providerOrganization/providerOrganizationId/Value}"/>
								<name><xsl:value-of select="Header/recordTarget/providerOrganization/providerOrganizationName"/></name>
							</wholeOrganization>
						</asOrganizationPartOf>
					</providerOrganization>
				</patientRole>
			</recordTarget>
			<!-- 文档创作者 -->
			<xsl:apply-templates select="Header/author" mode="AuthorWithOrganization"/>
			<!-- 保管机构-数据录入者信息 -->
			<xsl:if test="Header/custodian">
				<xsl:apply-templates select="Header/custodian" mode="Custodian"/>
			</xsl:if>
			<!-- LegalAuthenticator签名 -->
			<xsl:for-each select="Header/LegalAuthenticators/LegalAuthenticator">
				<xsl:if test="assignedEntityCode = '处方开立医师' ">
					<xsl:comment><xsl:value-of select="assignedEntityCode"/>签名</xsl:comment>
					<legalAuthenticator>
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
					</legalAuthenticator>
				</xsl:if>
			</xsl:for-each>
			
			<!-- Authenticator签名 -->
			<xsl:for-each select="Header/Authenticators/Authenticator">
				<xsl:if test="assignedEntityCode = '处方审核药剂师' or assignedEntityCode = '处方调配药剂师' or assignedEntityCode = '处方核对药剂师' or assignedEntityCode = '处方发放药剂师'">
					<xsl:comment>
						<xsl:value-of select="assignedEntityCode"/>签名</xsl:comment>
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
			<!-- 病床号、病房、病区、科室和医院的关联 -->
			<componentOf>
				<encompassingEncounter>
					<effectiveTime/>
					<location>
						<healthCareFacility>
							<serviceProviderOrganization>
								<asOrganizationPartOf classCode="PART">
									<!-- DE01.00.026.00	病床号 -->
									<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
										<xsl:if test="Header/encompassingEncounter/Locations/Location/bedId">
											<id root="2.16.156.10011.1.22" extension="{Header/encompassingEncounter/Locations/Location/bedId}"/>
										</xsl:if>
										<!-- DE01.00.019.00	病房号 -->
										<asOrganizationPartOf classCode="PART">
											<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
												<xsl:if test="Header/encompassingEncounter/Locations/Location/wardId">
													<id root="2.16.156.10011.1.21" extension="{Header/encompassingEncounter/Locations/Location/wardId}"/>
												</xsl:if>
												<!-- DE08.10.026.00	科室名称 -->
												<asOrganizationPartOf classCode="PART">
													<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
														<!-- DE08.10.054.00	病区名称 -->
														<asOrganizationPartOf classCode="PART">
															<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
																<name>
																	<xsl:value-of select="Header/encompassingEncounter/Locations/Location/areaName/Value"/>
																</name>
																<!--XXX医院 -->
																<asOrganizationPartOf classCode="PART">
																	<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
																		<xsl:if test="Header/encompassingEncounter/Locations/Location/hosId">
																			<id root="2.16.156.10011.1.5" extension="{Header/encompassingEncounter/Locations/Location/hosId}"/>
																		</xsl:if>
																		<name>
																			<xsl:value-of select="Header/encompassingEncounter/Locations/Location/hosName"/>
																		</name>
																	</wholeOrganization>
																</asOrganizationPartOf>
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
			<!--CDA body-->
			<component>
				<structuredBody>
					<!--诊断章节-->
					<component>
						<section>
							<code code="29548-5" displayName="Diagnosis" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<!--条目：诊断-->
							<xsl:apply-templates select="Diagnosis/Westerns/Western" mode="Diag005"/>
							<xsl:apply-templates select="Diagnosis/TCM/TCM/TCMdiag" mode="Diag130"/>
							<xsl:apply-templates select="Diagnosis/TCMSyndrome/TCMSyndrome/syndrome" mode="Diag130-2"/>
						</section>
					</component>
					<!-- 
********************************************************
用药章节18776-5
********************************************************
-->
					<!--用药章节 1..*-->
					<component>
						<section>
							<code code="10160-0" displayName="HISTORY OF MEDICATION USE" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<!--处方条目-->
							<entry>
								<substanceAdministration classCode="SBADM" moodCode="EVN">
									<text/>
									<routeCode code="{MedicationUseHistory/MedicineItems/MedicineItem/route/Value}" displayName="{MedicationUseHistory/MedicineItems/MedicineItem/route/Display}" codeSystem="2.16.156.10011.2.3.1.158" codeSystemName="用药途径代码表"/>
									<!--用药剂量-单次 -->
									<doseQuantity value="{MedicationUseHistory/MedicineItems/MedicineItem/dose/Value}" unit="mg"/>
									<!--用药频率 -->
									<rateQuantity value="{MedicationUseHistory/MedicineItems/MedicineItem/rate/Value}" unit="次/日"/>
									<!--药物剂型 -->
									<administrationUnitCode code="{MedicationUseHistory/MedicineItems/MedicineItem/form/Value}" displayName="{MedicationUseHistory/MedicineItems/MedicineItem/form/Display}" codeSystem="2.16.156.10011.2.3.1.211" codeSystemName="药物剂型代码表"/>
									<consumable>
										<manufacturedProduct>
											<manufacturedLabeledDrug>
												<!--药品代码及名称(通用名) -->
												<code/>
												<name><xsl:value-of select="MedicationUseHistory/MedicineItems/MedicineItem/name/Value"/></name>
											</manufacturedLabeledDrug>
										</manufacturedProduct>
									</consumable>
									<entryRelationship typeCode="COMP">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE08.50.043.00" displayName="药物规格" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
											<value xsi:type="ST"><xsl:value-of select="MedicationUseHistory/MedicineItems/MedicineItem/spec/Value"/></value>
										</observation>
									</entryRelationship>
									<entryRelationship typeCode="COMP">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE06.00.135.00" displayName="药物使用总剂量" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
											<value xsi:type="PQ" value="{MedicationUseHistory/MedicineItems/MedicineItem/totalDose/Value}" unit="mg"/>
										</observation>
									</entryRelationship>
								</substanceAdministration>
							</entry>
							<!--处方有效天数-->
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.294.00" displayName="处方有效天数" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
									<value xsi:type="PQ" value="{MedicationUseHistory/validDays/Value}" unit="天"/>
								</observation>
							</entry>
							<!--处方药品组号-->
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE08.50.056.00" displayName="处方药品组号" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
									<value xsi:type="INT" value="{MedicationUseHistory/groupNo/Value}"/>
								</observation>
							</entry>
							<!--中药饮片处方-->
							<entry>
								<observation classCode="OBS" moodCode="EVN ">
									<code code="DE08.50.049.00" displayName="中药饮片处方" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
									<value xsi:type="ST"><xsl:value-of select="MedicationUseHistory/HerbalPieces/HerbalPiece/name/Value"/></value>
									<!--中药饮片剂数-->
									<entryRelationship typeCode="COMP">
										<observation classCode="OBS" moodCode="EVN ">
											<code code="DE08.50.050.00" displayName="中药饮片剂数" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
											<value xsi:type="PQ" value="{MedicationUseHistory/HerbalPieces/HerbalPiece/dose/Value}" unit="剂"/>
										</observation>
									</entryRelationship>
									<!--中药饮片煎煮法-->
									<entryRelationship typeCode="COMP">
										<observation classCode="OBS" moodCode="EVN ">
											<code code="DE08.50.047.00" displayName="中药煎煮法" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
											<value xsi:type="ST"><xsl:value-of select="MedicationUseHistory/HerbalPieces/HerbalPiece/decocting/Value"/></value>
										</observation>
									</entryRelationship>
									<!--中药用药方法-->
									<entryRelationship typeCode="COMP">
										<observation classCode="OBS" moodCode="EVN ">
											<code code="DE06.00.136.00" displayName="中药用药法" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
											<value xsi:type="ST"><xsl:value-of select="MedicationUseHistory/HerbalPieces/HerbalPiece/usage/Value"/></value>
										</observation>
									</entryRelationship>
								</observation>
							</entry>
							<!-- 处方类别代码 DE08.50.032.00	处方类别代码 -->
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE08.50.032.00" displayName="处方类别代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
									<value xsi:type="CD" code="{MedicationUseHistory/presType/Value}" codeSystem="2.16.156.10011.2.3.2.40" codeSystemName="处方类别代码表" displayName="中药饮片处方"/>
								</observation>
							</entry>
						</section>
					</component>
					<!--
**********************************************
费用章节
**********************************************
-->
					<component>
						<section>
							<code code="48768-6" displayName="PAYMENT SOURCES" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE07.00.004.00" displayName="处方药品金额" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
									<value xsi:type="MO" value="{Payment/prescriptionFee/Value}" currency="元"/>
								</observation>
							</entry>
						</section>
					</component>
					<!--
***********************************************
治疗计划章节
***********************************************
-->
					<component>
						<section>
							<code code="18776-5" displayName="TREATMENT PLAN" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<!--处方备注信息-->
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.179.00" displayName="处方备注信息" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
									<value xsi:type="ST"><xsl:value-of select="TreatmentPlan/notes/Value"/></value>
								</observation>
							</entry>
							<!--治则治法-->
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.300.00" displayName="治则治法" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
									<value xsi:type="ST"><xsl:value-of select="TreatmentPlan/treatmentPrinciple/Value"/></value>
								</observation>
							</entry>
						</section>
					</component>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>
</xsl:stylesheet>
