<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:isc="http://extension-functions.intersystems.com" xmlns:exsl="http://exslt.org/common" xmlns:set="http://exslt.org/sets" exclude-result-prefixes="isc sdtc exsl set">
	<xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
	<xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
	<xsl:include href="CDA-Support-Files/Location.xsl"/>
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/Document">
		<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<!--
********************************************************
 文档头
********************************************************
-->
			<realmCode code="CN"/>
			<typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
			<templateId  root="2.16.156.10011.2.1.1.21"/>
			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			<title>病历概要</title>
			<xsl:call-template name="effectiveTime"/>
			<xsl:call-template name="Confidentiality"/>
			<xsl:call-template name="languageCode"/>
			<setId/>
			<versionNumber/>
			
			<recordTarget typeCode="RCT" contextControlCode="OP">
				<patientRole classCode="PAT">
					<!-- 健康档案标识号 -->
					<xsl:apply-templates select="Header/recordTarget/healthCardId" mode="healthRecordNumber"/>
					<!-- 健康卡号 -->
					<xsl:apply-templates select="Header/recordTarget/healthCardId" mode="HealthCardNumber"/>
					
					<!-- 现住址 -->
					<xsl:apply-templates select="Header/recordTarget/addr" mode="Address"/>
					<!-- 患者电话 -->
					<xsl:apply-templates select="Header/recordTarget/telcom" mode="PhoneNumber"/>
					
					<patient classCode="PSN" determinerCode="INSTANCE">
						
						<!--患者身份证号码，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientId" mode="nationalIdNumber"/>	
						<!--患者姓名，必选-->
						<xsl:apply-templates select="Header/recordTarget/patient/patientName" mode="Name"/>
						<!-- 性别，必选 -->
						<xsl:apply-templates select="Header/recordTarget/patient/administrativeGender" mode="Gender"/>
						<!-- 出生时间1..1 -->
						<xsl:apply-templates select="Header/recordTarget/patient/birthTime" mode="BirthTime"/>
						<!-- 婚姻状况1..1 -->
						<xsl:apply-templates select="Header/recordTarget/patient/maritalStatusCode" mode="MaritalStatus"/>
						<!-- 民族1..1 -->
						<xsl:apply-templates select="Header/recordTarget/patient/ethnicGroupCode" mode="EthnicGroup"/>
						<!-- 工作单位 -->
						<xsl:apply-templates select="Header/recordTarget/patient" mode="Employer"/>
						<!--职业状况-->
						<xsl:apply-templates select="Header/recordTarget/patient/occupationCode" mode="Occupation"/>
					</patient>
					
				</patientRole>
			</recordTarget>
			
			<!-- 文档创作者 -->
			<xsl:apply-templates select="Header/author" mode="AuthorWithOrganization"/>
			
			<!-- 保管机构-数据录入者信息 -->
			<xsl:if test="Header/custodian">
				<xsl:apply-templates select="Header/custodian" mode="Custodian"/>		
			</xsl:if>
			
			<!--其他参与者（联系人）@typeCode: NOT(ugent notification contact)，固定值，表示不同的参与者 -->
			<xsl:for-each select="Header/Participants/Participant">
				<xsl:if test="typeCode = 'NOT'">
					<xsl:comment>其他参与者（联系人）</xsl:comment>
					<participant typeCode="NOT">
						<!--联系人@classCode：CON，固定值，表示角色是联系人 -->
						<associatedEntity classCode="ECON">
							<!--联系人类别，表示与患者之间的关系-->
							<code/>
							<!--联系人地址-->
							<addr>		
								<houseNumber><xsl:value-of select="addr/houseNum/Value"/></houseNumber>
								<streetName><xsl:value-of select="addr/streetName/Value"/></streetName>
								<township><xsl:value-of select="addr/township/Value"/></township>
								<county><xsl:value-of select="addr/county/Value"/></county>
								<city><xsl:value-of select="addr/city/Value"/></city>
								<state><xsl:value-of select="addr/state/Value"/></state>
								<postalCode><xsl:value-of select="addr/postCode/Value"/></postalCode>
							</addr>
							<!--电话号码-->
							<telecom use="H" value="{telcom/Value}"/>
							<!--联系人-->
							<associatedPerson classCode="PSN" determinerCode="INSTANCE">
								<!--姓名-->
								<name><xsl:value-of select="associatedPersonName/Value"/></name>
							</associatedPerson>
						</associatedEntity>
					</participant>
				</xsl:if>	
			</xsl:for-each>
			
			
			<!--关联活动信息-->
			<xsl:if test="Header/RelatedDocuments/RelatedDocument">
				<xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument" mode="relatedDocument"/>
			</xsl:if>
			<!--
