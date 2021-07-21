
<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:isc="http://extension-functions.intersystems.com" xmlns:exsl="http://exslt.org/common" xmlns:set="http://exslt.org/sets" exclude-result-prefixes="isc sdtc exsl set">
	<xsl:output method="xml"/>
	<xsl:template match="/Document">
		<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<realmCode code="CN"/>
			<typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
			<templateId root="2.16.156.10011.2.1.1.52"/>
			<!-- 文档流水号 -->
			<id root="2.16.156.10011.1.1" extension="{DocumentNo}"/>
			<code code="C0032" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
			<title>住院病案首页</title>
			<!-- 文档机器生成时间 -->
			<effectiveTime value="20160928153937"/>
			<confidentialityCode code="N" codeSystem="2.16.840.1.113883.5.25" codeSystemName="Confidentiality" displayName="正常访问保密级别"/>
			<languageCode code="zh-CN"/>
			<setId/>
			<versionNumber/>
			<!--文档记录对象（患者）-->
			<xsl:apply-templates select="Header/RecordTarget"/>
			<!-- 文档创作者 -->
			<!--	
			<xsl:apply-templates select="VitalSigns"/>
			<xsl:apply-templates select="Diagnosis"/>
			<xsl:apply-templates select="Problem"/>
			<xsl:apply-templates select="Referral"/>
			<xsl:apply-templates select="DisDiag"/>
			<xsl:apply-templates select="Allergies"/>
			<xsl:apply-templates select="LabTests"/>
			<xsl:apply-templates select="Procedure"/>
			<xsl:apply-templates select="Hospitalization"/>
			<xsl:apply-templates select="HospitalizationProcess"/>
			<xsl:apply-templates select="Administration"/>
			<xsl:apply-templates select="CarePlan"/>
			<xsl:apply-templates select="Payment"/>
			-->
			<author typeCode="AUT" contextControlCode="OP">
				<time value="Header/Author/time"/>
				<assignedAuthor classCode="ASSIGNED">
					<id root="2.16.156.10011.1.7" extension="{Header/Author/assignedPersonId}"/>
					<assignedPerson>
						<name>
							<xsl:value-of select="Header/Author/assignedPersonName"/>
						</name>
					</assignedPerson>
				</assignedAuthor>
			</author>
			<!-- 保管机构 -->
			<custodian typeCode="CST">
				<assignedCustodian classCode="ASSIGNED">
					<representedCustodianOrganization classCode="ORG" determinerCode="INSTANCE">
						<id root="2.16.156.10011.1.5" extension="{Custodian/organizationId}"/>
						<name>
							<xsl:value-of select="Header/Custodian/organizationName"/>
						</name>
					</representedCustodianOrganization>
				</assignedCustodian>
			</custodian>
			<!-- 科主任签名 -->
			<legalAuthenticator>
				<time/>
				<signatureCode/>
				<assignedEntity>
					<id root="2.16.156.10011.1.4" extension="{Header/LegalAuthenticator/assignedEntityCode}"/>
					<code displayName="{Header/LegalAuthenticator/signatureCode}"/>
					<assignedPerson classCode="PSN" determinerCode="INSTANCE">
						<name>
							<xsl:value-of select="Header/LegalAuthenticator/assignedPersonName/Display"/>
						</name>
					</assignedPerson>
				</assignedEntity>
			</legalAuthenticator>
			<xsl:apply-templates select="Header/Authenticators/Authenticator"/>
			<xsl:apply-templates select="Header/Participants/Participant"/>
			<relatedDocument typeCode="RPLC">
				<parentDocument>
					<id/>
					<setId/>
					<versionNumber/>
				</parentDocument>
			</relatedDocument>
			<!--文档中医疗卫生事件的就诊场景,即入院场景记录-->
			<componentOf typeCode="COMP">
				<!--就诊-->
				<encompassingEncounter classCode="ENC" moodCode="EVN">
					<!--入院途径 -->
					<code code="{Header/EncompassingEncounter/admissionCode/Value}" displayName="{Header/EncompassingEncounter/admissionCode/Display}" codeSystem="2.16.156.10011.2.3.1.270" codeSystemName="入院途径代码表"/>
					<!--就诊时间-->
					<effectiveTime>
						<!--入院日期-->
						<low value="{Header/EncompassingEncounter/effectiveTimeLow/Value}"/>
						<!--出院日期-->
						<high value="{Header/EncompassingEncounter/effectiveTimeHigh/Value}"/>
					</effectiveTime>
					<location typeCode="LOC">
						<healthCareFacility classCode="SDLOC">
							<!--机构角色-->
							<serviceProviderOrganization classCode="ORG" determinerCode="INSTANCE">
								<!--入院病房-->
								<asOrganizationPartOf classCode="PART">
									<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
										<id root="2.16.156.10011.1.21" extension="{Header/EncompassingEncounter/Locations/Location/wholeOrganizationId/Display}"/>
										<name>无</name>
										<!--入院科室-->
										<asOrganizationPartOf classCode="PART">
											<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
												<id root="2.16.156.10011.1.26" extension="{Header/EncompassingEncounter/Locations/Location/wholeOrganizationName/Display}"/>
												<name>
													<xsl:value-of select="Header/EncompassingEncounter/Locations/Location/asOrganizationPartOfName/Display"/>
												</name>
											</wholeOrganization>
										</asOrganizationPartOf>
									</wholeOrganization>
								</asOrganizationPartOf>
							</serviceProviderOrganization>
						</healthCareFacility>
					</location>
				</encompassingEncounter>
			</componentOf>
			<!--****************************文档体Body********************-->
			<component>
				<structuredBody>
					<!--
