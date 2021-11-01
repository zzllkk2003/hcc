<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="xml"/>
	<xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
	<xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
	<xsl:include href="CDA-Support-Files/Location.xsl"/>
	<xsl:template match="/Document">
		<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<realmCode code="CN"/>
			<typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
			<templateId root="2.16.156.10011.2.1.1.52"/>
			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			<title>输血记录</title>
			<!-- 文档机器生成时间 -->
			<xsl:call-template name="effectiveTime"/>
			<xsl:call-template name="Confidentiality"/>
			<xsl:call-template name="languageCode"/>
			<setId/>
			<versionNumber/>
			<!--文档记录对象（患者）-->
			<recordTarget typeCode="RCT" contextControlCode="OP">
				<patientRole classCode="PAT">
					<!--门诊号-->
					<xsl:apply-templates select="Header/recordTarget/patient/outpatientNum" mode="outpatientNum"/>
					<!--住院号-->
					<xsl:apply-templates select="Header/recordTarget/patient/inpatientNum" mode="inpatientNum"/>
					<!--电子申请单号-->
					<xsl:apply-templates select="Header/recordTarget/patient/MRN" mode="MRN"/>
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
			<!-- LegalAuthenticator签名 -->
			<xsl:apply-templates select="Header/LegalAuthenticator" mode="legalAuthenticator"/>
			<!-- Authenticator签名 -->
			<xsl:apply-templates select="Header/Authenticators/Authenticator" mode="Authenticator"/>
			<!--联系人1..*-->
			<xsl:apply-templates select="Header/Participants" mode="SupportContact"/>
			<!--关联活动信息-->
			<xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument" mode="relatedDocument"/>
			<!--文档中医疗卫生事件的就诊场景,即入院场景记录-->
			<componentOf>
				<xsl:apply-templates select="Header/encompassingEncounter/Locations/Location" mode="EncompassingEncounter"/>
			</componentOf>
			<!--****************************文档体Body********************-->
			<component>
				<structuredBody>
					<component>
						<section>
							<code code="30954-2" displayName="STUDIES SUMMARY" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<entry typeCode="COMP">
								<!-- 血型-->
								<organizer classCode="BATTERY" moodCode="EVN">
									<statusCode/>
									<component typeCode="COMP" contextConductionInd="true">
										<!-- ABO血型 -->
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE04.50.001.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="ABO血型代码"/>
											<value xsi:type="CD" code="{LabTest/bloodABO/Value}" displayName="{LabTest/bloodABO/Display}" codeSystem="2.16.156.10011.2.3.1.85" codeSystemName="ABO血型代码表"/>
										</observation>
									</component>
									<component typeCode="COMP" contextConductionInd="true">
										<!-- Rh血型 -->
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE04.50.010.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="Rh（D）血型代码"/>
											<value xsi:type="CD" code="{LabTest/bloodRh/Value}" displayName="{LabTest/bloodRh/Display}" codeSystem="2.16.156.10011.2.3.1.250" codeSystemName="Rh（D）血型代码表"/>
										</observation>
									</component>
								</organizer>
							</entry>
						</section>
					</component>
					<!--**********主要健康问题章节*****************-->
					<component>
						<section>
							<code code="11450-4" displayName="PROBLEM LIST" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<text/>
							<!--疾病诊断-->
							<entry>
								<observation classCode="OBS" moodCode="EVN">
									<!--疾病诊断编码-->
									<code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="疾病诊断编码"/>
									<value xsi:type="CD" code="S06.902" displayName="创伤性脑损伤" codeSystem="2.16.156.10011.2.3.3.11.3" codeSystemName="诊断代码表（ICD-10）"/>
								</observation>
							</entry>
						</section>
					</component>
					<!--输血章节-->
					<component>
						<section>
							<code code="56836-0" codeSystem="2.16.840.1.113883.6.1" displayName="History of blood transfusion" codeSystemName="LOINC"/>
							<text/>
							<entry>
								<procedure classCode="PROC" moodCode="EVN">
									<!--输血日期时间 -->
									<effectiveTime>
										<high value="{BloodTransfusion/beginTime/Value}"/>
									</effectiveTime>
									<entryRelationship typeCode="COMP">
										<!-- 输血史标识代码 -->
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE06.00.106.00" displayName="输血史标识代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
											<value xsi:type="CD" code="{BloodTransfusion/history/Value}" displayName="{BloodTransfusion/history/Display}" codeSystem="2.16.156.10011.2.3.2.42" codeSystemName="输血史标识代码表"/>
										</observation>
									</entryRelationship>
									<entryRelationship typeCode="COMP">
										<!-- 输血性质代码 -->
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE04.50.147.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血性质代码"/>
											<value xsi:type="CD" code="{BloodTransfusion/property/Value}" displayName="{BloodTransfusion/property/Display}" codeSystem="2.16.156.10011.2.3.2.43" codeSystemName="输血性质代码表"/>
										</observation>
									</entryRelationship>
									<entryRelationship typeCode="COMP">
										<!-- 申请ABO血型代码 -->
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE04.50.001.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="申请ABO血型代码"/>
											<value xsi:type="CD" code="{BloodTransfusion/ABOType/Value}" displayName="{BloodTransfusion/ABOType/Display}" codeSystem="2.16.156.10011.2.3.1.85" codeSystemName="ABO血型代码表"/>
										</observation>
									</entryRelationship>
									<entryRelationship typeCode="COMP">
										<!-- 申请Rh血型代码 -->
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE04.50.010.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="申请Rh（D）血型代码"/>
											<value code="{BloodTransfusion/RhType/Value}" xsi:type="CD" codeSystem="2.16.156.10011.2.3.1.250" displayName="{BloodTransfusion/RhType/Display}" codeSystemName="Rh（D）血型代码表"/>
										</observation>
									</entryRelationship>
									<!-- 输血指征 -->
									<entryRelationship typeCode="COMP">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE06.00.340.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血指征"/>
											<value xsi:type="ST">
												<xsl:value-of select="BloodTransfusion/trigger/Value"/>
											</value>
										</observation>
									</entryRelationship>
									<!-- 输血过程记录 -->
									<entryRelationship typeCode="COMP">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE06.00.181.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血过程记录"/>
											<value xsi:type="ST">
												<xsl:value-of select="BloodTransfusion/notes/Value"/>
											</value>
										</observation>
									</entryRelationship>
									<!--输血品种代码 -->
									<entryRelationship typeCode="COMP">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE08.50.040.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血品种代码"/>
											<value xsi:type="CD" code="{BloodTransfusion/type/Value}" displayName="{BloodTransfusion/type/Display}" codeSystem="2.16.156.10011.2.3.1.251" codeSystemName="输血品种代码表"/>
										</observation>
									</entryRelationship>
									<!-- 血袋编码 -->
									<entryRelationship typeCode="COMP">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE01.00.023.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="血袋编码"/>
											<value xsi:type="INT" value="{BloodTransfusion/bagNo/Value}"/>
										</observation>
									</entryRelationship>
									<!--输血量（mL） -->
									<entryRelationship typeCode="COMP">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE06.00.267.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血量（mL）"/>
											<value xsi:type="PQ" value="{BloodTransfusion/volume/Value}" unit="{BloodTransfusion/volume/Value}"/>
										</observation>
									</entryRelationship>
									<!--输血量计量单位 -->
									<entryRelationship typeCode="COMP">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE08.50.036.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血量计量单位"/>
											<value xsi:type="ST">
												<xsl:value-of select="BloodTransfusion/notes/Value"/>
											</value>
										</observation>
									</entryRelationship>
									<!--输血反应标志 -->
									<entryRelationship typeCode="COMP">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE06.00.264.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血反应标志"/>
											<value xsi:type="BL" value="{BloodTransfusion/reaction/Value}"/>
										</observation>
									</entryRelationship>
									<!--输血反应类型 -->
									<entryRelationship typeCode="COMP">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE06.00.265.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血反应类型"/>
											<value xsi:type="CD" code="{BloodTransfusion/reactionType/Value}" displayName="{BloodTransfusion/reactionType/Value}" codeSystem="2.16.156.10011.2.3.1.252" codeSystemName="输血反应类型代码表"/>
										</observation>
									</entryRelationship>
									<!-- 输血次数 -->
									<entryRelationship typeCode="COMP">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE06.00.263.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血次数"/>
											<value xsi:type="INT" value="{BloodTransfusion/times/Value}"/>
										</observation>
									</entryRelationship>
									<!-- 输血原因 -->
									<entryRelationship typeCode="COMP">
										<observation classCode="OBS" moodCode="EVN">
											<code code="DE06.00.107.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="输血原因"/>
											<value xsi:type="ST">
												<xsl:value-of select="BloodTransfusion/reason/Value"/>
											</value>
										</observation>
									</entryRelationship>
								</procedure>
							</entry>
						</section>
					</component>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>
</xsl:stylesheet>
