<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
	<xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
	<xsl:include href="CDA-Support-Files/Location.xsl"/>
	<xsl:output method="xml"/>
	<xsl:template match="/Document">
		<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif"
			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

			<!--
********************************************************
 CDA Header
********************************************************
-->
			<realmCode code="CN"/>
			<typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
			<templateId root="2.16.156.10011.2.1.1.31"/>
			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			<title>麻醉记录</title>
			<xsl:call-template name="effectiveTime"/>
			<xsl:call-template name="Confidentiality"/>
			<xsl:call-template name="languageCode"/>
			<setId/>
			<versionNumber/>
			<!--文档记录对象（患者） [1..*] contextControlCode="OP"表示本信息可以被重载-->
			<recordTarget typeCode="RCT" contextControlCode="OP">
				<patientRole classCode="PAT">
					<!-- 门（急）诊号标识 -->
					<xsl:apply-templates select="Header/recordTarget/outpatientNum"
						mode="outpatientNum"/>
					<!-- 住院号标识 todo-->
					<xsl:apply-templates select="Header/recordTarget/inpatientNum"
						mode="inpatientNum"/>
					<!-- 电子申请单编号 -->
					<xsl:apply-templates select="Header/recordTarget/labOrderNum" mode="labOrderNum"/>
					<patient classCode="PSN" determinerCode="INSTANCE">
						<!--患者姓名，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientName"
							mode="Name"/>
						<!-- 性别，必选 -->
						<xsl:apply-templates
							select="Header/recordTarget/patient/administrativeGender" mode="Gender"/>
						<!-- 年龄 -->
						<xsl:apply-templates select="Header/recordTarget/patient/ageInYear"
							mode="Age"/>
					</patient>
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
				<xsl:if test="assignedEntityCode = '麻醉医师'">
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
				<xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument"
					mode="relatedDocument"/>
			</xsl:if>
			
			<!-- 病床号、病房、病区、科室和医院的关联 -->
			<componentOf>
				<encompassingEncounter>
					<!-- 入院日期时间 -->
					<effectiveTime value="{Header/encompassingEncounter/effectiveTimeLow/Value}"/>
					<location>
						<healthCareFacility>
							<serviceProviderOrganization>
								<asOrganizationPartOf classCode="PART">
									<!-- DE01.00.026.00	病床号 -->
									<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
										<xsl:if test="Header/encompassingEncounter/Locations/Location/bedId">
											<id root="2.16.156.10011.1.22" extension="{Header/encompassingEncounter/Locations/Location/bedId}"/>
										</xsl:if>
										
										<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/bedNum/Value"/></name>
										<!-- DE01.00.019.00	病房号 -->
										<asOrganizationPartOf classCode="PART">
											<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
												<xsl:if test="Header/encompassingEncounter/Locations/Location/wardId">
													<id root="2.16.156.10011.1.21" extension="{Header/encompassingEncounter/Locations/Location/wardId}"/>
												</xsl:if>
												
												<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/wardName/Value"/></name>
												<!-- DE08.10.026.00	科室名称 -->
												<asOrganizationPartOf classCode="PART">
												<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
												<xsl:if test="Header/encompassingEncounter/Locations/Location/deptId">
													<id root="2.16.156.10011.1.26" extension="{Header/encompassingEncounter/Locations/Location/deptId}"/>
												</xsl:if>
												
												<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/deptName/Value"/></name>
												<!-- DE08.10.054.00	病区名称 -->
												<asOrganizationPartOf classCode="PART">
												<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
												<xsl:if test="Header/encompassingEncounter/Locations/Location/areaId">
													<id root="2.16.156.10011.1.27" extension="{Header/encompassingEncounter/Locations/Location/areaId}"/>
												</xsl:if>
												
												<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/areaName/Value"/></name>
												<!--XXX医院 -->
												<asOrganizationPartOf classCode="PART">
												<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
												<xsl:if test="Header/encompassingEncounter/Locations/Location/hosId">
													<id root="2.16.156.10011.1.5" extension="{Header/encompassingEncounter/Locations/Location/hosId}"/>
												</xsl:if>
												
												<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/hosName"/></name>
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
			<!--***************************************************