********************************************************
生命体征章节
********************************************************
-->
					<component>
						<section>
							<code code="8716-3" displayName="VITAL SIGNS" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<xsl:apply-templates select="VitalSigns"/>
						</section>
					</component>
					<!--
********************************************************
诊断章节
********************************************************
-->
					<component>
						<section>
							<code code="29548-5" displayName="Diagnosis" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<!--门（急）诊诊断-->
							<xsl:apply-templates select="Diagnosis/Outpatients"/>
							<xsl:apply-templates select="Diagnosis/Pathologys"/>
						</section>
					</component>
					<!--
********************************************************
主要健康问题章节
********************************************************
-->
					<component>
						<section>
							<code code="11450-4" displayName="PROBLEM LIST" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<xsl:apply-templates select="Problem"/>
						</section>
					</component>
					<!--
********************************************************
转科记录章节
********************************************************
-->
					<component>
						<section>
							<code code="42349-1" displayName="REASON FOR REFERRAL" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<!--转科条目-->
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code/>
									<!--转科原因（数据元）-->
									<author>
										<time/>
										<assignedAuthor>
											<id/>
											<representedOrganization>
												<!--住院患者转科科室名称-->
												<name>
													<xsl:value-of select="Referral/referralTarget/Display"/>
												</name>
											</representedOrganization>
										</assignedAuthor>
									</author>
								</observation>
							</entry>
						</section>
					</component>
					<!--
********************************************************
出院诊断章节
********************************************************
-->
					<component>
						<section>
							<code code="11535-2" displayName="HOSPITAL DISCHARGE DX" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<!--出院诊断-主要诊断条目-->
							<xsl:apply-templates select="DisDiag/Primarys/Primary"/>
							<xsl:apply-templates select="DisDiag/Others/Other"/>
							<!--离院方式-->
							<entry typeCode="COMP">
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.223.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="离院方式"/>
									<value xsi:type="CD" code="1" displayName="{DisDiag/DischargeDisposition/Display}" codeSystem="2.16.156.10011.2.3.1.265" codeSystemName="离院方式代码表"/>
									<entryRelationship typeCode="COMP" negationInd="false">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE08.10.013.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="拟接受医疗机构名称"/>
											<value xsi:type="ST">
												<xsl:value-of select="DisDiag/receivingOrganization/Display"/>
											</value>
										</observation>
									</entryRelationship>
								</observation>
							</entry>
						</section>
					</component>
					<!--
********************************************************
过敏史章节
********************************************************
-->
					<component>
						<section>
							<code code="48765-2" displayName="Allergies, adverse reactions, alerts" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<entry typeCode="DRIV">
								<act classCode="ACT" moodCode="EVN">
									<code nullFlavor="NA"/>
									<entryRelationship typeCode="SUBJ">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE02.10.023.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
											<value xsi:type="BL" value="true"/>
											<participant typeCode="CSM">
												<participantRole classCode="MANU">
													<playingEntity classCode="MMAT">
														<!--住院患者过敏源-->
														<code code="DE02.10.022.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="过敏药物"/>
														<desc xsi:type="ST">
															<xsl:value-of select="Header/Allergies/Allergy/Value/Display"/>
														</desc>
													</playingEntity>
												</participantRole>
											</participant>
										</observation>
									</entryRelationship>
								</act>
							</entry>
						</section>
					</component>
					<!--
********************************************************
实验室检查章节
********************************************************
-->
					<component>
						<section>
							<code code="30954-2" displayName="STUDIES SUMMARY" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<entry typeCode="COMP">
								<!-- 血型-->
								<organizer classCode="BATTERY" moodCode="EVN">
									<statusCode/>
									<component typeCode="COMP">
										<!-- ABO血型 -->
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE04.50.001.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
											<value xsi:type="CD" code="1" codeSystem="2.16.156.10011.2.3.1.85" codeSystemName="ABO血型代码表" displayName="A型"/>
										</observation>
									</component>
									<component typeCode="COMP">
										<!-- Rh血型 -->
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE04.50.010.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
											<value xsi:type="CD" code="2" codeSystem="2.16.156.10011.2.3.1.250" codeSystemName="Rh(D)血型代码表" displayName="阳性"/>
										</observation>
									</component>
								</organizer>
							</entry>
						</section>
					</component>
					<!--
********************************************************
手术操作章节
********************************************************
-->
					<xsl:apply-templates select="Procedure"/>
					<!--
*******************************************************
住院史章节
*******************************************************
-->
					<component>
						<section>
							<code code="11336-5" codeSystem="2.16.840.1.113883.6.1" displayName="HISTORY OF HOSPITALIZATIONS" codeSystemName="LOINC"/>
							<text/>
							<!--住院次数 -->
							<entry typeCode="COMP">
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE02.10.090.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="住院次数"/>
									<value xsi:type="INT" value="{Hospitalization/hospitalizationCount/Value}"/>
								</observation>
							</entry>
						</section>
					</component>
					<!--
