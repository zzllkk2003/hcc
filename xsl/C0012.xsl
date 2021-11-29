<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="xml" indent="yes"/>
	<xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
	<xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
	<xsl:include href="CDA-Support-Files/Location.xsl"/>
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
			<templateId root="2.16.156.10011.2.1.1.32"/>
			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			<title>麻醉术后访视记录</title>
			<xsl:call-template name="effectiveTime"/>
			<xsl:call-template name="Confidentiality"/>
			<xsl:call-template name="languageCode"/>
			<setId/>
			<versionNumber/>
			<!--文档记录对象（患者） [1..*] contextControlCode="OP"表示本信息可以被重载-->
			<recordTarget typeCode="RCT" contextControlCode="OP">
				<patientRole classCode="PAT">
					<!-- 健康档案标识号 -->
					<xsl:apply-templates select="Header/recordTarget/healthCardId" mode="healthRecordNumber"/>
					<!-- 门（急）诊号标识 -->
					<xsl:apply-templates select="Header/recordTarget/outpatientNum" mode="outpatientNum"/>
					<!-- 住院号标识 todo-->
					<xsl:apply-templates select="Header/recordTarget/inpatientNum" mode="inpatientNum"/>
					<!-- 电子申请单编号 -->
					<xsl:apply-templates select="Header/recordTarget/labOrderNum" mode="labOrderNum"/>
					<patient classCode="PSN" determinerCode="INSTANCE">
						<!-- 健康档案标识号 -->
						<xsl:apply-templates select="Header/recordTarget/healthCardId" mode="healthRecordNumber"/>
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
				<xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument" mode="relatedDocument"/>
			</xsl:if>
			
			<!-- 病床号、病房、病区、科室和医院的关联 -->
			<componentOf>
				<encompassingEncounter>
					<!-- 入院日期时间 -->
					<effectiveTime value="20121112102325"/>
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
					<!-- 生命体征章节 -->
					<xsl:comment>生命体征章节</xsl:comment>
					<xsl:apply-templates select="VitalSigns"/>
					<!--一般状况检查章节-->
					<xsl:comment>一般状况检查章节</xsl:comment>
					<xsl:apply-templates select="GeneralStatus"/>
					<!--实验室检查章节-->
					<xsl:comment>实验室检查章节</xsl:comment>
					<xsl:apply-templates select="LabTest"/>
					<!--术前诊断章节-->
					<xsl:comment>术前诊断章节</xsl:comment>
					<xsl:apply-templates select="PreOpDiag"/>
					<!--术后诊断章节-->
					<xsl:comment>术后诊断章节</xsl:comment>
					<xsl:apply-templates select="PostOpDiags/SurgicalOperationNotePostoperativeDX[1]"/>
					<!--手术操作章节-->
					<xsl:comment>手术操作章节</xsl:comment>
					<xsl:apply-templates select="Procedure"/>
					<!--麻醉章节-->
					<xsl:comment>麻醉章节</xsl:comment>
					<xsl:apply-templates select="Anesthesias/Anesthesia"/>
					<!--主要健康问题章节-->
					<xsl:comment>主要健康问题章节</xsl:comment>
					<xsl:apply-templates select="Problem"/>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>

	<!--生命体征章节模板-->
	<xsl:template match="VitalSigns">
		<component>
			<section>
				<code code="8716-3" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
					displayName="VITAL SIGNS"/>
				<text/>
				<!-- 体重 -->
				<xsl:comment>体重</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.10.188.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="体重"/>
						<value xsi:type="PQ" value="{VitalSign/value}" unit="kg"/>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>

	<!--一般状况检查章节模板-->
	<xsl:template match="GeneralStatus">
		<component>
			<section>
				<code code="10210-3" displayName="GENERAL STATUS" codeSystem="2.16.840.1.113883.6.1"
					codeSystemName="LOINC"/>
				<text/>
				<!--一般状况检查结果-->
				<xsl:comment>一般状况检查结果</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.10.219.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="一般状况检查结果"/>
						<value xsi:type="ST">
							<xsl:value-of select="result/Value"/>
						</value>
					</observation>
				</entry>
			</section>
		</component>
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
									codeSystemName="卫生信息数据元目录" displayName="Rh(D)血型代码"/>
								<xsl:choose>
									<xsl:when test="bloodRh/Value and bloodRh/Display">
										<value xsi:type="CD" code="{bloodRh/Value}"
											displayName="{bloodRh/Display}"
											codeSystem="2.16.156.10011.2.3.1.250"
											codeSystemName="Rh(D)血型代码"/>
									</xsl:when>
									<xsl:when test="bloodRh/Value and not(bloodRh/Display)">
										<value xsi:type="CD" code="{bloodRh/Value}"
											codeSystem="2.16.156.10011.2.3.1.250"
											codeSystemName="Rh(D)血型代码"/>
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
				<xsl:apply-templates select="Items/Item"></xsl:apply-templates>
			</section>
		</component>
	</xsl:template>
	<!--术前诊断条目-->
	<xsl:template match="Items/Item">
		<entry>
		<observation classCode="OBS" moodCode="EVN">
			<!--术前诊断编码-->
			<xsl:comment>术前诊断编码</xsl:comment>
			<code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1"
				codeSystemName="卫生信息数据元目录" displayName="术前诊断编码"/>
			<xsl:choose>
				<xsl:when test="diagnosisCode/Value and diagnosisCode/Display">
					<value xsi:type="CD" code="{diagnosisCode/Value}"
						displayName="{diagnosisCode/Display}"
						codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10"/>
				</xsl:when>
				<xsl:when test="diagnosisCode/Value and not(diagnosisCode/Display)">
					<value xsi:type="CD" code="{diagnosisCode/Value}"
						codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10"/>
				</xsl:when>
			</xsl:choose>
			
		</observation>
		</entry>
	</xsl:template>

	<!--术后诊断章节模板-->
	<xsl:template match="PostOpDiags/SurgicalOperationNotePostoperativeDX[1]">
		<component>
			<section>
				<code code="10218-6" displayName="Surgical operation note postoperative Dx"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--术后诊断-->
				<xsl:comment>术后诊断</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<!--术后诊断编码-->
						<xsl:comment>术后诊断编码</xsl:comment>
						<code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="术后诊断编码"/>
						<xsl:choose>
							<xsl:when test="code/Value and code/Display">
								<value xsi:type="CD" code="{code/Value}" displayName="{code/Display}"
									codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10"/>
							</xsl:when>
							<xsl:when test="code/Value and not(code/Display)">
								<value xsi:type="CD" code="{code/Value}"
									codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10"/>
							</xsl:when>
						</xsl:choose>
						
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>

	<!--手术操作章节模板-->
	<xsl:template match="Procedure">
		<component>
			<section>
				<code code="47519-4" displayName="HISTORY OF PROCEDURES"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!-- 手术及操作编码 DE06.00.093.00 -->
				<xsl:comment>手术及操作编码</xsl:comment>
				<entry>
					<procedure classCode="PROC" moodCode="EVN">
						<xsl:choose>
							<xsl:when test="Items/ProcedureItem/code/Value and Items/ProcedureItem/code/Display">
								<code xsi:type="CD" code="{Items/ProcedureItem/code/Value}"
									displayName="{Items/ProcedureItem/code/Display}"
									codeSystem="2.16.156.10011.2.3.3.12"
									codeSystemName="手术(操作)代码表(ICD-9-CM)"/>
							</xsl:when>
							<xsl:when test="Items/ProcedureItem/code/Value and not(Items/ProcedureItem/code/Display)">
								<code xsi:type="CD" code="{Items/ProcedureItem/code/Value}"
									codeSystem="2.16.156.10011.2.3.3.12"
									codeSystemName="手术(操作)代码表(ICD-9-CM)"/>
							</xsl:when>
						</xsl:choose>
						
					</procedure>
				</entry>

			</section>
		</component>
	</xsl:template>

	<!--麻醉章节模板-->
	<xsl:template match="Anesthesias/Anesthesia">
		<component>
			<section>
				<code code="59774-0" displayName="Procedure anesthesia"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!-- 麻醉方法代码 -->
				<xsl:comment>麻醉方法代码</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.073.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="麻醉方法代码"/>
						<value xsi:type="CD" code="{method/Value}" displayName="{method/Display}"
							codeSystem="2.16.156.10011.2.3.1.159" codeSystemName="麻醉方法代码表"/>
						<!-- 麻醉适应证 -->
						<xsl:comment>麻醉适应证</xsl:comment>
						<entryRelationship typeCode="COMP">
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE06.00.227.00" codeSystem="2.16.156.10011.2.2.1"
									codeSystemName="卫生信息数据元目录" displayName="麻醉适应证"/>
								<value xsi:type="ST"><xsl:value-of select="indication/Value"/></value>
							</observation>
						</entryRelationship>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>

	<!--主要健康问题章节模板-->
	<xsl:template match="Problem">
		<component>
			<section>
				<code code="11450-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
					displayName="PROBLEM LIST"/>
				<text/>
				<!-- 麻醉恢复情况 -->
				<xsl:comment>麻醉恢复情况</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.225.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="麻醉恢复情况"/>
						<value xsi:type="ST">
							<xsl:value-of select="anesthesiaRecovery/Value"/>
						</value>
					</observation>
				</entry>
				<!-- 清醒日期时间 -->
				<xsl:comment>清醒日期时间</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.233.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="清醒日期时间"/>
						<value xsi:type="TS" value="{wakeupTime/Value}"/>
					</observation>
				</entry>
				<!-- 拔除气管插管标志 -->
				<xsl:comment>拔除气管插管标志</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.165.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="拔除气管插管标志"/>
						<value xsi:type="BL" value="{intubationRemoval/Value}"/>
					</observation>
				</entry>
				<!-- 特殊情况 -->
				<xsl:comment>特殊情况</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.158.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="特殊情况"/>
						<value xsi:type="ST">
							<xsl:value-of select="exception/Value"/>
						</value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>

</xsl:stylesheet>
