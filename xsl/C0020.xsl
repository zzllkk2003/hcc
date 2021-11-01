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
			<realmCode code="CN"/>
			<typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
			<templateId root="2.16.156.10011.2.1.1.40"/>
			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			<title>生命体征测量记录</title>
			<xsl:call-template name="effectiveTime"/>
			<xsl:call-template name="Confidentiality"/>
			<xsl:call-template name="languageCode"/>
			<setId/>
			<versionNumber/>
			<recordTarget typeCode="RCT" contextControlCode="OP">
				<patientRole classCode="PAT">
					<!--住院号-->
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
			<xsl:apply-templates select="Header/custodian" mode="Custodian"/>
			<!-- Authenticator签名 -->
			<xsl:for-each select="Header/Authenticators/Authenticator">
				<xsl:if test="assignedEntityCode = '护士'">
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
			<xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument" mode="relatedDocument"/>
			<!--文档中医疗卫生事件的就诊场景,即入院场景记录-->
			<componentOf typeCode="COMP">
				<!--就诊-->
				<encompassingEncounter classCode="ENC" moodCode="EVN">
					<code/>
					<!--就诊时间-->
					<effectiveTime>
						<!--入院日期-->
						<xsl:comment>入院日期</xsl:comment>
						<low value="{Header/encompassingEncounter/effectiveTimeLow/Value}"/>
						<!--出院日期-->
						<xsl:comment>出院日期</xsl:comment>
						<high value="{Header/encompassingEncounter/effectiveTimeHigh/Value}"/>
					</effectiveTime>
					<location typeCode="LOC">
						<healthCareFacility classCode="SDLOC">
							<!--机构角色-->
							<serviceProviderOrganization classCode="ORG" determinerCode="INSTANCE">
								<asOrganizationPartOf classCode="PART">
									<!--病床号：DE01.00.026.00-->
									<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
										<!--N:加上OID-->
										<xsl:comment>病床号</xsl:comment>
										<id root="2.16.156.10011.1.22" extension="{Header/encompassingEncounter/Locations/Location/bedId}"/>
										<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/bedName/Value"/></name>
										<!--病房号：DE01.00.019.00-->
										<xsl:comment>病房号</xsl:comment>
										<asOrganizationPartOf classCode="PART">
											<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
												<!--N:加上OID-->
												<id root="2.16.156.10011.1.21" extension="{Header/encompassingEncounter/Locations/Location/wardId}"/>
												<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/wardName/Value"/></name>
												<!--病区名称：DE08.10.054.00-->
												<xsl:comment>病区名称</xsl:comment>
												<asOrganizationPartOf classCode="PART">
													<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
														<!--N:加上OID-->
														<id root="2.16.156.10011.1.27" extension="{Header/encompassingEncounter/Locations/Location/areaId}"/>
														<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/areaName/Value"/></name>
														<!--科室名称：DE08.10.026.00-->
														<xsl:comment>科室名称</xsl:comment>
														<asOrganizationPartOf classCode="PART">
															<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
																<!--N:加上OID-->
																<id root="2.16.156.10011.1.26" extension="{Header/encompassingEncounter/Locations/Location/hosId}"/>
																<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/hosName"/></name>
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
					<!--生命体征章节-->
					<xsl:comment>生命体征章节</xsl:comment>
					<xsl:apply-templates select="VitalSigns"/>
					<!--护理观察章节-->
					<xsl:comment>护理观察章节</xsl:comment>
					<xsl:apply-templates select="NursingObservations"/>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>

	<!--诊断记录章节模板-->
	<xsl:template match="Diagnosis">
		<component>
			<section>
				<code code="29548-5" displayName="Diagnosis" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<title>诊断记录章节</title>
				<text/>
				<xsl:comment>疾病诊断条目</xsl:comment>
				<xsl:apply-templates select="Westerns/Western"></xsl:apply-templates>
			</section>
		</component>
	</xsl:template>
	<!--疾病诊断条目-->
	<xsl:template match="Westerns/Western">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="疾病诊断编码"/>
				<value xsi:type="CD" code="{diag/code/Value}" codeSystem="2.16.156.10011.2.3.3.11.5" codeSystemName="疾病代码表（ICD-10）"/>
			</observation>
		</entry>
	</xsl:template>
	
	<!--生命体征章节-->
	<xsl:template match="VitalSigns">
		<component>
			<section>
				<code code="8716-3" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="VITAL SIGNS"/>
				<title>生命体征章节</title>
				<text/>
				<!--呼吸频率条目-->
				<xsl:comment>呼吸频率条目</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.10.081.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="呼吸频率（次/min）"/>
						<value xsi:type="PQ" value="{VitalSign[type='DE04.10.081.00']/value}" unit="次/min"/>
						<!-- 使用呼吸机标志 -->
						<xsl:comment>使用呼吸机标志</xsl:comment>
						<entryRelationship typeCode="COMP">
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE06.00.239.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="使用呼吸机标志"/>
								<value xsi:type="BL">
									<xsl:if test="//*[.='DE06.00.239.00']/../value='1'">
										<xsl:attribute name="value">true</xsl:attribute>
									</xsl:if>
									<xsl:if test="//*[.='DE06.00.239.00']/../value='0'">
										<xsl:attribute name="value">false</xsl:attribute>
									</xsl:if>
								</value>		
							</observation>
						</entryRelationship>
					</observation>
				</entry>
				<!--脉率条目-->
				<xsl:comment>脉率条目</xsl:comment>
				<xsl:apply-templates select="VitalSign" mode="pulse"></xsl:apply-templates>
				<!--起搏器心率条目-->
				<xsl:comment>起搏器心率条目</xsl:comment>
				<xsl:apply-templates select="VitalSign" mode="heart"></xsl:apply-templates>
				<!--体温条目-->
				<xsl:comment>体温条目</xsl:comment>
				<xsl:apply-templates select="VitalSign" mode="temp"></xsl:apply-templates>
				<entry>
					<organizer classCode="BATTERY" moodCode="EVN">
						<statusCode/>
						<!--收缩压条目-->
						<xsl:comment>收缩压条目</xsl:comment>
						<xsl:apply-templates select="VitalSign" mode="systolic"></xsl:apply-templates>
						
						<!--舒张压条目-->
						<xsl:comment>舒张压条目</xsl:comment>
						<xsl:apply-templates select="VitalSign" mode="diastolic"></xsl:apply-templates>	
					</organizer>
				</entry>
				<!--体重条目-->
				<xsl:comment>体重条目</xsl:comment>
				<xsl:apply-templates select="VitalSign" mode="weight"></xsl:apply-templates>
				<!--腹围条目-->
				<xsl:comment>腹围条目</xsl:comment>
				<xsl:apply-templates select="VitalSign" mode="abdominal"></xsl:apply-templates>
			</section>
		</component>
	</xsl:template>
	<!--脉率条目-->
	<xsl:template match="*" mode="pulse">
		<xsl:if test="type ='DE04.10.118.00'">
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE04.10.118.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="脉率"/>
					<value xsi:type="PQ" value="{value}" unit="次/min"/>
				</observation>
			</entry>
		</xsl:if>
	</xsl:template>
	<!--起搏器心率条目-->
	<xsl:template match="*" mode="heart">
		<xsl:if test="type ='DE04.10.206.00'">
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE04.10.206.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="心率"/>
					<value xsi:type="PQ" value="{value}" unit="次/min"/>
				</observation>
			</entry>
		</xsl:if>
	</xsl:template>
	<!--体温条目-->
	<xsl:template match="*" mode="temp">
		<xsl:if test ="type ='DE04.10.186.00'">
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE04.10.186.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="体温"/>
					<value xsi:type="PQ" value="{value}" unit="℃"/>
				</observation>
			</entry>
		</xsl:if>
	</xsl:template>
	<!--收缩压条目-->
	<xsl:template match="*" mode="systolic">
		<xsl:if test="type ='DE04.10.174.00' ">
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
			<component>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE04.10.176.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="舒张压"/>
					<value xsi:type="PQ" value="{value}" unit="mmHg"/>
				</observation>
			</component>
		</xsl:if>
	</xsl:template>
	<!--体重条目-->
	<xsl:template match="*" mode="weight">
		<xsl:if test ="type ='DE04.10.188.00'">
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE04.10.188.00" codeSystem="2.16.156.10011.2.2.1"
						codeSystemName="卫生信息数据元目录" displayName="体重"/>
					<value xsi:type="PQ" value="{value}" unit="kg"/>
				</observation>
			</entry>
		</xsl:if>
	</xsl:template>
	<!--腹围条目-->
	<xsl:template match="*" mode="abdominal">
		<xsl:if test ="type ='DE04.10.052.00'">
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE04.10.052.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="腹围（cm）"/>
					<value xsi:type="PQ" value="{value}" unit="cm"/>
				</observation>
			</entry>
		</xsl:if>
	</xsl:template>
	
	<!--护理观察章节-->
	<xsl:template match="NursingObservations">
		<component>
			<section>
				<code nullFlavor="UNK" displayName="护理观察章节"/>
				<title>护理观察章节</title>
				<!--多个观察写多个entry即可，每个观察对应着观察结果描述-->
				<xsl:comment>护理观察项目名称及结果描述</xsl:comment>
				<xsl:apply-templates select="NursingObservation"></xsl:apply-templates>
			</section>
		</component>
	</xsl:template>
	<!--护理观察项目名称及结果描述-->
	<xsl:template match="NursingObservation">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE02.10.031.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理观察项目名称"/>
				<value xsi:type="ST"><xsl:value-of select="item/Value"/></value>
				<xsl:comment>护理观察结果</xsl:comment>
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE02.10.028.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="护理观察结果"/>
						<value xsi:type="ST"><xsl:value-of select="result/Value"/></value>
					</observation>
				</entryRelationship>
			</observation>
		</entry>
	</xsl:template>
</xsl:stylesheet>