*******************************************************
住院过程章节
*******************************************************
-->
					<component>
						<section>
							<code code="8648-8" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Hospital Course"/>
							<text/>
							<!--实际住院天数 -->
							<entry typeCode="COMP">
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.310.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="实际住院天数"/>
									<value xsi:type="PQ" value="{HospitalizationProcess/staydays/Value}" unit="天"/>
								</observation>
							</entry>
							<entry>
								<!--出院科室及病房 -->
								<act classCode="ACT" moodCode="EVN">
									<code/>
									<author>
										<time/>
										<assignedAuthor>
											<id/>
											<representedOrganization>
												<!--住院患者出院病房、科室名称-->
												<id root="2.16.156.10011.1.21" extension="003"/>
												<name>
													<xsl:value-of select="HospitalizationProcess/dischargeWard/Display"/>
												</name>
												<asOrganizationPartOf classCode="PART">
													<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
														<id root="2.16.156.10011.1.26" extension="567"/>
														<name>
															<xsl:value-of select="HospitalizationProcess/dischargeDepartment/Display"/>
														</name>
													</wholeOrganization>
												</asOrganizationPartOf>
											</representedOrganization>
										</assignedAuthor>
									</author>
								</act>
							</entry>
						</section>
					</component>
					<!--
********************************************************
行政管理章节
********************************************************
-->
					<component>
						<section>
							<code displayName="行政管理"/>
							<text/>
							<!--亡患者尸检标志-->
							<entry typeCode="COMP">
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE09.00.108.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="死亡患者尸检标志"/>
									<value xsi:type="BL" value="{Administration/autospy/Value}"/>
								</observation>
							</entry>
							<!--病案质量-->
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE09.00.103.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="病案质量"/>
									<!-- 质控日期 -->
									<effectiveTime value="20120109"/>
									<value xsi:type="CD" code="{Administration/MRQuality/Value}" displayName="{Administration/MRQuality/Display}" codeSystem="2.16.156.10011.2.3.2.29" codeSystemName="病案质量等级表"/>
									<author>
										<time/>
										<assignedAuthor>
											<id root="2.16.156.10011.1.4" extension="医务人员编码"/>
											<code displayName="质控医生"/>
											<assignedPerson>
												<name>
													<xsl:value-of select="Administration/QCDocter/Display"/>
												</name>
											</assignedPerson>
										</assignedAuthor>
									</author>
									<author>
										<time/>
										<assignedAuthor>
											<id root="2.16.156.10011.1.4" extension="医务人员编码"/>
											<code displayName="质控护士"/>
											<assignedPerson>
												<name>
													<xsl:value-of select="Administration/QCNurse/Display"/>
												</name>
											</assignedPerson>
										</assignedAuthor>
									</author>
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
							<!-- 有否出院31天内再住院计划 -->
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.194.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院31天内再住院标志"/>
									<value xsi:type="BL" value="{CarePlan/readmission/Display}"/>
									<entryRelationship typeCode="GEVL" negationInd="false">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE06.00.195.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院31天内再住院目的"/>
											<value xsi:type="ST">
												<xsl:value-of select="CarePlan/readmissionReason/Display"/>
											</value>
										</observation>
									</entryRelationship>
								</observation>
							</entry>
						</section>
					</component>
					<!--
