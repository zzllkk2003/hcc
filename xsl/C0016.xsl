<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:isc="http://extension-functions.intersystems.com" xmlns:exsl="http://exslt.org/common" xmlns:set="http://exslt.org/sets" exclude-result-prefixes="isc sdtc exsl set">
	<xsl:include href="CDA-Support-Files/CDAHeader.xsl"/>
	<xsl:include href="CDA-Support-Files/PatientInformation.xsl"/>
	<xsl:include href="CDA-Support-Files/Location.xsl"/>
	<xsl:output method="xml"/>
	<xsl:template match="/Document">
		<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<realmCode code="CN"/>
			<typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
			<templateId root="2.16.156.10011.2.1.1.36" extension="DT2011001"/>
			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			<!--title-->
			<title>宫剖产记录</title>
			<xsl:call-template name="effectiveTime"/>
			<xsl:call-template name="Confidentiality"/>
			<xsl:call-template name="languageCode"/>
			<setId/>
			<versionNumber/>
			<recordTarget typeCode="RCT" contextControlCode="OP">
				<patientRole classCode="PAT">
					<!-- 健康档案标识号 -->
					<xsl:apply-templates select="Header/recordTarget/healthRecordId" mode="healthRecordNumber"/>
					<!-- 住院号标识 -->
					<xsl:apply-templates select="Header/recordTarget/inpatientNum" mode="inpatientNum"/>
					<!-- 现住址 -->
					<xsl:apply-templates select="Header/recordTarget/addr" mode="Address"/>
					<xsl:apply-templates select="Header/recordTarget/telcom" mode="PhoneNumber"/>
					<patient classCode="PSN" determinerCode="INSTANCE">
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
						<!-- 出生地 -->
						<xsl:apply-templates select="Header/recordTarget/patient/birthplace" mode="BirthPlace"/>
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
			<!-- Authenticator签名 -->
			<xsl:for-each select="Header/Authenticators/Authenticator">
				<xsl:if test="assignedEntityCode = '手术者' or assignedEntityCode = '麻醉医师' or assignedEntityCode = '器械护士' or assignedEntityCode = '护婴者' or assignedEntityCode = '记录人'">
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
			<!--联系人1..*-->
			<xsl:for-each select="Header/Participants/Participant">
				<xsl:if test="typeCode = 'NOT'">
					<xsl:comment>其他参与者（联系人）</xsl:comment>
					<participant typeCode="NOT">
						<!--联系人@classCode：CON，固定值，表示角色是联系人 -->
						<associatedEntity classCode="ECON">
							<!--联系人电话-->
							<telecom value="{telcom/Value}"/>
							<!--联系人-->
							<associatedPerson>
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
			<!-- 病床号、病房、病区、科室和医院的关联 -->
			<componentOf>
				<encompassingEncounter>
					<effectiveTime/>
					<location>
						<healthCareFacility>
							<serviceProviderOrganization>
								<asOrganizationPartOf classCode="PART">
									<!--HDSD00.09.003	DE01.00.026.00	病床号 -->
									<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
										<xsl:if test="Header/encompassingEncounter/Locations/Location/bedId">
											<id root="2.16.156.10011.1.22" extension="{Header/encompassingEncounter/Locations/Location/bedId}"/>
										</xsl:if>
										
										<!--HDSD00.09.004	DE01.00.019.00	病房号 -->
										<asOrganizationPartOf classCode="PART">
											<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
												<xsl:if test="Header/encompassingEncounter/Locations/Location/wardId">
													<id root="2.16.156.10011.1.21" extension="{Header/encompassingEncounter/Locations/Location/wardId}"/>
												</xsl:if>
												
												<!--HDSD00.09.036	DE08.10.026.00	科室名称 -->
												<asOrganizationPartOf classCode="PART">
													<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
														<!--HDSD00.09.005	DE08.10.054.00	病区名称 -->
														<asOrganizationPartOf classCode="PART">
															<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
																<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/areaName/Value"/></name>
																<!--XXX医院 -->
																<asOrganizationPartOf classCode="PART">
																	<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
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
			<component>
				<structuredBody>
					<!-- 手术操作章节 -->
					<xsl:comment>手术操作章节</xsl:comment>
					<xsl:apply-templates select="CaesareanProcedure"/>
					<!-- 产后处置章节 -->
					<xsl:comment>产后处置章节</xsl:comment>
					<xsl:apply-templates select="ProcessPostDelivery"/>
					<!-- 新生儿章节 -->
					<xsl:comment>新生儿章节</xsl:comment>
					<xsl:apply-templates select="NewBorn"/>
					<!-- 分娩评估章节 -->
					<xsl:comment>分娩评估章节</xsl:comment>
					<xsl:apply-templates select="DeliveryAssessment"/>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>
	<!--手术操作章节模板-->
	<xsl:template match="CaesareanProcedure">
		<component>
				<section>
					<code code="47519-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="HISTORY OF PROCEDURES"/>
					<text/>
					<!--待产日期时间-->
					<xsl:comment>待产日期时间</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.197.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{dueDate/displayName}"/>
							<value xsi:type="TS" value="{dueDate/Value}"/>
						</observation>
					</entry>
					<!--胎膜完整情况-->
					<xsl:comment>胎膜完整情况</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.10.156.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{embryolemmaComplete/displayName}"/>
							<value xsi:type="BL" value="{embryolemmaComplete/Value}"/>
						</observation>
					</entry>
					<!--脐带长度-->
					<xsl:comment>脐带长度</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE04.30.055.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{cordLength/displayName}"/>
							<value xsi:type="PQ" value="{cordLength/Value}" unit="cm"/>
						</observation>
					</entry>
					<!--绕颈身-->
					<xsl:comment>绕颈身</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE04.30.059.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{circles/displayName}"/>
							<value xsi:type="PQ" value="{circles/Value}" unit="周"/>
						</observation>
					</entry>
					<!--产前诊断-->
					<xsl:comment>产前诊断</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.10.109.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{diagnosis/displayName}"/>
							<value xsi:type="ST"><xsl:value-of select="diagnosis/Value"/></value>
						</observation>
					</entry>
					<!--手术指征-->
					<xsl:comment>手术指征</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.340.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{surgicalIndication/displayName}"/>
							<value xsi:type="ST"><xsl:value-of select="surgicalIndication/Value"/></value>
						</observation>
					</entry>
					
					<!-- 手术及操作编码DE06.00.093.00 -->
					<xsl:comment>手术及操作编码</xsl:comment>
					<entry>
						<procedure classCode="PROC" moodCode="EVN">
							<code xsi:type="CD" code="{procedure/Value}" displayName="脑室-腹腔分流术" codeSystem="2.16.156.10011.2.3.3.12" codeSystemName="{procedure/displayName}"/>
						</procedure>
					</entry>
					<!--手术开始日期时间-->
					<xsl:comment>手术开始日期时间</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.221.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{beginTime/displayName}"/>
							<value xsi:type="TS" value="{beginTime/Value}"/>
						</observation>
					</entry>
					<!--麻醉方法代码-->
					<xsl:comment>麻醉方法代码</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.073.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{anesthesiaMethod/displayName}"/>
							<value xsi:type="CD" code="{anesthesiaMethod/Value}" codeSystem="2.16.156.10011.2.3.1.159" codeSystemName="麻醉方法代码表"/>
						</observation>
					</entry>
					<!--麻醉体位-->
					<xsl:comment>麻醉体位</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE04.10.260.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{anesthesiaPosition/displayName}"/>
							<value xsi:type="ST"><xsl:value-of select="anesthesiaPosition/Value"/></value>
						</observation>
					</entry>
					<!--麻醉效果-->
					<xsl:comment>麻醉效果</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.253.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{anesthesiaEffect/displayName}"/>
							<value xsi:type="ST"><xsl:value-of select="anesthesiaEffect/Value"/></value>
						</observation>
					</entry>
					<!--剖宫产手术过程-->
					<xsl:comment>剖宫产手术过程</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.10.063.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{process/displayName}"/>
							<value xsi:type="ST"><xsl:value-of select="process/Value"/></value>
						</observation>
					</entry>
					<!--子宫情况-->
					<xsl:comment>子宫情况</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE04.10.233.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{uterus/displayName}"/>
							<value xsi:type="ST"><xsl:value-of select="uterus/Value"/></value>
						</observation>
					</entry>
					<!--胎儿方位代码-->
					<xsl:comment>胎儿方位代码</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.01.044.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{fetalPosition/displayName}"/>
							<value xsi:type="CD" code="{fetalPosition/Value}" codeSystem="2.16.156.10011.2.3.1.106" codeSystemName="胎方位代码表"/>
						</observation>
					</entry>
					<!--胎儿娩出方式-->
					<xsl:comment>胎儿娩出方式</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.10.173.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{deliveryMode/displayName}"/>
							<value xsi:type="ST"><xsl:value-of select="deliveryMode/Value"/></value>
						</observation>
					</entry>
					<!--胎盘黄染-->
					<xsl:comment>胎盘黄染</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.10.153.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{placentaYellow/displayName}"><qualifier><name displayName="胎盘黄染"></name></qualifier></code>
							<value xsi:type="ST"><xsl:value-of select="placentaYellow/Value"/></value>
						</observation>
					</entry>
					<!--胎膜黄染-->
					<xsl:comment>胎膜黄染</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.10.153.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{embryolemmaYellow/displayName}"><qualifier><name displayName="胎膜黄染"></name></qualifier></code>
							<value xsi:type="ST"><xsl:value-of select="embryolemmaYellow/Value"/></value>
						</observation>
					</entry>
					<!--脐带缠绕情况-->
					<xsl:comment>脐带缠绕情况</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE04.30.054.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{cordEntanglement/displayName}"/>
							<value xsi:type="ST"><xsl:value-of select="cordEntanglement/Value"/></value>
						</observation>
					</entry>
					<!--脐带扭转-->
					<xsl:comment>脐带扭转</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE04.30.056.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{cordTorsion/displayName}"/>
							<value xsi:type="PQ" value="{cordTorsion/Value}" unit="周"/>
						</observation>
					</entry>
					<!--存脐带血情况标志-->
					<xsl:comment>存脐带血情况标志</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE04.50.138.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{storeCordBlood/displayName}"/>
							<value xsi:type="BL" value="{storeCordBlood/Value}"/>
						</observation>
					</entry>
					<!--子宫壁缝合情况-->
					<xsl:comment>子宫壁缝合情况</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.200.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{sutureUterineWall/displayName}"/>
							<value xsi:type="ST"><xsl:value-of select="sutureUterineWall/Value"/></value>
						</observation>
					</entry>
					<!--宫缩剂名称-->
					<xsl:comment>宫缩剂名称</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE08.50.022.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{oxytocin/displayName}"/>
							<value xsi:type="ST"><xsl:value-of select="oxytocin/Value"/></value>
						</observation>
					</entry>
					<!--宫缩剂使用方法-->
					<xsl:comment>宫缩剂使用方法</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.136.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{oxytocinUsage/displayName}"/>
							<value xsi:type="ST"><xsl:value-of select="oxytocinUsage/Value"/></value>
						</observation>
					</entry>
					<!--手术用药-->
					<xsl:comment>手术用药</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE08.50.022.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{medication/displayName}"/>
							<value xsi:type="ST"><xsl:value-of select="medication/Value"/></value>
						</observation>
					</entry>
					<!--手术用药量-->
					<xsl:comment>手术用药量</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.293.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{medicationDose/displayName}"/>
							<value xsi:type="ST"><xsl:value-of select="medicationDose/Value"/></value>
						</observation>
					</entry>
					<!--腹腔探查子宫-->
					<xsl:comment>腹腔探查子宫</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE04.10.233.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{uterusCheck/displayName}"/>
							<value xsi:type="ST"><xsl:value-of select="uterusCheck/Value"/></value>
						</observation>
					</entry>
					<!--腹腔探查附件-->
					<xsl:comment>腹腔探查附件</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE04.10.042.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{adnexalCheck/displayName}"/>
							<value xsi:type="ST"><xsl:value-of select="adnexalCheck/Value"/></value>
						</observation>
					</entry>
					<!--宫腔探查异常情况标志-->
					<xsl:comment>宫腔探查异常情况标志</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE04.30.053.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{abnormal/displayName}"/>
							<value xsi:type="BL" value="{abnormal/Value}"/>
						</observation>
					</entry>
					<!--宫腔探查肌瘤标志-->
					<xsl:comment>宫腔探查肌瘤标志</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.10.166.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{myomaCheck/displayName}"/>
							<value xsi:type="BL" value="{myomaCheck/Value}"/>
						</observation>
					</entry>
					<!--宫腔探查处理情况-->
					<xsl:comment>宫腔探查处理情况</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE04.30.052.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{treatment/displayName}"/>
							<value xsi:type="ST"><xsl:value-of select="treatment/Value"/></value>
						</observation>
					</entry>
					<!--手术时产妇情况-->
					<xsl:comment>手术时产妇情况</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.10.134.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{puerperaSituation/displayName}"/>
							<value xsi:type="ST"><xsl:value-of select="puerperaSituation/Value"/></value>
						</observation>
					</entry>
					<!--出血量-->
					<xsl:comment>出血量</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.097.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{bleedingVolume/displayName}"/>
							<value xsi:type="PQ" value="{bleedingVolume/Value}" unit="ml"/>
						</observation>
					</entry>
					<!--输血成分-->
					<xsl:comment>输血成分</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.262.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{bloodTransComp/displayName}"/>
							<value xsi:type="ST"><xsl:value-of select="bloodTransComp/Value"/></value>
						</observation>
					</entry>
					<!--输血量-->
					<xsl:comment>输血量</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.267.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{bloodTransVolume/displayName}"/>
							<value xsi:type="PQ" value="{bloodTransVolume/Value}" unit="ml"/>
						</observation>
					</entry>
					<!--输液量-->
					<xsl:comment>输液量</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.268.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{infusionVolume/displayName}"/>
							<value xsi:type="PQ" value="{infusionVolume/Value}" unit="ml"/>
						</observation>
					</entry>
					<!--供氧时间-->
					<xsl:comment>供氧时间</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.318.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{oxygenLength/displayName}"/>
							<value xsi:type="PQ" value="{oxygenLength/Value}" unit="min"/>
						</observation>
					</entry>
					<!--其他用药-->
					<xsl:comment>其他用药</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE08.50.022.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{otherMedication/displayName}"/>
							<value xsi:type="ST"><xsl:value-of select="otherMedication/Value"/></value>
						</observation>
					</entry>
					<!--其他情况-->
					<xsl:comment>其他情况</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.179.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{otherSituation/displayName}"/>
							<value xsi:type="ST"><xsl:value-of select="otherSituation/Value"/></value>
						</observation>
					</entry>
					<!--手术结束日期时间-->
					<xsl:comment>手术结束日期时间</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.218.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{endTime/displayName}"/>
							<value xsi:type="TS" value="{endTime/Value}"/>
						</observation>
					</entry>
					<!--手术全程时间-->
					<xsl:comment>手术全程时间</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.259.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{length/displayName}"/>
							<value xsi:type="PQ" value="{length/Value}" unit="min"/>
						</observation>
					</entry>
				</section>
			</component>
	</xsl:template>
	
	<!--产后处置章节模板-->
	<xsl:template match="ProcessPostDelivery">
		<component>
				<section>
					<code code="57076-2" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="postpartum hospitalization treatment"/>
					<text/>
					<!--产后诊断-->
					<xsl:comment>产后诊断</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.10.007.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{diag/displayName}"/>
							<value xsi:type="ST"><xsl:value-of select="diag/Value"/></value>
						</observation>
					</entry>
					<!--产后观察日期时间-->
					<xsl:comment>产后观察日期时间</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.218.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{obsTime/displayName}"/>
							<value xsi:type="TS" value="{obsTime/Value}"/>
						</observation>
					</entry>
					<!--产后检查时间-->
					<xsl:comment>产后检查时间</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE04.10.246.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{checkTime/displayName}"/>
							<value xsi:type="PQ" value="{checkTime/Value}" unit="min"/>
						</observation>
					</entry>
					<!--产后血压-->
					<xsl:comment>产后血压</xsl:comment>
					<entry>
						<organizer classCode="BATTERY" moodCode="EVN">
							<statusCode/>
							<component>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE04.10.174.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{systolic/displayName}"/>
									<value xsi:type="PQ" value="{systolic/Value}" unit="mmHg"/>
								</observation>
							</component>
							<component>
								<observation classCode="OBS" moodCode="EVN">
									<code code="DE04.10.176.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{diastolic/displayName}"/>
									<value xsi:type="PQ" value="{diastolic/Value}" unit="mmHg"/>
								</observation>
							</component>
						</organizer>
					</entry>
					<!--产后脉搏-->
					<xsl:comment>产后脉搏</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE04.10.118.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{pulse/displayName}"/>
							<value xsi:type="PQ" value="{pulse/Value}" unit="次/min"/>
						</observation>
					</entry>
					<!--产后心率-->
					<xsl:comment>产后心率</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE04.10.206.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{heartRate/displayName}"/>
							<value xsi:type="PQ" value="{heartRate/Value}" unit="/次min"/>
						</observation>
					</entry>
					<!--产后出血量-->
					<xsl:comment>产后出血量</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE04.10.012.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{postpartumHemorrhage/displayName}"/>
							<value xsi:type="PQ" value="{postpartumHemorrhage/Value}" unit="ml"/>
						</observation>
					</entry>
					<!--产后宫缩-->
					<xsl:comment>产后宫缩</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE04.10.245.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{uterineContraction/displayName}"/>
							<value xsi:type="ST"><xsl:value-of select="uterineContraction/Value"/></value>
						</observation>
					</entry>
					<!--产后宫底高度-->
					<xsl:comment>产后宫底高度</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE04.10.067.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{uterusFundusHeight/displayName}"/>
							<value xsi:type="PQ" value="{uterusFundusHeight/Value}" unit="cm"/>
						</observation>
					</entry>
				</section>
			</component>
	</xsl:template>
	
	<!--新生儿章节模板-->
	<xsl:template match="NewBorn">
		<component>
				<section>
					<code code="57075-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="newborn delivery information"/>
					<text/>
					<!--新生儿性别代码-->
					<xsl:comment>新生儿性别代码</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE02.01.040.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{gender/displayName}"/>
							<value xsi:type="CD" code="{gender/Value}" codeSystem="2.16.156.10011.2.3.3.4" codeSystemName="性别代码表"/>
						</observation>
					</entry>
					<!--新生儿出生体重-->
					<xsl:comment>新生儿出生体重</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE04.10.019.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{weight/displayName}"/>
							<value xsi:type="PQ" value="{weight/Value}" unit="g"/>
						</observation>
					</entry>
					<!--新生儿出生身长-->
					<xsl:comment>新生儿出生身长</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE04.10.018.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{height/displayName}"/>
							<value xsi:type="PQ" value="{height/Value}" unit="cm"/>
						</observation>
					</entry>
					<!--产瘤大小-->
					<xsl:comment>产瘤大小</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.10.168.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{size/displayName}"/>
							<value xsi:type="ST"><xsl:value-of select="size/Value"/></value>
						</observation>
					</entry>
					<!--产瘤部位-->
					<xsl:comment>产瘤部位</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.10.167.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{position/displayName}"/>
							<value xsi:type="ST"><xsl:value-of select="position/Value"/></value>
						</observation>
					</entry>
				</section>
			</component>
	</xsl:template>
	
	<!--分娩评估章节模板-->
	<xsl:template match="DeliveryAssessment">
		<component>
				<section>
					<code code="51848-0" displayName="Assessment Note" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
					<text/>
					<!--Apgar评分间隔时间代码-->
					<xsl:comment>Apgar评分间隔时间代码</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.215.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="Apgar评分间隔时间代码"/>
							<xsl:choose>
								<xsl:when test="ApgarInterval/Value and ApgarInterval/Display">
									<value xsi:type="CD" code="{ApgarInterval/Value}" displayName="{ApgarInterval/Display}" codeSystem="2.16.156.10011.2.3.2.48" codeSystemName="Apgar评分间隔时间代码表"/>
								</xsl:when>
								<xsl:when test="ApgarInterval/Value and not(ApgarInterval/Display)">
									<value xsi:type="CD" code="{ApgarInterval/Value}" codeSystem="2.16.156.10011.2.3.2.48" codeSystemName="Apgar评分间隔时间代码表"/>
								</xsl:when>
							</xsl:choose>
							
						</observation>
					</entry>
					<!--Apgar评分值-->
					<xsl:comment>Apgar评分值</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.10.001.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{Apgar/displayName}"/>
							<value xsi:type="INT" value="{Apgar/Value}"/>
						</observation>
					</entry>
					<!--分娩结局代码-->
					<xsl:comment>分娩结局代码</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE06.00.026.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="分娩结局代码"/>
							<xsl:choose>
								<xsl:when test="result/Value and result/Display">
									<value xsi:type="CD" code="{result/Value}" displayName="{result/Display}" codeSystem="2.16.156.10011.2.3.2.49" codeSystemName="分娩结局代码表"/>
								</xsl:when>
								<xsl:when test="result/Value and not(result/Display)">
									<value xsi:type="CD" code="{result/Value}" codeSystem="2.16.156.10011.2.3.2.49" codeSystemName="分娩结局代码表"/>
								</xsl:when>
							</xsl:choose>
							
						</observation>
					</entry>
					<!--新生儿异常情况代码-->
					<xsl:comment>新生儿异常情况代码</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE05.10.160.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="新生儿异常情况代码"/>
							<xsl:choose>
								<xsl:when test="abnormal/Value and abnormal/Display">
									<value xsi:type="CD" code="{abnormal/Value}" displayName="{abnormal/Display}" codeSystem="2.16.156.10011.2.3.1.254" codeSystemName="新生儿异常情况代码表"/>
								</xsl:when>
								<xsl:when test="abnormal/Value and not(abnormal/Display)">
									<value xsi:type="CD" code="{abnormal/Value}"  codeSystem="2.16.156.10011.2.3.1.254" codeSystemName="新生儿异常情况代码表"/>
								</xsl:when>
							</xsl:choose>
							
						</observation>
					</entry>
				</section>
		</component>
	</xsl:template>	
</xsl:stylesheet>
