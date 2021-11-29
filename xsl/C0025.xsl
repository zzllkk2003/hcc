<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="xml" indent="yes"/>
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
			<title>出院评估与指导</title>
			<!-- 文档机器生成时间 -->
			<xsl:call-template name="effectiveTime"/>
			<xsl:call-template name="Confidentiality"/>
			<xsl:call-template name="languageCode"/>
			<setId/>
			<versionNumber/>
			<!--文档记录对象（患者）-->
			<recordTarget typeCode="RCT" contextControlCode="OP">
				<patientRole classCode="PAT">
					<!-- 健康卡号 -->
					<xsl:apply-templates select="Header/recordTarget/healthCardId" mode="HealthCardNumber"/>
					<!-- 住院号标识 todo-->
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
					<providerOrganization>
						<asOrganizationPartOf classCode="PART">
							<!--HDSD00.09.003	DE01.00.026.00	病床号 -->
							<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
								<xsl:comment>病床号</xsl:comment>
								<xsl:if test="Header/encompassingEncounter/Locations/Location/bedId">
									<id root="2.16.156.10011.1.22" extension="{Header/encompassingEncounter/Locations/Location/bedId}"/>
								</xsl:if>
								<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/bedName/Value"/></name>					
								<!--HDSD00.09.004	DE01.00.019.00	病房号 -->
								<asOrganizationPartOf classCode="PART">
									<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
										<xsl:comment>病房号</xsl:comment>
										<xsl:if test="Header/encompassingEncounter/Locations/Location/wardId">
											<id root="2.16.156.10011.1.21" extension="{Header/encompassingEncounter/Locations/Location/wardId}"/>
										</xsl:if>
										<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/wardName/Value"/></name>
										<!--HDSD00.09.036	DE08.10.026.00	科室名称 -->
										<asOrganizationPartOf classCode="PART">
											<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
												<xsl:comment>科室名称</xsl:comment>
												<xsl:if test="Header/encompassingEncounter/Locations/Location/wardId">
													<id root="2.16.156.10011.1.26" extension="{Header/encompassingEncounter/Locations/Location/deptId}"/>
												</xsl:if>
												<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/deptName/Value"/></name>
												<!--HDSD00.09.005	DE08.10.054.00	病区名称 -->
												<asOrganizationPartOf classCode="PART">
													<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
														<xsl:comment>病区名称</xsl:comment>
														<xsl:if test="Header/encompassingEncounter/Locations/Location/areaId">
															<id root="2.16.156.10011.1.27" extension="{Header/encompassingEncounter/Locations/Location/areaId}"/>
														</xsl:if>
														<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/areaName/Value"/></name>
														<asOrganizationPartOf classCode="PART">
															<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
																<xsl:comment>医院名称</xsl:comment>
																<xsl:if test="Header/encompassingEncounter/Locations/Location/hosId">
																	<id root="2.16.156.10011.1.26" extension="{Header/encompassingEncounter/Locations/Location/hosId}"/>
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
					</providerOrganization>
				</patientRole>
			</recordTarget>
			<!-- 文档创作者 -->
			<xsl:apply-templates select="Header/author" mode="AuthorWithOrganization"/>
			<!-- 保管机构-数据录入者信息 -->
			<xsl:apply-templates select="Header/custodian" mode="Custodian"/>
			<!-- Authenticator签名 -->
			<xsl:for-each select="Header/Authenticators/Authenticator">
				<xsl:if test="assignedEntityCode = '接诊护士'">
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
			<!--****************************文档体Body********************-->
			<component>
				<structuredBody>
					<!--出院诊断章节-->
					<xsl:apply-templates select="DisDiag"></xsl:apply-templates>
					<!--健康指导章节 -->
					<xsl:apply-templates select="HealthGuidance"></xsl:apply-templates>
					<!--健康评估章节 -->
					<xsl:apply-templates select="HealthAssessment"></xsl:apply-templates>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>
	
	<xsl:template match="DisDiag">
		<xsl:comment>出院诊断章节</xsl:comment>
		<component>
			<section>
				<code code="11535-2" displayName="Discharge Diagnosis" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--出院诊断编码条目-->
				<xsl:apply-templates select="Primarys/Primary"></xsl:apply-templates>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.017.00" displayName="出院日期时间" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<!--HDSD00.09.007	DE06.00.017.00	出院日期时间 -->
						<value xsi:type="TS" value="{dischargeTime/Value}"></value>
					</observation>
				</entry>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.193.00" displayName="出院情况" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<!--HDSD00.09.006	DE06.00.193.00	出院情况 -->
						<value xsi:type="ST"><xsl:value-of select="dischargeCondition/Value"/></value>
					</observation>
				</entry>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.223.00" displayName="离院方式代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<!--HDSD00.09.037	DE06.00.223.00	离院方式代码 -->
						<value xsi:type="CD" code="{dischargeDisposition/Value}" displayName="{dischargeDisposition/Display}" codeSystem="2.16.156.10011.2.3.1.265" codeSystemName="离院方式代码表"/>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
	<xsl:template match="HealthGuidance">
		<xsl:comment>健康指导章节</xsl:comment>
		<component>
			<section>
				<code code="69730-0" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Instructions"/>
				<text/>
				<xsl:if test="diet/Value">
					<xsl:comment>饮食指导代码</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.291.00" displayName="饮食指导代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<!--HDSD00.09.077	DE03.00.080.00	饮食情况代码 -->
							<value xsi:type="CD" code="{diet/Value}" codeSystem="2.16.156.10011.2.3.1.263" codeSystemName="饮食指导代码表">
								<xsl:if test="diet/Display">
									<xsl:attribute name="displayName"><xsl:value-of select="diet/Display"/></xsl:attribute>
								</xsl:if>
							</value>
						</observation>
					</entry>
				</xsl:if>
				<xsl:comment>生活方式指导</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.238.00" displayName="生活方式指导" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<!--HDSD00.09.055	DE06.00.238.00	生活方式指导 -->
						<value xsi:type="ST"><xsl:value-of select="lifestyle/Value"/></value>
					</observation>
				</entry>
				<xsl:comment>宣教内容</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.124.00" displayName="宣教内容" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<!--HDSD00.09.072	DE06.00.124.00	宣教内容 -->
						<value xsi:type="ST"><xsl:value-of select="education/Value"/></value>
					</observation>
				</entry>
				<xsl:comment>复诊指导</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.299.00" displayName="复诊指导" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<!--HDSD00.09.012	DE06.00.299.00	复诊指导 -->
						<value xsi:type="ST"><xsl:value-of select="followup/Value"/></value>
					</observation>
				</entry>
				<xsl:comment>用药指导</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.136.00" displayName="用药指导" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<!--HDSD00.09.080	DE06.00.136.00	用药指导 -->
						<value xsi:type="ST"><xsl:value-of select="medication/Value"/></value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
	<xsl:template match="HealthAssessment">
		<xsl:comment>健康评估章节</xsl:comment>
		<component>
			<section>
				<code code="51848-0" displayName="Assessment note" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<xsl:comment>自理能力代码</xsl:comment>
				<xsl:if test="selfcare/Value !=''">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.10.122.00" displayName="自理能力代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<!--HDSD00.09.086	DE05.10.122.00	自理能力代码 -->
							<value xsi:type="CD" codeSystem="2.16.156.10011.2.3.2.55" codeSystemName="自理能力代码表">
								<xsl:if test="selfcare/Display">
									<xsl:attribute name="displayName"><xsl:value-of select="selfcare/Display"/></xsl:attribute>
								</xsl:if>
								
								<xsl:if test="selfcare/Value">
									<xsl:attribute name="code"><xsl:value-of select="selfcare/Value"/></xsl:attribute>
								</xsl:if>			
							</value>
						</observation> 
					</entry>
				</xsl:if>	
				<xsl:comment>饮食情况代码</xsl:comment>
				<xsl:if test="diet/Value !=''">
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE03.00.080.00" displayName="饮食情况代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
							<!--HDSD00.09.077	DE03.00.080.00	饮食情况代码 -->
							<value xsi:type="CD" code="{diet/Value}" codeSystem="2.16.156.10011.2.3.2.34" codeSystemName="饮食情况代码表">
								<xsl:if test="diet/Display">
									<xsl:attribute name="displayName"><xsl:value-of select="diet/Display"/></xsl:attribute>	
								</xsl:if>
							</value>
						</observation>
					</entry>
				</xsl:if>
			</section>
		</component>
	</xsl:template>
	<xsl:template match="Primarys/Primary">
		<xsl:comment>出院诊断编码条目</xsl:comment>
		<xsl:if test="diag/code/Value">
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE05.01.024.00" displayName="出院诊断编码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
					<!--HDSD00.09.008	DE05.01.024.00	出院诊断编码 -->
					<value xsi:type="CD" code="{diag/code/Value}" displayName="{diag/code/Display}" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10"/>
				</observation>
			</entry>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