********************************************************
费用章节
********************************************************
-->
					<xsl:apply-templates select="Payment"/>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>
	<!--RecordTarget-->
	<xsl:template match="Header/RecordTarget">
		<recordTarget typeCode="RCT" contextControlCode="OP">
			<patientRole classCode="PAT">
				<!-- 健康卡号 -->
				<id root="2.16.156.10011.1.19" extension="{healthCardId/Display}"/>
				<!-- 住院号标识 -->
				<id root="2.16.156.10011.1.12" extension="{MRN/Display}"/>
				<!-- 病案号标识 -->
				<id root="2.16.156.10011.1.13" extension="{MRN/Display}"/>
				<!-- 现住址 -->
				<addr use="H">
					<houseNumber>
						<xsl:value-of select="addrHouseNumber/Display"/>
					</houseNumber>
					<streetName>
						<xsl:value-of select="addrStreetNumber/Display"/>
					</streetName>
					<township>
						<xsl:value-of select="addrTownship/Display"/>
					</township>
					<county>
						<xsl:value-of select="addrCounty/Display"/>
					</county>
					<city>
						<xsl:value-of select="addrCity/Display"/>
					</city>
					<state>
						<xsl:value-of select="addrState/Display"/>
					</state>
					<postalCode>
						<xsl:value-of select="addrPostalCode/Display"/>
					</postalCode>
				</addr>
				<telecom value="{telecom/Display}"/>
				<patient classCode="PSN" determinerCode="INSTANCE">
					<!--患者身份证号-->
					<id root="2.16.156.10011.1.3" extension="{patientId/Display}"/>
					<name><xsl:value-of select="patientName/Display"/></name>
					<administrativeGenderCode code="1" codeSystem="2.16.156.10011.2.3.3.4" codeSystemName="生理性别代码表(GB/T 2261.1)" displayName="男性"/>
					<birthTime value="19320521"/>
					<maritalStatusCode code="{maritalStatusCode/Value}" displayName="{maritalStatusCode/Display}" codeSystem="2.16.156.10011.2.3.3.5" codeSystemName="婚姻状况代码表(GB/T 2261.2)"/>
					<ethnicGroupCode code="{ethnicGroupCode/Value}" displayName="{ethnicGroupCode/Display}" codeSystem="2.16.156.10011.2.3.3.3" codeSystemName="民族类别代码表(GB 3304)"/>
					<!-- 出生地 -->
					<birthplace>
						<place classCode="PLC" determinerCode="INSTANCE">
							<addr>
								<county>
									<xsl:value-of select="birthplaceCounty/Display"/>
								</county>
								<city>
									<xsl:value-of select="birthplaceCity/Display"/>
								</city>
								<state>
									<xsl:value-of select="birthplaceState/Display"/>
								</state>
								<postalCode>
									<xsl:value-of select="birthplacePostalCode/Display"/>
								</postalCode>
							</addr>
						</place>
					</birthplace>
					<!-- 国籍 -->
					<nationality code="{nationality/Value}" codeSystem="2.16.156.10011.2.3.3.1" codeSystemName="世界各国和地区名称代码(GB/T 2659)" displayName="{nationality/Display}"/>
					<!-- 年龄 -->
					<age unit="岁" value="{ageInYear/Value}"/>
					<!-- 工作单位 -->
					<employerOrganization>
						<name>
							<xsl:value-of select="employerName/Display"/>
						</name>
						<telecom value="{telcom/Value}"/>
						<!-- 工作地址 -->
						<addr use="WP">
							<houseNumber>
								<xsl:value-of select="employerAddrhouseNumber/Display"/>
							</houseNumber>
							<streetName>
								<xsl:value-of select="employerAddrStreetName/Display"/>
							</streetName>
							<township>
								<xsl:value-of select="employerAddrTownship/Display"/>
							</township>
							<county>
								<xsl:value-of select="addrHouseCounty/Display"/>
							</county>
							<city>
								<xsl:value-of select="employerAddrCity/Display"/>
							</city>
							<state>
								<xsl:value-of select="employerAddrState/Display"/>
							</state>
							<postalCode>
								<xsl:value-of select="employerAddrPostalCode/Display"/>
							</postalCode>
						</addr>
					</employerOrganization>
					<!-- 户口信息 -->
					<household>
						<place classCode="PLC" determinerCode="INSTANCE">
							<addr>
								<houseNumber>
									<xsl:value-of select="householdHouseNumber/Display"/>
								</houseNumber>
								<streetName>
									<xsl:value-of select="householdStreetName/Display"/>
								</streetName>
								<township>
									<xsl:value-of select="householdTownship/Display"/>
								</township>
								<county>
									<xsl:value-of select="householdCounty/Display"/>
								</county>
								<city>
									<xsl:value-of select="householdCity/Display"/>
								</city>
								<state>
									<xsl:value-of select="householdState/Display"/>
								</state>
								<postalCode>
									<xsl:value-of select="householdPostalCode/Display"/>
								</postalCode>
							</addr>
						</place>
					</household>
					<!-- 籍贯信息 -->
					<nativePlace>
						<place classCode="PLC" determinerCode="INSTANCE">
							<addr>
								<city>
									<xsl:value-of select="nativePlaceCity/Display"/>
								</city>
								<state>
									<xsl:value-of select="nativePlaceState/Display"/>
								</state>
							</addr>
						</place>
					</nativePlace>
					<!--职业状况-->
					<occupation>
						<occupationCode code="{occupationCode/Value}" codeSystem="2.16.156.10011.2.3.3.13" codeSystemName="从业状况(个人身体)代码表(GB/T 2261.4)" displayName="{occupationCode/Display}"/>
					</occupation>
				</patient>
				<!--提供患者服务机构-->
				<providerOrganization classCode="ORG" determinerCode="INSTANCE">
					<!--机构标识号-->
					<id root="2.16.156.10011.1.5" extension="{providerOrganizationId/Value}"/>
					<!--住院机构名称-->
					<name>
						<xsl:value-of select="providerOrganizationId/Display"/>
					</name>
				</providerOrganization>
			</patientRole>
		</recordTarget>
	</xsl:template>
	<xsl:template match="Header/Authenticators/Authenticator">
		<authenticator>
			<time>
				<xsl:value-of select="assignedPersonName/Display"/>
			</time>
			<signatureCode/>
			<assignedEntity>
				<id root="2.16.156.10011.1.4" extension="{assignedEntityCode}"/>
				<code displayName="{signatureCode}"/>
				<assignedPerson classCode="PSN" determinerCode="INSTANCE">
					<name>
						<xsl:value-of select="assignedPersonName/Display"/>
					</name>
				</assignedPerson>
			</assignedEntity>
		</authenticator>
	</xsl:template>
	<xsl:template match="Header/Participants/Participant">
		<participant typeCode="NOT">
			<!--联系人@classCode：CON，固定值，表示角色是联系人 -->
			<associatedEntity classCode="ECON">
				<!--联系人类别，表示与患者之间的关系-->
				<code code="{associatedEntityCode/Value}" codeSystem="2.16.156.10011.2.3.3.8" codeSystemName="家庭关系代码表(GB/T 4761)" displayName="{associatedEntityCode/Display}"/>
				<!--联系人地址-->
				<addr use="H">
					<houseNumber>
						<xsl:value-of select="addrHouseNumber/Display"/>
					</houseNumber>
					<streetName>
						<xsl:value-of select="addrStreetName/Display"/>
					</streetName>
					<township>
						<xsl:value-of select="addrCounty/Display"/>
					</township>
					<county>
						<xsl:value-of select="addrCounty/Display"/>
					</county>
					<city>
						<xsl:value-of select="addrCity/Display"/>
					</city>
					<state>
						<xsl:value-of select="addrState/Display"/>
					</state>
					<postalCode>
						<xsl:value-of select="addrPostalCode/Display"/>
					</postalCode>
				</addr>
				<!--电话号码-->
				<telecom use="H" value="{telcom/Display}"/>
				<!--联系人-->
				<associatedPerson classCode="PSN" determinerCode="INSTANCE">
					<!--姓名-->
					<name>
						<xsl:value-of select="asociatedPersonName/Display"/>
					</name>
				</associatedPerson>
			</associatedEntity>
		</participant>
	</xsl:template>
	<xsl:template match="VitalSigns/VitalSign">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="{type}" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出生体重">
					<qualifier>
						<name displayName="{display}"/>
					</qualifier>
				</code>
				<value xsi:type="PQ" value="{value}" unit="g"/>
			</observation>
		</entry>
	</xsl:template>
	<xsl:template match="Diagnosis/Outpatients">
		<entry>
			<organizer classCode="CLUSTER" moodCode="EVN">
				<statusCode/>
				<component>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.01.025.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="门（急）诊诊断名称">
							<qualifier>
								<name displayName="门（急）诊诊断"/>
							</qualifier>
						</code>
						<value xsi:type="ST">
							<xsl:value-of select="diagnosisCode/Display"/>
						</value>
					</observation>
				</component>
				<component>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="门（急）诊诊断疾病编码">
							<qualifier>
								<name displayName="门（急）诊诊断"/>
							</qualifier>
						</code>
						<value xsi:type="CD" code="{diagnosisCode/Value}" displayName="B族链球菌感染" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10"/>
					</observation>
				</component>
			</organizer>
		</entry>
	</xsl:template>
	<xsl:template match="Diagnosis/Pathologys">
		<entry>
			<organizer classCode="CLUSTER" moodCode="EVN">
				<statusCode/>
				<component>
					<observation classCode="OBS" moodCode="EVN">
						<!-- 病理号标识 -->
						<id root="2.16.156.10011.1.8" extension="-"/>
						<code code="DE05.01.025.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="病理诊断-疾病名称">
							<qualifier>
								<name displayName="病理诊断"/>
							</qualifier>
						</code>
						<value xsi:type="ST">
							<xsl:value-of select="diagnosisCode/Display"/>
						</value>
					</observation>
				</component>
				<component>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="病理诊断-疾病编码">
							<qualifier>
								<name displayName="病理诊断"/>
							</qualifier>
						</code>
						<value xsi:type="CD" code="{diagnosisCode/Value}" displayName="B族链球菌感染" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10"/>
					</observation>
				</component>
			</organizer>
		</entry>
	</xsl:template>
	<xsl:template match="Problem">
		<entry typeCode="COMP">
			<organizer classCode="CLUSTER" moodCode="EVN">
				<code displayName="颅脑损伤患者入院前昏迷时间"/>
				<statusCode/>
				<component>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.138.01" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="颅脑损伤患者入 院前昏迷时间-d"/>
						<value xsi:type="PQ" unit="d" value="{comaBeforeAdmit/days/Value}"/>
					</observation>
				</component>
				<component>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.138.02" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="颅脑损伤患者入 院前昏迷时间-h"/>
						<value xsi:type="PQ" unit="h" value="{comaBeforeAdmit/hours/Value}"/>
					</observation>
				</component>
				<component>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.138.03" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="颅脑损伤患者入 院前昏迷时间-min"/>
						<value xsi:type="PQ" unit="min" value="{comaBeforeAdmit/minutes/Value}"/>
					</observation>
				</component>
			</organizer>
		</entry>
	</xsl:template>
	<xsl:template match="DisDiag/Primarys/Primary">
		<entry>
			<organizer classCode="CLUSTER" moodCode="EVN">
				<statusCode/>
				<component>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.01.025.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院诊断-主要诊断名称">
							<qualifier>
								<name displayName="主要诊断名称"/>
							</qualifier>
						</code>
						<!--确诊日期-->
						<effectiveTime value="20070531"/>
						<value xsi:type="ST">疾病名称</value>
					</observation>
				</component>
				<component>
					<observation classCode="OBS" moodCode="EVN">
						<!--住院患者疾病诊断类型-代码/住院患者疾病诊断类型-详细描