文档体Body
*******************************************************
-->
			<component>
				<structuredBody>
					<!--实验室检查章节-->
					<xsl:comment>实验室检查章节</xsl:comment>
					<xsl:apply-templates select="LabTest"/>
					<!--术前诊断章节-->
					<xsl:comment>术前诊断章节</xsl:comment>
					<xsl:apply-templates select="PreOpDiag"/>
					<!--术后诊断章节-->
					<xsl:comment>术后诊断章节</xsl:comment>
					<xsl:apply-templates select="PostOpDiags"/>
					<!--用药管理章节 1..*-->
					<xsl:comment>用药管理章节</xsl:comment>
					<xsl:apply-templates select="MedicationAdministereds"/>
					<!--输液章节-->
					<xsl:comment>输液章节</xsl:comment>
					<xsl:if test="Infusion">
						<xsl:apply-templates select="Infusion"/>
					</xsl:if>
					<!--输血章节-->
					<xsl:comment>输血章节</xsl:comment>
					<xsl:if test="BloodTransfusion">
						<xsl:apply-templates select="BloodTransfusion"/>
					</xsl:if>
					<!--麻醉章节-->
					<xsl:comment>麻醉章节</xsl:comment>
					<xsl:apply-templates select="Anesthesias"/>
					<!--主要健康问题章节-->
					<xsl:comment>主要健康问题章节</xsl:comment>
					<xsl:apply-templates select="Problem"/>
					<!--生命体征章节-->
					<xsl:comment>生命体征章节</xsl:comment>
					<xsl:apply-templates select="VitalSigns"/>
					<!--手术操作章节-->
					<xsl:comment>手术操作章节</xsl:comment>
					<xsl:apply-templates select="Procedure/Items"/>
					<!--失血章节-->
					<xsl:comment>失血章节</xsl:comment>
					<xsl:if test="BloodLoss">
						<xsl:apply-templates select="BloodLoss"/>
					</xsl:if>
					<!--术后去向章节-->
					<xsl:comment>术后去向章节</xsl:comment>
					<xsl:apply-templates select="ProcedureDisposition"/>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>

	<!--实验室检查章节章节模板-->
	<xsl:template match="LabTest">
		<component>
			<section>
				<code code="30954-2" displayName="STUDIES SUMMARY"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<entry typeCode="COMP">
					<!-- 血型-->
					<xsl:comment>血型</xsl:comment>
					<organizer classCode="BATTERY" moodCode="EVN">
						<statusCode/>
						<component typeCode="COMP" contextConductionInd="true">
							<!-- ABO血型 -->
							<xsl:comment>ABO血型</xsl:comment>
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE04.50.001.00" codeSystem="2.16.156.10011.2.2.1"
									codeSystemName="卫生信息数据元目录" displayName="ABO血型代码"/>
								<xsl:choose>
									<xsl:when test="bloodABO/Value and bloodABO/Display">
										<value xsi:type="CD" code="{bloodABO/Value}"
											displayName="{bloodABO/Display}"
											codeSystem="2.16.156.10011.2.3.1.85" codeSystemName="ABO血型代码表"/>
									</xsl:when>
									<xsl:when test="bloodABO/Value and not(bloodABO/Display)">
										<value xsi:type="CD" code="{bloodABO/Value}"
											codeSystem="2.16.156.10011.2.3.1.85" codeSystemName="ABO血型代码表"/>
									</xsl:when>
								</xsl:choose>
								
							</observation>
						</component>
						<component typeCode="COMP" contextConductionInd="true">
							<!-- Rh血型 -->
							<xsl:comment>Rh血型</xsl:comment>
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE04.50.010.00" codeSystem="2.16.156.10011.2.2.1"
									codeSystemName="卫生信息数据元目录" displayName="Rh（D）血型代码"/>
								<xsl:choose>
									<xsl:when test="bloodRh/Value and bloodRh/Display">
										<value xsi:type="CD" code="{bloodRh/Value}"
											displayName="{bloodRh/Display}"
											codeSystem="2.16.156.10011.2.3.1.250"
											codeSystemName="Rh（D）血型代码表"/>
									</xsl:when>
									<xsl:when test="bloodRh/Value and not(bloodRh/Display)">
										<value xsi:type="CD" code="{bloodRh/Value}"
											codeSystem="2.16.156.10011.2.3.1.250"
											codeSystemName="Rh（D）血型代码表"/>
									</xsl:when>
								</xsl:choose>
								
							</observation>
						</component>
					</organizer>
				</entry>
			</section>
		</component>
	</xsl:template>

	<!--术前诊断章节模板-->
	<xsl:template match="PreOpDiag">
		<component>
			<section>
				<code code="10219-4" displayName="Surgical operation note preoperative Dx"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--术前诊断-->
				<xsl:comment>术前诊断</xsl:comment>
				<xsl:apply-templates select="Items/Item"/>
			</section>
		</component>
	</xsl:template>
	<!--术前诊断条目-->
	<xsl:template match="Items/Item">
		<xsl:if test="diagnosisCode/Value">
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<!--术前诊断编码-->
					<xsl:comment>术前诊断编码</xsl:comment>
					<code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1"
						codeSystemName="卫生信息数据元目录" displayName="术前诊断编码"/>
					<xsl:choose>
						<xsl:when test="diagnosisCode/Value and diagnosisCode/Display">
							<value xsi:type="CD" code="{diagnosisCode/Value}"
								displayName="{diagnosisCode/Display}" codeSystem="2.16.156.10011.2.3.3.11.3"
								codeSystemName="诊断代码表（ICD-10）"/>
						</xsl:when>
						<xsl:when test="diagnosisCode/Value and not(diagnosisCode/Display)">
							<value xsi:type="CD" code="{diagnosisCode/Value}"
								codeSystem="2.16.156.10011.2.3.3.11.3"
								codeSystemName="诊断代码表（ICD-10）"/>
						</xsl:when>
					</xsl:choose>
				</observation>
			</entry>
		</xsl:if>
	</xsl:template>

	<!--术后诊断章节模板-->
	<xsl:template match="PostOpDiags">
		<component>
			<section>
				<code code="10218-6" displayName="Surgical operation note postoperative Dx"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--术后诊断-->
				<xsl:comment>术后诊断</xsl:comment>
				<xsl:if test="SurgicalOperationNotePostoperativeDX[1]/code/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<!--术后诊断编码-->
							<xsl:comment>术后诊断编码</xsl:comment>
							<code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1"
								codeSystemName="卫生信息数据元目录" displayName="术后诊断编码"/>
							<xsl:choose>
								<xsl:when test="SurgicalOperationNotePostoperativeDX[1]/code/Value and SurgicalOperationNotePostoperativeDX[1]/code/Display">
									<value xsi:type="CD" code="{SurgicalOperationNotePostoperativeDX[1]/code/Value}" displayName="{SurgicalOperationNotePostoperativeDX[1]/code/Display}"
										codeSystem="2.16.156.10011.2.3.3.11.3" codeSystemName="诊断代码表（ICD-10）"/>
								</xsl:when>
								<xsl:when test="SurgicalOperationNotePostoperativeDX[1]/code/Value and not(SurgicalOperationNotePostoperativeDX[1]/code/Display)">
									<value xsi:type="CD" code="{SurgicalOperationNotePostoperativeDX[1]/code/Value}"
										codeSystem="2.16.156.10011.2.3.3.11.3" codeSystemName="诊断代码表（ICD-10）"/>
								</xsl:when>
							</xsl:choose>
							
						</observation>
					</entry>
				</xsl:if>
			</section>
		</component>
	</xsl:template>

	<!--用药管理章节模板-->
	<xsl:template match="MedicationAdministereds">
		<component>
			<section>
				<code code="18610-6" displayName="MEDICATION ADMINISTERED"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--药物使用条目-->
				<xsl:comment>药物使用条目</xsl:comment>
				<xsl:apply-templates select="MedicationAdministered"/>
			</section>
		</component>
	</xsl:template>
	<!--药物使用条目-->
	<xsl:template match="MedicationAdministered">
		<entry>
			<substanceAdministration classCode="SBADM" moodCode="EVN">
				<text/>
				<!--药物使用途径代码 -->
				<xsl:comment>药物使用途径代码</xsl:comment>
				<xsl:if test="route/Value">
					<routeCode code="{route/Value}" displayName="口服"
						codeSystem="2.16.156.10011.2.3.1.158" codeSystemName="用药途径代码表"/>
				</xsl:if>
				
				<!--药物使用次剂量 -->
				<xsl:comment>药物使用次剂量</xsl:comment>
				<xsl:if test="dose/Value">
					<doseQuantity value="{dose/Value}" unit="mg"/>
				</xsl:if>
				<xsl:if test="name/Value">
					<consumable>
						<manufacturedProduct>
							<manufacturedLabeledDrug>
								<!--药品代码及名称(通用名) -->
								<xsl:comment>药品代码及名称</xsl:comment>
								<code/>
								<name>
									<xsl:value-of select="name/Value"/>
								</name>
							</manufacturedLabeledDrug>
						</manufacturedProduct>
					</consumable>
				</xsl:if>
				
				<!--药物用法 -->
				<xsl:comment>药物用法</xsl:comment>
				<xsl:if test="usage/Value">
					<entryRelationship typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.136.00" codeSystem="2.16.156.10011.2.2.1"
								codeSystemName="卫生信息数据元目录" displayName="药物用法"/>
							<value xsi:type="ST">
								<xsl:value-of select="usage/Value"/>
							</value>
						</observation>
					</entryRelationship>
				</xsl:if>
				
				<!--药物使用频率 -->
				<xsl:comment>药物使用频率</xsl:comment>
				<xsl:if test="rate/Value">
					<entryRelationship typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.133.00" codeSystem="2.16.156.10011.2.2.1"
								codeSystemName="卫生信息数据元目录" displayName="药物使用频率"/>
							<xsl:choose>
								<xsl:when test="rate/Value and rate/Display">
									<value xsi:type="CD" code="{rate/Value}" displayName="{rate/Display}"
										codeSystem="2.16.156.10011.2.3.1.267" codeSystemName="药物使用频次代码表"/>
								</xsl:when>
								<xsl:when test="rate/Value and not(rate/Display)">
									<value xsi:type="CD" code="{rate/Value}"
										codeSystem="2.16.156.10011.2.3.1.267" codeSystemName="药物使用频次代码表"/>
								</xsl:when>
							</xsl:choose>
							
						</observation>
					</entryRelationship>
				</xsl:if>
				
				<!--药物使用剂量单位 -->
				<xsl:comment>药物使用剂量单位</xsl:comment>
				<xsl:if test="unit/Value">
					<entryRelationship typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE08.50.024.00" codeSystem="2.16.156.10011.2.2.1"
								codeSystemName="卫生信息数据元目录" displayName="药物使用剂量单位"/>
							<value xsi:type="ST">
								<xsl:value-of select="unit/Value"/>
							</value>
						</observation>
					</entryRelationship>
				</xsl:if>
				
				<!--药物使用总剂量 -->
				<xsl:comment>药物使用总剂量</xsl:comment>
				<xsl:if test="totalDose/Value">
					<entryRelationship typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.135.00" codeSystem="2.16.156.10011.2.2.1"
								codeSystemName="卫生信息数据元目录" displayName="药物使用总剂量"/>
							<value xsi:type="PQ" value="{totalDose/Value}" unit="g"/>
						</observation>
					</entryRelationship>
				</xsl:if>
			</substanceAdministration>
		</entry>
	</xsl:template>

	<!--用药管理章节模板-->
	<xsl:template match="Infusion">
		<component>
			<section>
				<code code="10216-0" displayName="Surgical operation note fluids"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--术中输液项目 -->
				<xsl:comment>术中输液项目</xsl:comment>
				<xsl:if test="item/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.269.00" codeSystem="2.16.156.10011.2.2.1"
								codeSystemName="卫生信息数据元目录" displayName="术中输液项目"/>
							<value xsi:type="ST">
								<xsl:value-of select="item/Value"/>
							</value>
						</observation>
					</entry>
				</xsl:if>
			</section>
		</component>
	</xsl:template>

	<!--输血章节模板-->
	<xsl:template match="BloodTransfusion">
		<component>
			<section>
				<code code="56836-0" codeSystem="2.16.840.1.113883.6.1"
					displayName="History of blood transfusion" codeSystemName="LOINC"/>
				<text/>
				<entry>
					<procedure classCode="PROC" moodCode="EVN">
						<!--输血日期时间 -->
						<xsl:comment>输血日期时间</xsl:comment>
						<xsl:if test="beginTime/Value">
							<effectiveTime>
								<high value="{beginTime/Value}"/>
							</effectiveTime>
						</xsl:if>
						
						<!--输血品种代码 -->
						<xsl:comment>输血品种代码</xsl:comment>
						<xsl:if test="type/Value">
							<entryRelationship typeCode="COMP">
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE08.50.040.00" codeSystem="2.16.156.10011.2.2.1"
										codeSystemName="卫生信息数据元目录" displayName="输血品种代码"/>
									<xsl:choose>
										<xsl:when test="type/Value and type/Display">
											<value xsi:type="CD" code="{type/Value}" displayName="{type/Display}"
												codeSystem="2.16.156.10011.2.3.1.251" codeSystemName="输血品种代码表"/>
										</xsl:when>
										<xsl:when test="type/Value and not(type/Display)">
											<value xsi:type="CD" code="{type/Value}"
												codeSystem="2.16.156.10011.2.3.1.251" codeSystemName="输血品种代码表"/>
										</xsl:when>
									</xsl:choose>
								</observation>
							</entryRelationship>
						</xsl:if>
						
						<!--输血量（mL） -->
						<xsl:comment>输血量</xsl:comment>
						<xsl:if test="volume/Value">
							<entryRelationship typeCode="COMP">
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.267.00" codeSystem="2.16.156.10011.2.2.1"
										codeSystemName="卫生信息数据元目录" displayName="输血量（mL）"/>
									<value xsi:type="PQ" value="{volume/Value}" unit="mL"/>
								</observation>
							</entryRelationship>
						</xsl:if>
						
						<!--输血量计量单位 -->
						<xsl:comment>输血量计量单位</xsl:comment>
						<xsl:if test="unit/Value">
							<entryRelationship typeCode="COMP">
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE08.50.036.00" codeSystem="2.16.156.10011.2.2.1"
										codeSystemName="卫生信息数据元目录" displayName="输血量计量单位"/>
									<value xsi:type="ST">
										<xsl:value-of select="unit/Value"/>
									</value>
								</observation>
							</entryRelationship>
						</xsl:if>
						
						<!--输血反应标志 -->
						<xsl:comment>输血反应标志</xsl:comment>
						<xsl:if test="reaction/Value">
							<entryRelationship typeCode="COMP">
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.264.00" codeSystem="2.16.156.10011.2.2.1"
										codeSystemName="卫生信息数据元目录" displayName="输血反应标志"/>
									<value xsi:type="BL" value="{reaction/Value}"/>
								</observation>
							</entryRelationship>
						</xsl:if>
						
					</procedure>
				</entry>
			</section>
		</component>
	</xsl:template>

	<!--麻醉章节模板-->
	<xsl:template match="Anesthesias">
		<component>
			<section>
				<code code="59774-0" displayName="Procedure anesthesia"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--麻醉条目-->
				<xsl:comment>职业</xsl:comment>
				<xsl:apply-templates select="Anesthesia"/>
			</section>
		</component>
	</xsl:template>
	<!--麻醉条目-->
	<xsl:template match="Anesthesia">
		<entry>
			<!-- 1..1 麻醉记录 -->
			<xsl:comment>麻醉记录</xsl:comment>
			<procedure classCode="PROC" moodCode="EVN">
				<!--麻醉方法代码-->
				<xsl:comment>麻醉方法代码</xsl:comment>
				<code code="{method/Value}" displayName="全身麻醉" codeSystem="2.16.156.10011.2.3.1.159"
					codeSystemName="麻醉方法代码表"/>
				<effectiveTime>
					<!--麻醉开始日期时间-->
					<xsl:comment>麻醉开始日期时间</xsl:comment>
					<low value="{beginTime/Value}"/>
				</effectiveTime>
				<!--ASA分级标准代码 -->
				<xsl:comment>ASA分级标准代码</xsl:comment>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.129.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="ASA分级标准代码"/>
						<xsl:choose>
							<xsl:when test="ASA/Value and ASA/Display">
								<value xsi:type="CD" code="{ASA/Value}" displayName="{ASA/Display}"
									codeSystem="2.16.156.10011.2.3.1.255"
									codeSystemName="美国麻醉医师协会(ASA)分级标准代码表"/>
							</xsl:when>
							<xsl:when test="ASA/Value and not(ASA/Display)">
								<value xsi:type="CD" code="{ASA/Value}"
									codeSystem="2.16.156.10011.2.3.1.255"
									codeSystemName="美国麻醉医师协会(ASA)分级标准代码表"/>
							</xsl:when>
						</xsl:choose>
						
					</observation>
				</entryRelationship>
				<!--气管插管分类 -->
				<xsl:comment>气管插管分类</xsl:comment>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.228.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="气管插管分类"/>
						<value xsi:type="ST"><xsl:value-of select="intubation/Value"/></value>
					</observation>
				</entryRelationship>
				<!--麻醉药物名称 -->
				<xsl:comment>麻醉药物名称</xsl:comment>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE08.50.022.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="麻醉药物名称"/>
						<value xsi:type="ST"><xsl:value-of select="anesthetic/Value"/></value>
					</observation>
				</entryRelationship>
				<!--麻醉体位 -->
				<xsl:comment>麻醉体位</xsl:comment>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.10.260.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="麻醉体位"/>
						<value xsi:type="ST"><xsl:value-of select="position/Value"/></value>
					</observation>
				</entryRelationship>
				<!--呼吸类型代码 -->
				<xsl:comment>呼吸类型代码</xsl:comment>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.208.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="呼吸类型代码"/>
						<xsl:choose>
							<xsl:when test="breathingType/Value and breathingType/Display">
								<value xsi:type="CD" code="{breathingType/Value}" displayName="{breathingType/Display}"
									codeSystem="2.16.156.10011.2.3.2.1" codeSystemName="呼吸类型代码表"/>
							</xsl:when>
							<xsl:when test="breathingType/Value and not(breathingType/Display)">
								<value xsi:type="CD" code="{breathingType/Value}"
									codeSystem="2.16.156.10011.2.3.2.1" codeSystemName="呼吸类型代码表"/>
							</xsl:when>
						</xsl:choose>
						
					</observation>
				</entryRelationship>
				<!--麻醉描述 -->
				<xsl:comment>麻醉描述</xsl:comment>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.226.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="麻醉描述"/>
						<value xsi:type="ST"><xsl:value-of select="notes/Value"/></value>
					</observation>
				</entryRelationship>
				<!--麻醉合并症标志代码 -->
				<xsl:comment>麻醉合并症标志代码</xsl:comment>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.01.077.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="麻醉合并症标志代码"/>
						<xsl:choose>
							<xsl:when test="complication/Value and complication/Display">
								<value xsi:type="CD" code="{complication/Value}" displayName="{complication/Display}"
									codeSystem="2.16.156.10011.2.3.2.59" codeSystemName="麻醉合并症标志代码表"/>
							</xsl:when>
							<xsl:when test="complication/Value and not(complication/Display)">
								<value xsi:type="CD" code="{complication/Value}"
									codeSystem="2.16.156.10011.2.3.2.59" codeSystemName="麻醉合并症标志代码表"/>
							</xsl:when>
						</xsl:choose>
						
					</observation>
				</entryRelationship>
				<!--穿刺过程 -->
				<xsl:comment>穿刺过程</xsl:comment>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.063.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="穿刺过程"/>
						<value xsi:type="ST"><xsl:value-of select="puncture/Value"/></value>
					</observation>
				</entryRelationship>
				<!--麻醉效果 -->
				<xsl:comment>麻醉效果</xsl:comment>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.253.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="麻醉效果"/>
						<value xsi:type="ST"><xsl:value-of select="effect/Value"/></value>
					</observation>
				</entryRelationship>
				<!--麻醉前用药 -->
				<xsl:comment>麻醉前用药</xsl:comment>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.136.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="麻醉前用药"/>
						<value xsi:type="ST"><xsl:value-of select="premedication/Value"/></value>
					</observation>
				</entryRelationship>
			</procedure>
		</entry>
	</xsl:template>

	<!--主要健康问题章节-->
	<xsl:template match="Problem">
		<component>
			<section>
				<code code="11450-4" displayName="PROBLEM LIST" codeSystem="2.16.840.1.113883.6.1"
					codeSystemName="LOINC"/>
				<text/>
				<!--常规监测项目条目-->
				<xsl:comment>常规监测项目条目</xsl:comment>
				<xsl:apply-templates select="regMonitors/RegularMonitor"/>
				<!--特殊监测项目条目-->
				<xsl:comment>特殊监测项目条目</xsl:comment>
				<xsl:apply-templates select="speMonitors/SpecialMonitor"/>
			</section>
		</component>
	</xsl:template>
	<!--常规监测项目条目-->
	<xsl:template match="regMonitors/RegularMonitor">
		<entry>
			<!--常规监测项目名称 -->
			<xsl:comment>常规监测项目名称</xsl:comment>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE06.00.216.00" codeSystem="2.16.156.10011.2.2.1"
					codeSystemName="卫生信息数据元目录" displayName="常规监测项目名称"/>
				<value xsi:type="ST">
					<xsl:value-of select="regularMonitor/Value"/>
				</value>
				<!--常规监测项目结果 -->
				<xsl:comment>常规监测项目结果</xsl:comment>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.281.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="常规监测项目结果"/>
						<value xsi:type="ST">
							<xsl:value-of select="regularMonitorResult/Value"/>
						</value>
					</observation>
				</entryRelationship>
			</observation>
		</entry>
	</xsl:template>
	<!--特殊监测项目条目-->
	<xsl:template match="speMonitors/SpecialMonitor">
		<entry>
			<!--特殊监测项目名称 -->
			<xsl:comment>特殊监测项目名称</xsl:comment>
			<observation classCode="OBS" moodCode="EVN">
				<xsl:if test="Item/Value">
					<code code="DE06.00.216.00" codeSystem="2.16.156.10011.2.2.1"
						codeSystemName="卫生信息数据元目录" displayName="特殊监测项目名称"/>
					<value xsi:type="ST">
						<xsl:value-of select="Item/Value"/>
					</value>
				</xsl:if>
				
				<!--特殊监测项目结果 -->
				<xsl:comment>特殊监测项目结果</xsl:comment>
				<xsl:if test="Result/Value">
					<entryRelationship typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.281.00" codeSystem="2.16.156.10011.2.2.1"
								codeSystemName="卫生信息数据元目录" displayName="特殊监测项目结果"/>
							<value xsi:type="ST">
								<xsl:value-of select="Result/Value"/>
							</value>
						</observation>
					</entryRelationship>
				</xsl:if>
				
			</observation>
		</entry>
	</xsl:template>


	<!--生命体征章节模板-->
	<xsl:template match="VitalSigns">
		<component>
			<section>
				<code code="8716-3" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
					displayName="VITAL SIGNS"/>
				<text/>
				<!--体重条目-->
				<xsl:apply-templates select="VitalSign" mode="weight"></xsl:apply-templates>
				<!--体温条目-->
				<xsl:apply-templates select="VitalSign" mode="temp"></xsl:apply-templates>
				<!--脉率条目-->
				<xsl:apply-templates select="VitalSign" mode="pulse"></xsl:apply-templates>
				<!--呼吸频率条目-->
				<xsl:apply-templates select="VitalSign" mode="breathing"></xsl:apply-templates>
				<!--起搏器心率条目-->
				<xsl:apply-templates select="VitalSign" mode="heart"></xsl:apply-templates>
				
				<entry>
					<organizer classCode="BATTERY" moodCode="EVN">
						<code displayName="血压"/>
						<statusCode/>
						<!--收缩压条目-->
						<xsl:apply-templates select="VitalSign" mode="systolic"></xsl:apply-templates>
						
						<!--舒张压条目-->
						<xsl:apply-templates select="VitalSign" mode="diastolic"></xsl:apply-templates>		
					</organizer>
				</entry>
			</section>
		</component>
	</xsl:template>
	<!--体重条目-->
	<xsl:template match="*" mode="weight">
		<xsl:if test ="type ='DE04.10.188.00'">
			<xsl:comment>体重</xsl:comment>
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE04.10.188.00" codeSystem="2.16.156.10011.2.2.1"
						codeSystemName="卫生信息数据元目录" displayName="体重"/>
					<value xsi:type="PQ" value="{value}" unit="kg"/>
				</observation>
			</entry>
		</xsl:if>
	</xsl:template>
	<!--体温条目-->
	<xsl:template match="*" mode="temp">
		<xsl:if test ="type ='DE04.10.186.00'">
			<!-- 体温 -->
			<xsl:comment>体温</xsl:comment>
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE04.10.186.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="体温"/>
					<value xsi:type="PQ" value="{value}" unit="℃"/>
				</observation>
			</entry>
		</xsl:if>
	</xsl:template>
	<!--脉率条目-->
	<xsl:template match="*" mode="pulse">
		<xsl:if test="type ='DE04.10.118.00'">
			<!-- 脉率 -->
			<xsl:comment>脉率</xsl:comment>
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE04.10.118.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="脉率"/>
					<value xsi:type="PQ" value="{value}" unit="次/min"/>
				</observation>
			</entry>
		</xsl:if>
	</xsl:template>
	<!--呼吸频率条目-->
	<xsl:template match="*" mode="breathing">
		<xsl:if test="type ='DE04.10.081.00'">
			<!-- 呼吸频率 -->
			<xsl:comment>呼吸频率</xsl:comment>
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE04.10.081.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="呼吸频率"/>
					<value xsi:type="PQ" value="{value}" unit="次/min"/>
				</observation>
			</entry>
		</xsl:if>
	</xsl:template>
	<!--起搏器心率条目-->
	<xsl:template match="*" mode="heart">
		<xsl:if test="type ='DE04.10.206.00'">
			<!-- 起搏器心率 -->
			<xsl:comment>起搏器心率</xsl:comment>
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE04.10.206.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="心率"/>
					<value xsi:type="PQ" value="{value}" unit="次/min"/>
				</observation>
			</entry>
		</xsl:if>
	</xsl:template>
	<!--收缩压条目-->
	<xsl:template match="*" mode="systolic">
		<xsl:if test="type ='DE04.10.174.00' ">
			<!-- 收缩压 -->
			<xsl:comment>收缩压</xsl:comment>
			<component>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE04.10.174.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="收缩压"/>
					<value xsi:type="PQ" value="{value}" unit="mmHg"/>
				</observation>
			</component>
		</xsl:if>
	</xsl:template>
	<!--舒张压条目-->
	<xsl:template match="*" mode="diastolic">
		<xsl:if test="type ='DE04.10.176.00' ">
			<!-- 舒张压 -->
			<xsl:comment>舒张压</xsl:comment>
			<component>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE04.10.176.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="舒张压"/>
					<value xsi:type="PQ" value="{value}" unit="mmHg"/>
				</observation>
			</component>
		</xsl:if>
	</xsl:template>

	<!--手术操作章节模板-->
	<xsl:template match="Procedure/Items">
		<component>
			<section>
				<code code="47519-4" displayName="HISTORY OF PROCEDURES"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--手术记录条目-->
				<xsl:comment>手术记录条目</xsl:comment>
				<xsl:apply-templates select="ProcedureItem"/>
			</section>
		</component>
	</xsl:template>
	<!--手术记录条目-->
	<xsl:template match="ProcedureItem">
		<entry>
			<!-- 1..1 手术记录 -->
			<xsl:comment>手术记录</xsl:comment>
			<procedure classCode="PROC" moodCode="EVN">
				<code code="{code/Value}" codeSystem="2.16.156.10011.2.3.3.12"
					codeSystemName="手术(操作)代码表（ICD-9-CM）"/>
				<!--操作日期/时间-->
				<xsl:comment>操作日期/时间</xsl:comment>
				<effectiveTime>
					<!--手术开始日期时间-->
					<low value="{beginTime/Value}"/>
					<!--手术结束日期时间-->
					<high value="{endTime/Value}"/>
				</effectiveTime>
				<!--手术者姓名-->
				<xsl:comment>手术者姓名</xsl:comment>
				<performer>
					<assignedEntity>
						<id/>
						<assignedPerson>
							<name>
								<xsl:value-of select="anesthesiaDoctor/Value"/>
							</name>
						</assignedPerson>
					</assignedEntity>
				</performer>
				<!--手术间编号-->
				<xsl:comment>手术间编号</xsl:comment>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.256.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="患者实施手术所在的手术室编号"/>
						<value xsi:type="ST">
							<xsl:value-of select="room/Value"/>
						</value>
					</observation>
				</entryRelationship>
				<!--手术体位代码 -->
				<xsl:comment>手术体位代码</xsl:comment>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.260.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="手术体位代码"/>
						<xsl:choose>
							<xsl:when test="position/Value and position/Display">
								<value xsi:type="CD" code="{position/Value}"
									displayName="{position/Display}" codeSystem="2.16.156.10011.2.3.1.262"
									codeSystemName="手术体位代码表"/>
							</xsl:when>
							<xsl:when test="position/Value and not(position/Display)">
								<value xsi:type="CD" code="{position/Value}"
									codeSystem="2.16.156.10011.2.3.1.262"
									codeSystemName="手术体位代码表"/>
							</xsl:when>
						</xsl:choose>
						
					</observation>
				</entryRelationship>
				<!--诊疗过程描述 -->
				<xsl:comment>诊疗过程描述</xsl:comment>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.296.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="诊疗过程描述"/>
						<value xsi:type="ST">
							<xsl:value-of select="notes/Value"/>
						</value>
					</observation>
				</entryRelationship>
			</procedure>
		</entry>
	</xsl:template>

	<!--失血章节模板-->
	
	<xsl:template match="BloodLoss">
		<xsl:if test="BloodLoss/Value">
			<component>
				<section>
					<code code="55103-6" displayName="Surgical operation note estimated blood loss"
						codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
					<text/>
					<!--出血量条目-->
					<xsl:comment>出血量条目</xsl:comment>
					<xsl:if test="Value">
						<entry>
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE06.00.097.00" codeSystem="2.16.156.10011.2.2.1"
									codeSystemName="卫生信息数据元目录" displayName="出血量（mL）"/>
								<value xsi:type="PQ" unit="mL" value="{Value}"/>
							</observation>
						</entry>	
					</xsl:if>
						
				</section>
			</component>
		</xsl:if>	
	</xsl:template>

	<!--术后去向章节模板-->
	<xsl:template match="ProcedureDisposition">
		<component>
			<section>
				<code code="59775-7" displayName="Procedure disposition"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--术后去向代码条目-->
				<xsl:comment>术后去向代码条目</xsl:comment>
				<xsl:if test="disposition/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.185.00" codeSystem="2.16.156.10011.2.2.1"
								codeSystemName="卫生信息数据元目录" displayName="患者去向代码"/>
							<effectiveTime>
								<!--出手术室日期时间-->
								<xsl:comment>出手术室日期时间</xsl:comment>
								<high value="{leaveTime/Value}"/>
							</effectiveTime>
							<value xsi:type="ST">
								<xsl:value-of select="disposition/Value"/>
							</value>
						</observation>
					</entry>
				</xsl:if>
			</section>
		</component>
	</xsl:template>

</xsl:stylesheet>