********************************************************
文档体
********************************************************
-->
			<component>
				<structuredBody>
					<!-- 实验室检验章节 -->
					<xsl:comment>实验室检验章节</xsl:comment>
					<xsl:if test="LabTest">
						<xsl:apply-templates select="LabTest"/>
					</xsl:if>
					<!-- 既往史章节 -->
					<xsl:comment>既往史章节</xsl:comment>
					<xsl:if test="PastHistory">
						<xsl:apply-templates select="PastHistory"/>
					</xsl:if>
					<!-- 输血章节 -->
					<xsl:comment>输血章节</xsl:comment>
					<xsl:if test="BloodTransfusion/history">
						<xsl:apply-templates select="BloodTransfusion/history"/>
					</xsl:if>
					<!-- 过敏史章节 -->
					<xsl:comment>过敏史章节</xsl:comment>
					<xsl:if test="Allergy/Allergies">
						<xsl:apply-templates select="Allergy/Allergies"/>	
					</xsl:if>	
					<!--预防接种史章节-->
					<xsl:comment>预防接种史章节</xsl:comment>
					<xsl:if test="Vaccinations">
						<xsl:apply-templates select="Vaccinations"/>
					</xsl:if>
					<!--个人史章节-->
					<xsl:comment>个人史章节</xsl:comment>
					<xsl:if test="PastHistory">
						<xsl:apply-templates select="SocialHistory"/>	
					</xsl:if>
					<!--月经史章节-->
					<xsl:comment>月经史章节</xsl:comment>
					<xsl:if test="Menstrual">
						<xsl:apply-templates select="Menstrual"/>	
					</xsl:if>		
					<!--家族史章节-->
					<xsl:comment>家族史章节</xsl:comment>
					<xsl:if test="FamilyHistories">
						<xsl:apply-templates select="FamilyHistories"/>
					</xsl:if>	
					<!-- 卫生事件章节 -->
					<xsl:comment>卫生事件章节</xsl:comment>
					<xsl:apply-templates select="HealthcareEvent"/>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>
	<!--实验室检验章节模板-->
	<xsl:template match="LabTest">	
		<component>
			<section>
				<code code="30954-2" displayName="STUDIES SUMMARY" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!-- 血型条目-->
				<xsl:comment>血型条目</xsl:comment>
				<entry typeCode="COMP">
					<organizer classCode="BATTERY" moodCode="EVN">
						<statusCode/>
						<!-- ABO血型 -->
						<xsl:comment>ABO血型</xsl:comment>
						<component typeCode="COMP" contextConductionInd="true">
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE04.50.001.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
								<xsl:choose>
									<xsl:when test="bloodABO/Value and bloodABO/Display">
										<value xsi:type="CD" code="{bloodABO/Value}" codeSystem="2.16.156.10011.2.3.1.85" codeSystemName="ABO血型代码表" displayName="{bloodABO/Display}"/>
									</xsl:when>
									<xsl:when test="bloodABO/Value and not(bloodABO/Display)">
										<value xsi:type="CD" code="{bloodABO/Value}" codeSystem="2.16.156.10011.2.3.1.85" codeSystemName="ABO血型代码表"/>
									</xsl:when>
								</xsl:choose>
								
							</observation>
						</component>
						<!-- Rh血型 -->
						<xsl:comment>Rh血型</xsl:comment>
						<component typeCode="COMP" contextConductionInd="true">
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE04.50.010.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
								<xsl:choose>
									<xsl:when test="bloodRh/Value and bloodRh/Display">
										<value xsi:type="CD" code="{bloodRh/Value}" codeSystem="2.16.156.10011.2.3.1.250" codeSystemName="Rh(D)血型代码表" displayName="{bloodRh/Display}"/>
										</xsl:when>
									<xsl:when test="bloodRh/Value and not(bloodRh/Display)">
										<value xsi:type="CD" code="{bloodRh/Value}" codeSystem="2.16.156.10011.2.3.1.250" codeSystemName="Rh(D)血型代码表"/>
									</xsl:when>
								</xsl:choose>
								
							</observation>
						</component>
					</organizer>
				</entry>
			</section>
		</component>
	</xsl:template>
	<!--既往史章节模板 -->
	<xsl:template match="PastHistory">
		<component>
			<section>
				<code code="11348-0" displayName="HISTORY OF PAST ILLNESS" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!-- 疾病史（含外伤）条目 -->
				<xsl:comment>疾病史（含外伤）条目</xsl:comment>
				<xsl:apply-templates select="Illnesses/Illness"/>
				<!-- 传染病史 -->
				<xsl:comment>传染病史</xsl:comment>
				<xsl:apply-templates select="Infections/Infection"/>
				<!--手术史条目-->
				<xsl:comment>手术史条目</xsl:comment>
				<xsl:apply-templates select="Surgeries/Surgery"/>
				<!--婚育史条目-->
				<xsl:comment>婚育史条目</xsl:comment>
				<xsl:apply-templates select="Obstetrics/Obstetric"/>
			</section>
		</component>
	</xsl:template>
	<!--疾病史（含外伤）条目-->
	<xsl:template match="Illnesses/Illness">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE02.10.026.00" displayName="疾病史（含外伤）" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
				<value xsi:type="ST">
					<xsl:value-of select="name/Value"/>
				</value>
			</observation>
		</entry>
	</xsl:template>
	<!--传染病史条目-->
	<xsl:template match="Infections/Infection">
		<xsl:if test="name/Value">
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE02.10.008.00" displayName="{name/displayName}" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
					<value xsi:type="ST">
						<xsl:value-of select="name/Value"/>
					</value>
				</observation>
			</entry>
		</xsl:if>
	</xsl:template>
	<!--手术史条目-->
	<xsl:template match="Surgeries/Surgery">
		<xsl:if test="name/Value">
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE02.10.061.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{name/displayName}"/>
					<value xsi:type="ST">
						<xsl:value-of select="name/Value"/>
					</value>
				</observation>
			</entry>
		</xsl:if>		
	</xsl:template>
	<!--婚育史条目-->
	<xsl:template match="Obstetrics/Obstetric">
		<xsl:if test="name/Value">
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE02.10.098.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{name/displayName}"/>
					<value xsi:type="ST">
						<xsl:value-of select="name/Value"/>
					</value>
				</observation>
			</entry>
		</xsl:if>
	</xsl:template>
	<!--输血章节模板-->
	<xsl:template match="BloodTransfusion/history">	
		<component>
			<section>
				<code code="56836-0" displayName="History of blood transfusion" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--输血史条目-->
				<xsl:comment>输血史条目</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE02.10.100.00" displayName="{displayName}" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<value xsi:type="ST">
							<xsl:value-of select="Value"/>
						</value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
	<!--过敏史章节模板-->
	<xsl:template match="Allergy/Allergies">
		<component>
			<section>
				<code code="48765-2" displayName="Allergies, adverse reactions, alerts" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--过敏史条目-->
				<xsl:comment>过敏史条目</xsl:comment>
				<xsl:apply-templates select="Item"/>
			</section>
		</component>
	</xsl:template>
	<!--过敏史条目-->
	<xsl:template match="Item">
		<xsl:if test="allergen/Value">
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE02.10.022.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{allergen/displayName}"/>
					<value xsi:type="ST">
						<xsl:value-of select="allergen/Value"/>
					</value>
				</observation>
			</entry>
		</xsl:if>
	</xsl:template>
	<!--预防接种史章节模板-->
	<xsl:template match="Vaccinations">
		<component>
			<section>
				<code code="11369-6" codeSystem="2.16.840.1.113883.6.1" displayName="HISTORY OF IMMUNIZATIONS" codeSystemName="LOINC"/>
				<text/>
				<!--预防接种条目-->
				<xsl:comment>预防接种条目</xsl:comment>
				<xsl:apply-templates select="Vaccination"/>
			</section>
		</component>
	</xsl:template>
	<!--预防接种条目-->
	<xsl:template match="Vaccination">
		<xsl:if test="name/Value">
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE02.10.101.00" displayName="{name/displayName}" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
					<value xsi:type="ST">
						<xsl:value-of select="name/Value"/>
					</value>
				</observation>
			</entry>	
		</xsl:if>		
	</xsl:template>
	<!--个人史章节-->
	<xsl:template match="SocialHistory">
		<component>
			<section>
				<code code="29762-2" displayName="Social history" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--个人史条目-->
				<xsl:comment>个人史条目</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE02.10.097.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{code/displayName}"/>
						<value xsi:type="ST"><xsl:value-of select="code/Value"/></value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
	<!--月经史章节模板-->
	<xsl:template match="Menstrual">
		<component>
			<section>
				<code code="49033-4" displayName="Menstrual History" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--月经史条目-->
				<xsl:comment>月经史条目</xsl:comment>
				<xsl:if test="menstrual/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE02.10.102.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{menstrual/displayName}"/>
							<value xsi:type="ST">
								<xsl:value-of select="menstrual/Value"/>
							</value>
						</observation>
					</entry>
				</xsl:if>	
			</section>
		</component>
	</xsl:template>
	<!--家族史章节模板-->
	<xsl:template match="FamilyHistories">
		<component>
			<section>
				<code code="10157-6" displayName="HISTORY OF FAMILY MEMBER DISEASES" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--家族史条目-->
				<xsl:comment>家族史条目</xsl:comment>
				<xsl:apply-templates select="FamilyHistory"/>
			</section>
		</component>
	</xsl:template>
	<!--家族史条目-->
	<xsl:template match="FamilyHistory">
		<xsl:if test="code/Value">
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE02.10.103.00" displayName="{code/displayName}" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
					<value xsi:type="ST">
						<xsl:value-of select="code/Value"/>
					</value>
				</observation>
			</entry>
		</xsl:if>
	</xsl:template>
	<!--卫生事件章节-->
	<xsl:template match="HealthcareEvent">
		<component>
			<section>
				<code displayName="卫生事件"/>
				<text/>
				<!--医疗机构科室条目-->
				<xsl:comment>医疗机构科室条目</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE08.10.026.00" displayName="医疗机构科室名称" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<value xsi:type="ST">
							<xsl:value-of select="departmentName/Value"/>
						</value>
					</observation>
				</entry>
				<!--患者类型代码条目-->
				<xsl:comment>患者类型代码条目</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE02.01.060.00" displayName="患者类型代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<value xsi:type="CD" code="{patientType/Value}" codeSystem="2.16.156.10011.2.3.1.271" codeSystemName="患者类型代码表" displayName="{patientType/Display}"/>
					</observation>
				</entry>
				<!--门（急）诊号条目-->
				<xsl:comment>门（急）诊号条目</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE01.00.010.00" displayName="门（急）诊号" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<value xsi:type="ST">
							<xsl:value-of select="outpatientNum/Value"/>
						</value>
					</observation>
				</entry>
				<!--住院号条目-->
				<xsl:comment>住院号条目</xsl:comment>
				<xsl:if test="inpatientNum/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE01.00.014.00" displayName="住院号" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<value xsi:type="ST">
								<xsl:value-of select="inpatientNum/Value"/>
							</value>
						</observation>
					</entry>
				</xsl:if>	
				<!--出入院时间条目-->
				<xsl:comment>出入院时间条目</xsl:comment>
				<entry>
					<organizer classCode="BATTERY" moodCode="EVN">
						<statusCode/>
						<xsl:if test="time/admissionTime/Value">
							<component>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.092.00" displayName="{time/admissionTime/displayName}" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
									<value xsi:type="TS" value="{time/admissionTime/Value}"/>
								</observation>
							</component>
						</xsl:if>
						<xsl:if test="time/dischargeTime/Value">
							<component>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE06.00.017.00" displayName="{time/dischargeTime/displayName}" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
									<value xsi:type="TS" value="{time/dischargeTime/Value}"/>
								</observation>
							</component>
						</xsl:if>	
					</organizer>
				</entry>
				<!--发病时间条目-->
				<xsl:comment>发病时间条目</xsl:comment>
				<xsl:if test="sickTime/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE04.01.018.00" displayName="{sickTime/displayName}" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<value xsi:type="TS" value="{sickTime/Value}"/>
						</observation>
					</entry>
				</xsl:if>	
				<!--就诊原因名称条目-->
				<xsl:comment>就诊原因名称条目</xsl:comment>
				<xsl:if test="admissionReason/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.10.053.00" displayName="就诊原因" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<!-- 就诊日期时间 DE06.00.062.00-->
							<effectiveTime value="20130202123422"/>
							<value xsi:type="ST">
								<xsl:value-of select="admissionReason/Value"/>
							</value>
						</observation>
					</entry>
				</xsl:if>	
				<!--西医诊断编码条目-->
				<xsl:comment>西医诊断编码条目</xsl:comment>
				<xsl:apply-templates select="diagnoses/Diagnosis"/>
				<!--其他西医诊断编码条目-->
				<xsl:comment>其他西医诊断编码条目</xsl:comment>
				<xsl:if test="otherDiagnosis/Value">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.01.024.00" displayName="其他西医诊断编码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
								<qualifier>
									<name displayName="其他西医诊断编码"/>
								</qualifier>
							</code>
							<value xsi:type="CD" code="{otherDiagnosis/Value}" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10" displayName="{otherDiagnosis/Display}"/>
						</observation>
					</entry>
				</xsl:if>
				<!--中医病名代码条目-->
				<xsl:comment>中医病名代码条目</xsl:comment>
				<xsl:apply-templates select="TCMdiagnoses/TCMDiagnosis"/>
				<!--手术及操作编码条目-->
				<xsl:comment>手术及操作编码条目</xsl:comment>
				<xsl:apply-templates select="operations/Operation"/>
				<!--关键药物名称条目-->
				<xsl:comment>关键药物名称条目</xsl:comment>
				<xsl:apply-templates select="keyMedicines/KeyMedicine"/>
				<!--其他处置条目-->
				<xsl:comment>其他处置条目</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.251.00" displayName="{otherTreatment/displayName}" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<value xsi:type="ST">
							<xsl:value-of select="otherTreatment/Value"/>
						</value>
					</observation>
				</entry>
				<!--根本死因代码条目-->
				<xsl:comment>根本死因代码条目</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.01.021.00" displayName="{deathReason/displayName}" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<value xsi:type="CD" code="{deathReason/Value}" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10" displayName="{deathReason/Display}"/>
					</observation>
				</entry>
				<!--责任医师姓名条目-->
				<xsl:comment>责任医师姓名条目</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE02.01.039.00" displayName="责任医师姓名" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<value xsi:type="ST">
							<xsl:value-of select="doctorName/Value"/>
						</value>
					</observation>
				</entry>
				<!-- 费用条目 -->
				<xsl:comment>费用条目</xsl:comment>
				<entry>
					<organizer classCode="CLUSTER" moodCode="EVN">
						<statusCode/>
						<component>
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE02.01.044.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{fee/insuranceType/displayName}"/>
								<value xsi:type="CD" code="{fee/insuranceType/Value}" codeSystem="2.16.156.10011.2.3.1.248" codeSystemName="医疗保险类别代码表" displayName="{fee/insuranceType/Display}"/>
							</observation>
						</component>
						<component>
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE07.00.007.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="医疗付费方式代码"/>
								<value xsi:type="CD" code="{fee/paymentType/Value}" codeSystem="2.16.156.10011.2.3.1.269" displayName="{fee/paymentType/Display}" codeSystemName="医疗付费方式代码表"/>
							</observation>
						</component>
						<component>
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE07.00.004.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="门诊费用金额"/>
								<value xsi:type="MO" value="{fee/outpatient/Value}" currency="元"/>
							</observation>
						</component>
						<component>
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE07.00.010.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="住院费用金额"/>
								<value xsi:type="MO" value="{fee/inpatient/Value}" currency="元"/>
							</observation>
						</component>
						<component>
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE07.00.001.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="个人承担费用金额"/>
								<value xsi:type="MO" value="{fee/patientPay/Value}" currency="元"/>
							</observation>
						</component>
					</organizer>
				</entry>
			</section>
		</component>
	</xsl:template>
	<!--卫生事件章节:西医诊断条目-->
	<xsl:template match="diagnoses/Diagnosis">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.01.024.00" displayName="西医诊断编码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
					<qualifier>
						<name displayName="西医诊断编码"/>
					</qualifier>
				</code>
				<xsl:choose>
					<xsl:when test="name/Value and name/Display">
						<value xsi:type="CD" code="{name/Value}" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10" displayName="{name/Display}"/>
					</xsl:when>
					<xsl:when test="name/Value and not(name/Display)">
						<value xsi:type="CD" code="{name/Value}" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10"/>
					</xsl:when>
				</xsl:choose>
				
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.113.00" displayName="病情转归代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<xsl:choose>
							<xsl:when test="result/Value and result/Display">
								<value xsi:type="CD" code="{result/Value}" codeSystem="2.16.156.10011.2.3.1.148" codeSystemName="病情转归代码表" displayName="{result/Display}"/>
							</xsl:when>
							<xsl:when test="result/Value and not(result/Display)">
								<value xsi:type="CD" code="{result/Value}" codeSystem="2.16.156.10011.2.3.1.148" codeSystemName="病情转归代码表"/>
							</xsl:when>
						</xsl:choose>
						
					</observation>
				</entryRelationship>
			</observation>
		</entry>
	</xsl:template>
	<!--卫生事件章节:中医病名代码条目-->
	<xsl:template match="TCMdiagnoses/TCMDiagnosis">
	
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.10.130.00" displayName="中医病名代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
					<qualifier>
						<name displayName="中医病名代码"/>
					</qualifier>
				</code>
				<xsl:if test="name/Value">
					<value xsi:type="CD" code="{name/Value}" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)" displayName="{name/Display}"/>
				</xsl:if>
				<xsl:if test="symptom/Value">
					<entryRelationship typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.10.130.00" displayName="中医证候代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
								<qualifier>
									<name displayName="中医证候代码"/>
								</qualifier>
							</code>
							<value xsi:type="CD" code="{symptom/Value}" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)" displayName ="{symptom/Display}"/>
						</observation>
					</entryRelationship>
				</xsl:if>
				<xsl:if test="result/Value">
					<entryRelationship typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.10.113.00" displayName="病情转归代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<xsl:choose>
								<xsl:when test="result/Display">
									<value xsi:type="CD" code="{result/Value}" codeSystem="2.16.156.10011.2.3.1.148" codeSystemName="病情转归代码表" displayName="{result/Display}"/>
								</xsl:when>
								<xsl:when test="not(result/Display)">
									<value xsi:type="CD" code="{result/Value}" codeSystem="2.16.156.10011.2.3.1.148" codeSystemName="病情转归代码表" />
								</xsl:when>
							</xsl:choose>
							
						</observation>
					</entryRelationship>
				</xsl:if>	
			</observation>
		</entry>
	</xsl:template>
	<!--卫生事件章节:手术及操作条目-->
	<xsl:template match="operations/Operation">
		<xsl:if test="name/Value">
			<entry>
				<procedure classCode="PROC" moodCode="EVN">
					<!-- 手术及操作编码 DE06.00.093.00 -->
					<code code="{name/Value}" codeSystem="2.16.156.10011.2.3.3.12" codeSystemName="手术(操作)代码表（ICD-9-CM）"/>
				</procedure>
			</entry>
		</xsl:if>
	</xsl:template>
	<!--卫生事件章节:关键药物名称条目-->
	<xsl:template match="keyMedicines/KeyMedicine">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<xsl:if test="name/Value">
					<code code="DE08.50.022.00" displayName="关键药物名称" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
					<value xsi:type="ST">
						<xsl:value-of select="name/Value"/>
					</value>
				</xsl:if>
				<xsl:if test="usage/Value">
					<entryRelationship typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.136.00" displayName="关键药物用法" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<value xsi:type="ST">
								<xsl:value-of select="usage/Value"/>
							</value>
						</observation>
					</entryRelationship>
				</xsl:if>
				<xsl:if test="adverseReaction/Value">
					<entryRelationship typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.129.00" displayName="药物不良反应情况" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<value xsi:type="ST">
								<xsl:value-of select="adverseReaction/Value"/>
							</value>
						</observation>
					</entryRelationship>
				</xsl:if>
				<xsl:if test="TCMType/Value">
					<entryRelationship typeCode="COMP">
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.164.00" displayName="中药使用类别代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<value xsi:type="CD" code="{TCMType/Value}" codeSystem="2.16.156.10011.2.3.1.157" codeSystemName="中药使用类别代码表" displayName="{TCMType/Display}"/>
						</observation>
					</entryRelationship>
				</xsl:if>			
			</observation>
		</entry>
	</xsl:template>
</xsl:stylesheet>