述-->
						<code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院诊断-主要诊断疾病编码">
							<qualifier>
								<name displayName="主要诊断疾病编码"/>
							</qualifier>
						</code>
						<!--疾病诊断代码/疾病诊断名称-->
						<value xsi:type="CD" code="{diagnosisCode/Value}" displayName="{diagnosisCode/Display}" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10"/>
					</observation>
				</component>
				<component>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE09.00.104.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院诊断-主要诊断入院病情代码">
							<qualifier>
								<name displayName="主要诊断入院病情代码"/>
							</qualifier>
						</code>
						<value xsi:type="CD" code="{sickCondition/Value}" displayName="{sickCondition/Display}" codeSystem="2.16.156.10011.2.3.1.253" codeSystemName="入院病情代码表"/>
					</observation>
				</component>
			</organizer>
		</entry>
	</xsl:template>
	<xsl:template match="DisDiag/Others/Other">
		<entry>
			<organizer classCode="CLUSTER" moodCode="EVN">
				<statusCode/>
				<component>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.01.025.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院诊断-其他诊断名称">
							<qualifier>
								<name displayName="其他诊断名称"/>
							</qualifier>
						</code>
						<!--确诊日期-->
						<effectiveTime value="20070531"/>
						<value xsi:type="ST">疾病名称</value>
					</observation>
				</component>
				<component>
					<observation classCode="OBS" moodCode="EVN">
						<!--住院患者疾病诊断类型-代码/住院患者疾病诊断类型-详细描
述-->
						<code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院诊断-其他诊断疾病编码">
							<qualifier>
								<name displayName="其他诊断疾病编码"/>
							</qualifier>
						</code>
						<!--疾病诊断代码/疾病诊断名称-->
						<value xsi:type="CD" code="{diagnosisCode/Value}" displayName="{diagnosisCode/Display}" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10"/>
					</observation>
				</component>
				<component>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE09.00.104.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院诊断-其他诊断入院病情代码">
							<qualifier>
								<name displayName="其他诊断入院病情代码"/>
							</qualifier>
						</code>
						<value xsi:type="CD" code="{sickCondition/Value}" displayName="{sickCondition/Display}" codeSystem="2.16.156.10011.2.3.1.253" codeSystemName="入院病情代码表"/>
					</observation>
				</component>
			</organizer>
		</entry>
	</xsl:template>
	<xsl:template match="Procedure">
		<component>
			<section>
				<code code="47519-4" displayName="HISTORY OF PROCEDURES" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<entry>
					<!-- 1..1 手术记录 -->
					<procedure classCode="PROC" moodCode="EVN">
						<code code="{procedure/Value}" displayName="{procedure/Display}" codeSystem="2.16.156.10011.2.3.3.12" codeSystemName="手术(操作)代码表(ICD-9-CM)"/>
						<statusCode/>
						<!--操作日期/时间-->
						<effectiveTime value="{procedureTime/Display}"/>
						<!--手术者-->
						<performer>
							<assignedEntity>
								<id root="2.16.156.10011.1.4" extension="医务人员编码"/>
								<assignedPerson>
									<name>
										<xsl:value-of select="procedureDocotr/Display"/>
									</name>
								</assignedPerson>
							</assignedEntity>
						</performer>
						<!--第一助手-->
						<participant typeCode="ATND">
							<participantRole classCode="ASSIGNED">
								<id root="2.16.156.10011.1.4" extension="医务人员编码"/>
								<code displayName="第一助手"/>
								<playingEntity classCode="PSN" determinerCode="INSTANCE">
									<name>
										<xsl:value-of select="primaryAssistant/Display"/>
									</name>
								</playingEntity>
							</participantRole>
						</participant>
						<!--第二助手-->
						<participant typeCode="ATND">
							<participantRole classCode="ASSIGNED">
								<id root="2.16.156.10011.1.4" extension="医务人员编码"/>
								<code displayName="第二助手"/>
								<playingEntity classCode="PSN" determinerCode="INSTANCE">
									<name>
										<xsl:value-of select="secondAssistant/Display"/>
									</name>
								</playingEntity>
							</participantRole>
						</participant>
						<entryRelationship typeCode="COMP">
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE06.00.094.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术（操作）名称"/>
								<value xsi:type="ST">
									<xsl:value-of select="procedureName/Display"/>
								</value>
							</observation>
						</entryRelationship>
						<!--手术级别 -->
						<entryRelationship typeCode="COMP">
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE06.00.255.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术级别"/>
								<!--手术级别 -->
								<value xsi:type="CD" code="{procedureClass/Value}" displayName="{procedureClass/Display}" codeSystem="2.16.156.10011.2.3.1.258" codeSystemName="手术级别代码表"/>
							</observation>
						</entryRelationship>
						<!--手术切口类别 -->
						<entryRelationship typeCode="COMP">
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE06.00.257.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术切口类别代码"/>
								<!--手术级别 -->
								<value xsi:type="CD" code="{cutLevel/Value}" displayName="{cutLevel/Display}" codeSystem="2.16.156.10011.2.3.1.256" codeSystemName="手术切口类别代码表"/>
							</observation>
						</entryRelationship>
						<!--手术切口愈合等级-->
						<entryRelationship typeCode="COMP">
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE05.10.147.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术切口愈合等级"/>
								<!--手术切口愈合等级-->
								<value xsi:type="CD" code="" displayName="甲" codeSystem="2.16.156.10011.2.3.1.257" codeSystemName="手术切口愈合等级代码表"/>
							</observation>
						</entryRelationship>
						<!-- 0..1 麻醉信息 -->
						<entryRelationship typeCode="COMP">
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE06.00.073.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="麻醉方式代码"/>
								<value code="{anesthesiaMethod/Value}" displayName="{anesthesiaMethod/Display}" codeSystem="2.16.156.10011.2.3.1.159" codeSystemName="麻醉方法代码表" xsi:type="CD"/>
								<performer>
									<assignedEntity>
										<id root="2.16.156.10011.1.4" extension="医务人员编码 "/>
										<assignedPerson>
											<name>
												<xsl:value-of select="anesthesiaDoctor/Display"/>
											</name>
										</assignedPerson>
									</assignedEntity>
								</performer>
							</observation>
						</entryRelationship>
					</procedure>
				</entry>
			</section>
		</component>
	</xsl:template>
	<xsl:template match="Payment">
		<component>
			<section>
				<code code="48768-6" displayName="PAYMENT SOURCES" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--医疗付费方式 -->
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE07.00.007.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="医疗付费方式代码"/>
						<value xsi:type="CD" code="{PaymentWay/Vaule}" codeSystem="2.16.156.10011.2.3.1.269" displayName="{paymentWay/Display}" codeSystemName="医疗付费方式代码表"/>
					</observation>
				</entry>
				<!--住院总费用 -->
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="HDSD00.11.142" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="住院总费用"/>
						<value xsi:type="MO" value="{totalFee/total/Value}" currency="元"/>
						<entryRelationship typeCode="COMP" negationInd="false">
							<observation classCode="OBS" moodCode="EVN">
								<code code="HDSD00.11.143" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="住院总费用- 自付金额（元）"/>
								<value xsi:type="MO" value="{totalFee/patientPay/patient/Value}" currency="元"/>
							</observation>
						</entryRelationship>
					</observation>
				</entry>
				<!--综合医疗服务费 -->
				<entry>
					<organizer classCode="CLUSTER" moodCode="EVN">
						<statusCode/>
						<xsl:apply-templates select="generalFee/service"/>
						<xsl:apply-templates select="generalFee/treatment"/>
						<xsl:apply-templates select="generalFee/nurse"/>
						<xsl:apply-templates select="generalFee/other"/>
					</organizer>
				</entry>
				<!--诊断类服务费 -->
				<entry>
					<organizer classCode="CLUSTER" moodCode="EVN">
						<statusCode/>
						<xsl:apply-templates select="diagFee/pathology"/>
						<xsl:apply-templates select="diagFee/lab"/>
						<xsl:apply-templates select="diagFee/image"/>
						<xsl:apply-templates select="diagFee/diagnosis"/>
					</organizer>
				</entry>
				<!--治疗类服务费 -->
				<entry>
					<organizer classCode="CLUSTER" moodCode="EVN">
						<statusCode/>
						<xsl:apply-templates select="treatmentFee/nonSurgeryFee"/>
						<xsl:apply-templates select="treatmentFee/SurgeryFee"/>
						
					</organizer>
				</entry>
				<!--康复费类服务费 -->
				<xsl:apply-templates select="rehabilitationFee"/>
				<!--中医治疗费 -->
				<xsl:apply-templates select="TCMTreatmentFee"/>
				<!--西药费 -->
				<xsl:apply-templates select="medicineFee"/>
				<!--中药费 -->
				<xsl:apply-templates select="TCMFee"/>
				<!-- 血液和血液制品类服务费 -->
				<xsl:apply-templates select="bloodFee"/>
				<!-- 耗材类费用 -->
				<xsl:apply-templates select="consumableFee"/>
				<!--其他费 -->
				<xsl:apply-templates select="otherFee"/>
			</section>
		</component>
	</xsl:template>
	<xsl:template match="generalFee/service">
		<component>
			<observation classCode="OBS" moodCode="EVN">
				<code code="HDSD00.11.147" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="综合医疗服务费-一般医疗服务费"/>
				<value xsi:type="MO" value="{Value}" currency="元"/>
			</observation>
		</component>
	</xsl:template>
	<xsl:template match="generalFee/treatment">
		<component>
			<observation classCode="OBS" moodCode="EVN">
				<code code="HDSD00.11.148" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="综合医疗服 务费-一般治疗操作费"/>
				<value xsi:type="MO" value="{Value}" currency="元"/>
			</observation>
		</component>
	</xsl:template>
	<xsl:template match="generalFee/nurse">
		<component>
			<observation classCode="OBS" moodCode="EVN">
				<code code="HDSD00.11.145" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="综合医疗服 务费-护理费"/>
				<value xsi:type="MO" value="{Value}" currency="元"/>
			</observation>
		</component>
	</xsl:template>
	<xsl:template match="generalFee/other">
		<component>
			<observation classCode="OBS" moodCode="EVN">
				<code code="HDSD00.11.146" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="综合医疗服 务费-其他费用"/>
				<value xsi:type="MO" value="{Value}" currency="元"/>
			</observation>
		</component>
	</xsl:template>
	<xsl:template match="diagFee/pathology">
		<component>
			<observation classCode="OBS" moodCode="EVN">
				<code code="HDSD00.11.121" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="诊断-病理诊断费"/>
				<value xsi:type="MO" value="{Value}" currency="元"/>
			</observation>
		</component>
	</xsl:template>
	<xsl:template match="diagFee/lab">
		<component>
			<observation classCode="OBS" moodCode="EVN">
				<code code="HDSD00.11.123" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="诊断-实验室诊断费"/>
				<value xsi:type="MO" value="{Value}" currency="元"/>
			</observation>
		</component>
	</xsl:template>
	<xsl:template match="diagFee/image">
		<component>
			<observation classCode="OBS" moodCode="EVN">
				<code code="HDSD00.11.124" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="诊断-影像学诊断费"/>
				<value xsi:type="MO" value="{Value}" currency="元"/>
			</observation>
		</component>
	</xsl:template>
	<xsl:template match="diagFee/diagnosis">
		<component>
			<observation classCode="OBS" moodCode="EVN">
				<code code="HDSD00.11.122" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="诊断-临床诊断项目费"/>
				<value xsi:type="MO" value="{Value}" currency="元"/>
			</observation>
		</component>
	</xsl:template>
	<xsl:template match="treatmentFee/nonSurgeryFee"><component>
							<observation classCode="OBS" moodCode="EVN">
								<code code="HDSD00.11.129" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="治疗-非手术治疗项目费"/>
								<value xsi:type="MO" value="{nonSurgery/Value}" currency="元"/>
								<entryRelationship typeCode="COMP">
									<observation classCode="OBS" moodCode="EVN">
										<code code="HDSD00.11.130" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="治疗-非手术 治疗项目费-临床物理治疗费"/>
										<value xsi:type="MO" value="{physical/physicalTreatment/Value}" currency="元"/>
									</observation>
								</entryRelationship>
							</observation>
						</component>
	</xsl:template>
	<xsl:template match="treatmentFee/SurgeryFee"><component>
							<observation classCode="OBS" moodCode="EVN">
								<code code="HDSD00.11.131" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="治疗-手术治 疗费"/>
								<value xsi:type="MO" value="{surgery/Value}" currency="元"/>
								<entryRelationship typeCode="COMP">
									<observation classCode="OBS" moodCode="EVN">
										<code code="HDSD00.11.132" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="治疗-手术治 疗费-麻醉费"/>
										<value xsi:type="MO" value="{detail/anesthesia/Value}" currency="元"/>
									</observation>
								</entryRelationship>
								<entryRelationship typeCode="COMP">
									<observation classCode="OBS" moodCode="EVN">
										<code code="HDSD00.11.133" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="治疗-手术治 疗费-手术费"/>
										<value xsi:type="MO" value="{detail/surgery/Value}" currency="元"/>
									</observation>
								</entryRelationship>
							</observation>
						</component>
	</xsl:template>
	<xsl:template match="rehabilitationFee"><entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="HDSD00.11.055" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="康复费"/>
						<value xsi:type="MO" value="{Value}" currency="元"/>
					</observation>
				</entry>
	</xsl:template>
	<xsl:template match="TCMTreatmentFee"><entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="HDSD00.11.136" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="中医治疗费"/>
						<value xsi:type="MO" value="{Value}" currency="元"/>
					</observation>
				</entry>
	</xsl:template>
	<xsl:template match="medicineFee"><entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="HDSD00.11.098" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="西药费"/>
						<value xsi:type="MO" value="12074.18" currency="元"/>
						<entryRelationship typeCode="COMP">
							<observation classCode="OBS" moodCode="EVN">
								<code code="HDSD00.11.099" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="西药费-抗菌 药物费用"/>
								<value xsi:type="MO" value="{antibacterialFee/Value}" currency="元"/>
							</observation>
						</entryRelationship>
					</observation>
				</entry>
	</xsl:template>
	<xsl:template match="TCMFee"><entry>
					<organizer classCode="CLUSTER" moodCode="EVN">
						<statusCode/>
						<component>
							<observation classCode="OBS" moodCode="EVN">
								<code code="HDSD00.11.135" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="中药费-中成 药费"/>
								<value xsi:type="MO" value="{TCMPatent/Value}" currency="元"/>
							</observation>
						</component>
						<component>
							<observation classCode="OBS" moodCode="EVN">
								<code code="HDSD00.11.134" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="中药费-中草 药费"/>
								<value xsi:type="MO" value="{TCMHerb/Value}" currency="元"/>
							</observation>
						</component>
					</organizer>
				</entry>
	</xsl:template>
	<xsl:template match="bloodFee"><entry>
					<organizer classCode="CLUSTER" moodCode="EVN">
						<statusCode/>
						<component>
							<observation classCode="OBS" moodCode="EVN">
								<code code="HDSD00.11.115" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="血费"/>
								<value xsi:type="MO" value="{blood/Value}" currency="元"/>
							</observation>
						</component>
						<component>
							<observation classCode="OBS" moodCode="EVN">
								<code code="HDSD00.11.111" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="白蛋白类制 品费"/>
								<value xsi:type="MO" value="{albumin/Value}" currency="元"/>
							</observation>
						</component>
						<component>
							<observation classCode="OBS" moodCode="EVN">
								<code code="HDSD00.11.113" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="球蛋白类制 品费"/>
								<value xsi:type="MO" value="{globulin/Value}" currency="元"/>
							</observation>
						</component>
						<!-- 凝血因子类制品费 -->
						<component>
							<observation classCode="OBS" moodCode="EVN">
								<code code="HDSD00.11.112" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="凝血因子类 制品费"/>
								<value xsi:type="MO" value="{clotfactor/Value}" currency="元"/>
							</observation>
						</component>
						<!--细胞因子类制品费 -->
						<component>
							<observation classCode="OBS" moodCode="EVN">
								<code code="HDSD00.11.114" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="细胞因子类 制品费"/>
								<value xsi:type="MO" value="{cellfactor/Value}" currency="元"/>
							</observation>
						</component>
					</organizer>
				</entry>
	</xsl:template>
	<xsl:template match="consumableFee"><entry>
					<organizer classCode="CLUSTER" moodCode="EVN">
						<statusCode/>
						<component>
							<observation classCode="OBS" moodCode="EVN">
								<code code="HDSD00.11.038" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="一次性医用 材料费-检查用"/>
								<value xsi:type="MO" value="{consumableExam/Value}" currency="元"/>
							</observation>
						</component>
						<component>
							<observation classCode="OBS" moodCode="EVN">
								<code code="HDSD00.11.040" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="一次性医用 材料费-治疗用"/>
								<value xsi:type="MO" value="{consumableTreatment/Value}" currency="元"/>
							</observation>
						</component>
						<component>
							<observation classCode="OBS" moodCode="EVN">
								<code code="HDSD00.11.039" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="一次性医用 材料费-手术用"/>
								<value xsi:type="MO" value="{consumableSurgery/Value}" currency="元"/>
							</observation>
						</component>
					</organizer>
				</entry>
	</xsl:template>
	<xsl:template match="otherFee">
	<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="HSDB05.10.130" codeSystem="2.16.156.10011.2.2.4" codeSystemName="住院病案首页基本数据集" displayName="其他费"/>
						<value xsi:type="MO" value="{Value}" currency="元"/>
					</observation>
				</entry>
	</xsl:template>
	
</xsl:stylesheet>
