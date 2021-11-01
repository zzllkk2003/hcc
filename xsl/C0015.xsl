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
			<templateId root="2.16.156.10011.2.1.1.35"/>
			<!-- 文档流水号 -->
			<xsl:call-template name="DocumentNo"/>
			<!--title-->
			<title>阴道分娩记录</title>
			<xsl:call-template name="effectiveTime"/>
			<xsl:call-template name="Confidentiality"/>
			<xsl:call-template name="languageCode"/>
			<setId/>
			<versionNumber/>
			<recordTarget typeCode="RCT" contextControlCode="OP">
				<patientRole classCode="PAT">
					<!-- 健康档案标识号 -->
					<xsl:apply-templates select="Header/recordTarget/healthRecordId" mode="healthRecordNumber"/>
					<!--住院号-->
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
			<xsl:apply-templates select="Header/custodian" mode="Custodian"/>	
			
			<!-- Authenticator签名 -->
			<xsl:for-each select="Header/Authenticators/Authenticator">
				<xsl:if test="assignedEntityCode = '接生者' or assignedEntityCode = '助产者' or assignedEntityCode = '助手' or assignedEntityCode = '护婴者' or assignedEntityCode='指导者' or assignedEntityCode = '记录人'">
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
			<xsl:apply-templates select="Header/RelatedDocuments/RelatedDocument" mode="relatedDocument"/>
			<!-- 病床号、病房、病区、科室和医院的关联 -->
			<componentOf>
				<encompassingEncounter>
					<effectiveTime/>
					<location>
						<healthCareFacility>
							<serviceProviderOrganization>
								<asOrganizationPartOf classCode="PART">
									<!--HDSD00.09.003	DE01.00.026.00	病床号 -->
									<xsl:comment><xsl:value-of select="Header/encompassingEncounter/Locations/Location/bedName/Value"/></xsl:comment>
									<wholeOrganization classCode="ORG" determinerCode="INSTANCE">
										<id root="2.16.156.10011.1.22" extension="{Header/encompassingEncounter/Locations/Location/bedId}"/>
										<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/bedNum/Value"/></name>
										<!--HDSD00.09.004	DE01.00.019.00	病房号 -->
										<xsl:comment>病房号</xsl:comment>
										<asOrganizationPartOf classCode="PART">
											<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
												<id root="2.16.156.10011.1.21" extension="{Header/encompassingEncounter/Locations/Location/wardId}"/>
												<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/wardName/Value"/></name>
												<!--HDSD00.09.036	DE08.10.026.00	科室名称 -->
												<xsl:comment>科室名称</xsl:comment>
												<asOrganizationPartOf classCode="PART">
												<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
												<id root="2.16.156.10011.1.26" extension="{Header/encompassingEncounter/Locations/Location/deptId}"/>
												<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/deptName/Value"/></name>
												<!--HDSD00.09.005	DE08.10.054.00	病区名称 -->
												<xsl:comment>病区名称</xsl:comment>
												<asOrganizationPartOf classCode="PART">
												<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
													<id root="2.16.156.10011.1.27" extension="{Header/encompassingEncounter/Locations/Location/areaId}"/>
													<name><xsl:value-of select="Header/encompassingEncounter/Locations/Location/areaName/Value"/></name>
												<!--XXX医院 -->
												<xsl:comment>医院</xsl:comment>
												<asOrganizationPartOf classCode="PART">
												<wholeOrganization classCode="ORG"
												determinerCode="INSTANCE">
												<id root="2.16.156.10011.1.5" extension="{Header/encompassingEncounter/Locations/Location/hosId}"/>
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
					<!-- 既往史章节 -->
					<xsl:comment>既往史章节</xsl:comment>
					<xsl:apply-templates select="PastHistory"/>
					<!-- 阴道分娩章节 -->
					<xsl:comment>阴道分娩章节</xsl:comment>
					<xsl:apply-templates select="VaginalDelivery"/>
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

	<!--既往史章节模板-->
	<xsl:template match="PastHistory">
		<component>
			<section>
				<code code="11348-0" displayName="HISTORY OF PAST ILLNESS"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<xsl:if test="pregnantTimes/Value">
					<xsl:comment>孕次</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE04.01.108.00" codeSystem="2.16.156.10011.2.2.1"
								codeSystemName="卫生信息数据元目录" displayName="孕次"/>
							<value xsi:type="INT" value="{pregnantTimes/Value}"/>
						</observation>
					</entry>
				</xsl:if>
				<xsl:if test="laborTimes/Value">
					<xsl:comment>产次</xsl:comment>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<code code="DE02.10.002.00" codeSystem="2.16.156.10011.2.2.1"
								codeSystemName="卫生信息数据元目录" displayName="产次"/>
							<value xsi:type="INT" value="{laborTimes/Value}"/>
						</observation>
					</entry>
				</xsl:if>
			</section>
		</component>
	</xsl:template>

	<!--阴道分娩章节模板-->
	<xsl:template match="VaginalDelivery">
		<component>
			<section>
				<code code="57074-7" displayName="labor and delivery process"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<xsl:comment>预产期</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.098.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="预产期"/>
						<value xsi:type="TS" value="{dueDate/Value}"/>
					</observation>
				</entry>
				<xsl:comment>临产日期时间</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.224.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="临产日期时间"/>
						<value xsi:type="TS" value="{laborTime/Value}"/>
					</observation>
				</entry>
				<xsl:comment>胎膜破裂日期时间</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.154.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="胎膜破裂日期时间"/>
						<value xsi:type="TS" value="{fetalMembraneRupture/Value}"/>
					</observation>
				</entry>
				<xsl:comment>前羊水性状</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.30.058.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="前羊水性状"/>
						<value xsi:type="ST">
							<xsl:value-of select="priorAmnioticFluidTraits/Value"/>
						</value>
					</observation>
				</entry>
				<xsl:comment>前羊水量</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.30.057.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="前羊水量（mL）"/>
						<value xsi:type="PQ" value="{priorAamnioticFluidVolume/Value}" unit="ml"/>
					</observation>
				</entry>
				<xsl:comment>宫缩开始日期时间</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.10.250.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="宫缩开始日期时间"/>
						<value xsi:type="TS" value="{uterineContractionTime/Value}"/>
					</observation>
				</entry>
				<xsl:comment>第1产程时长</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.021.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="第1产程时长（min）"/>
						<value xsi:type="PQ" value="{firstStageDuration/Value}" unit="min"/>
					</observation>
				</entry>
				<xsl:comment>宫口开全日期时间</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.10.250.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="宫口开全日期时间"/>
						<value xsi:type="TS" value="{fullOpeningTime/Value}"/>
					</observation>
				</entry>
				<xsl:comment>第2产程时长</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.019.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="第2产程时长（min）"/>
						<value xsi:type="PQ" value="{secondStageDuration/Value}" unit="min"/>
					</observation>
				</entry>
				<xsl:comment>胎儿娩出日期时间</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE02.01.014.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="胎儿娩出日期时间"/>
						<value xsi:type="TS" value="{fetalDeliveryTime/Value}"/>
					</observation>
				</entry>
				<xsl:comment>第3产程时长</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.020.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="第3产程时长（min）"/>
						<value xsi:type="PQ" value="{thirdStageDuration/Value}" unit="min"/>
					</observation>
				</entry>
				<xsl:comment>胎盘娩出日期时间</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.273.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="胎盘娩出日期时间"/>
						<value xsi:type="TS" value="{placentaDeliveryTime/Value}"/>
					</observation>
				</entry>
				<xsl:comment>总产程时长</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.10.236.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="总产程时长（min）"/>
						<value xsi:type="PQ" value="{totalLaborDuration/Value}" unit="min"/>
					</observation>
				</entry>
				<xsl:comment>胎方位代码</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.01.044.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="胎方位代码"/>
						<value xsi:type="CD" code="{fetalOrientation/Value}"
							codeSystem="2.16.156.10011.2.3.1.106" codeSystemName="胎方位代码表"/>
					</observation>
				</entry>
				<xsl:comment>胎儿娩出助产标志</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.311.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="胎儿娩出助产标志"/>
						<value xsi:type="BL" value="{midwifery/Value}"/>
					</observation>
				</entry>
				<xsl:comment>助产方式</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.312.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="助产方式"/>
						<value xsi:type="ST">
							<xsl:value-of select="midwiferyMode/Value"/>
						</value>
					</observation>
				</entry>
				<xsl:comment>胎盘娩出情况</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.157.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="胎盘娩出情况"/>
						<value xsi:type="ST">
							<xsl:value-of select="placentalDelivery/Value"/>
						</value>
					</observation>
				</entry>
				<xsl:comment>胎膜完整情况标志</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.156.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="胎膜完整情况标志"/>
						<value xsi:type="BL" value="{fetalMembraneIntegrity/Value}"/>
					</observation>
				</entry>
				<xsl:comment>羊水性状</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.30.063.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="羊水性状"/>
						<value xsi:type="ST">
							<xsl:value-of select="amnioticFluid/Value"/>
						</value>
					</observation>
				</entry>
				<xsl:comment>羊水量</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.30.061.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="羊水量（mL）"/>
						<value xsi:type="PQ" value="{amnioticFluidVolume/Value}" unit="ml"/>
					</observation>
				</entry>
				<xsl:comment>脐带长度（cm）</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.30.055.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="脐带长度（cm）"/>
						<value xsi:type="PQ" value="{umbilicalCordLength/Value}" unit="cm"/>
					</observation>
				</entry>
				<xsl:comment>绕颈身</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.30.059.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="绕颈身（周）"/>
						<value xsi:type="PQ" value="{aroundNeck/Value}" unit="周"/>
					</observation>
				</entry>
				<xsl:comment>脐带异常情况标志</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.145.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="脐带异常情况标志"/>
						<value xsi:type="BL" value="{umbilicalCordAbnormal/Value}"/>
					</observation>
				</entry>
				<xsl:comment>产时用药</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE08.50.022.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="产时用药"/>
						<value xsi:type="ST">
							<xsl:value-of select="intrapartumMed/Value"/>
						</value>
					</observation>
				</entry>
				<xsl:comment>预防措施</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.295.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="预防措施"/>
						<value xsi:type="ST">
							<xsl:value-of select="preventiveMeasure/Value"/>
						</value>
					</observation>
				</entry>
				<xsl:comment>产妇会阴切开标志</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.165.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="产妇会阴切开标志"/>
						<value xsi:type="BL" value="{perinealIncision/Value}"/>
					</observation>
				</entry>
				<xsl:comment>会阴切开位置</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.10.252.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="会阴切开位置"/>
						<value xsi:type="ST">
							<xsl:value-of select="perinealIncisionPosition/Value"/>
						</value>
					</observation>
				</entry>
				<xsl:comment>产妇会阴缝合针数</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.011.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="产妇会阴缝合针数"/>
						<value xsi:type="INT" value="{perinealSutureNumber/Value}"/>
					</observation>
				</entry>
				<xsl:comment>产妇会阴裂伤程度代码</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.01.003.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="产妇会阴裂伤程度代码"/>
						<value xsi:type="CD" code="{perinealLacerationDegree/Value}"
							codeSystem="2.16.156.10011.2.3.1.109" codeSystemName="产妇会阴裂伤程度代码表"/>
					</observation>
				</entry>
				<xsl:comment>会阴血肿标志</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.10.253.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="会阴血肿标志"/>
						<value xsi:type="BL" value="{perinealHematoma/Value}"/>
					</observation>
				</entry>
				<xsl:comment>会阴血肿大小</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.10.254.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="会阴血肿大小"/>
						<value xsi:type="ST">
							<xsl:value-of select="perinealHematomaSize/Value"/>
						</value>
					</observation>
				</entry>
				<xsl:comment>会阴血肿处理</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.213.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="会阴血肿处理"/>
						<value xsi:type="ST">
							<xsl:value-of select="perinealHematomaTreatment/Value"/>
						</value>
					</observation>
				</entry>
				<xsl:comment>麻醉方法代码</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.073.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="麻醉方法代码"/>
						<value xsi:type="CD" code="{anesthesiaMethod/Value}"
							codeSystem="2.16.156.10011.2.3.1.159" codeSystemName="麻醉方法代码表"/>
					</observation>
				</entry>
				<xsl:comment>麻醉药物名称</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE08.50.022.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="麻醉药物名称"/>
						<value xsi:type="ST">
							<xsl:value-of select="anesthetics/Value"/>
						</value>
					</observation>
				</entry>
				<xsl:comment>阴道裂伤标志</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.163.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="阴道裂伤标志"/>
						<value xsi:type="BL" value="{vaginalLaceration/Value}"/>
					</observation>
				</entry>
				<xsl:comment>阴道血肿标志</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.164.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="阴道血肿标志"/>
						<value xsi:type="BL" value="{vaginalHematoma/Value}"/>
					</observation>
				</entry>
				<xsl:comment>宫颈裂伤标志</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.10.249.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="宫颈裂伤标志"/>
						<value xsi:type="BL" value="{cervicalLaceration/Value}"/>
					</observation>
				</entry>
				<xsl:comment>宫颈缝合情况</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.200.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="宫颈缝合情况"/>
						<value xsi:type="ST">
							<xsl:value-of select="cervicalSuture/Value"/>
						</value>
					</observation>
				</entry>
				<xsl:comment>产后用药</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE08.50.022.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="产后用药"/>
						<value xsi:type="ST">
							<xsl:value-of select="PostpartumMed/Value"/>
						</value>
					</observation>
				</entry>
				<xsl:comment>分娩过程摘要</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.182.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="分娩过程摘要"/>
						<value xsi:type="ST">
							<xsl:value-of select="deliveryProcessSummary/Value"/>
						</value>
					</observation>
				</entry>
				<xsl:comment>宫缩情况</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.10.245.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="宫缩情况"/>
						<value xsi:type="ST">
							<xsl:value-of select="uterineContraction/Value"/>
						</value>
					</observation>
				</entry>
				<xsl:comment>子宫情况</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.10.233.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="子宫情况"/>
						<value xsi:type="ST">
							<xsl:value-of select="uterineCondition/Value"/>
						</value>
					</observation>
				</entry>
				<xsl:comment>恶露状况</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.10.025.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="恶露状况"/>
						<value xsi:type="ST">
							<xsl:value-of select="lochiaCondition/Value"/>
						</value>
					</observation>
				</entry>
				<xsl:comment>会阴情况</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.137.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="会阴情况"/>
						<value xsi:type="ST">
							<xsl:value-of select="perinealCondition/Value"/>
						</value>
					</observation>
				</entry>
				<xsl:comment>修补手术过程</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.284.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="修补手术过程"/>
						<value xsi:type="ST">
							<xsl:value-of select="repairProcedure/Value"/>
						</value>
					</observation>
				</entry>
				<xsl:comment>存脐带血情况标志</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.50.138.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="存脐带血情况标志"/>
						<value xsi:type="BL" value="{cordBloodPreserve/Value}"/>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>

	<!--产后处置章节模板-->
	<xsl:template match="ProcessPostDelivery">
		<component>
			<section>
				<code code="57076-2" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
					displayName="postpartum hospitalization treatment"/>
				<text/>
				<!--产后诊断-->
				<xsl:comment>产后诊断</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.007.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="{diag/displayName}"/>
						<value xsi:type="ST">
							<xsl:value-of select="diag/Value"/>
						</value>
					</observation>
				</entry>
				<!--产后观察日期时间-->
				<xsl:comment>产后观察日期时间</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.218.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="{obsTime/displayName}"/>
						<value xsi:type="TS" value="{obsTime/Value}"/>
					</observation>
				</entry>
				<!--产后检查时间-->
				<xsl:comment>产后检查时间</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.10.246.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="{checkTime/displayName}"/>
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
								<code code="DE04.10.174.00" codeSystem="2.16.156.10011.2.2.1"
									codeSystemName="卫生信息数据元目录" displayName="{systolic/displayName}"/>
								<value xsi:type="PQ" value="{systolic/Value}" unit="mmHg"/>
							</observation>
						</component>
						<component>
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE04.10.176.00" codeSystem="2.16.156.10011.2.2.1"
									codeSystemName="卫生信息数据元目录" displayName="{diastolic/displayName}"/>
								<value xsi:type="PQ" value="{diastolic/Value}" unit="mmHg"/>
							</observation>
						</component>
					</organizer>
				</entry>
				<!--产后脉搏-->
				<xsl:comment>产后脉搏</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.10.118.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="{pulse/displayName}"/>
						<value xsi:type="PQ" value="{pulse/Value}" unit="次/min"/>
					</observation>
				</entry>
				<!--产后心率-->
				<xsl:comment>产后心率</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.10.206.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="{heartRate/displayName}"/>
						<value xsi:type="PQ" value="{heartRate/Value}" unit="/次min"/>
					</observation>
				</entry>
				<!--产后出血量-->
				<xsl:comment>产后出血量</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.10.012.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录"
							displayName="{postpartumHemorrhage/displayName}"/>
						<value xsi:type="PQ" value="{postpartumHemorrhage/Value}" unit="ml"/>
					</observation>
				</entry>
				<!--产后宫缩-->
				<xsl:comment>产后宫缩</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.10.245.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录"
							displayName="{uterineContraction/displayName}"/>
						<value xsi:type="ST">
							<xsl:value-of select="uterineContraction/Value"/>
						</value>
					</observation>
				</entry>
				<!--产后宫底高度-->
				<xsl:comment>产后宫底高度</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.10.067.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录"
							displayName="{uterusFundusHeight/displayName}"/>
						<value xsi:type="PQ" value="{uterusFundusHeight/Value}" unit="cm"/>
					</observation>
				</entry>
				<!--肛查-->
				<xsl:comment>肛查</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.10.240.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="肛查"/>
						<value xsi:type="ST">
							<xsl:value-of select="analExam/Value"/>
						</value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>

	<!--新生儿章节模板-->
	<xsl:template match="NewBorn">
		<component>
			<section>
				<code code="57075-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
					displayName="newborn delivery information"/>
				<text/>
				<!--新生儿性别代码-->
				<xsl:comment>新生儿性别代码</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE02.01.040.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="{gender/displayName}"/>
						<value xsi:type="CD" code="{gender/Value}"
							codeSystem="2.16.156.10011.2.3.3.4" codeSystemName="性别代码表"/>
					</observation>
				</entry>
				<!--新生儿出生体重-->
				<xsl:comment>新生儿出生体重</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.10.019.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="{weight/displayName}"/>
						<value xsi:type="PQ" value="{weight/Value}" unit="g"/>
					</observation>
				</entry>
				<!--新生儿出生身长-->
				<xsl:comment>新生儿出生身长</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE04.10.018.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="{height/displayName}"/>
						<value xsi:type="PQ" value="{height/Value}" unit="cm"/>
					</observation>
				</entry>
				<!--产瘤大小-->
				<xsl:comment>产瘤大小</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.168.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="{size/displayName}"/>
						<value xsi:type="ST">
							<xsl:value-of select="size/Value"/>
						</value>
					</observation>
				</entry>
				<!--产瘤部位-->
				<xsl:comment>产瘤部位</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.167.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="{position/displayName}"/>
						<value xsi:type="ST">
							<xsl:value-of select="position/Value"/>
						</value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>

	<!--分娩评估章节模板-->
	<xsl:template match="DeliveryAssessment">
		<component>
			<section>
				<code code="51848-0" displayName="Assessment Note"
					codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--Apgar评分间隔时间代码-->
				<xsl:comment>Apgar评分间隔时间代码</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.215.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="Apgar评分间隔时间代码"/>
						<xsl:choose>
							<xsl:when test="ApgarInterval/Value and ApgarInterval/Display">
								<value xsi:type="CD" code="{ApgarInterval/Value}"
									displayName="{ApgarInterval/Display}"
									codeSystem="2.16.156.10011.2.3.2.48"
									codeSystemName="Apgar评分间隔时间代码表"/>
							</xsl:when>
							<xsl:when test="ApgarInterval/Value and not(ApgarInterval/Display)">
								<value xsi:type="CD" code="{ApgarInterval/Value}"
									codeSystem="2.16.156.10011.2.3.2.48"
									codeSystemName="Apgar评分间隔时间代码表"/>
							</xsl:when>
						</xsl:choose>

					</observation>
				</entry>
				<!--Apgar评分值-->
				<xsl:comment>Apgar评分值</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.001.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="{Apgar/displayName}"/>
						<value xsi:type="INT" value="{Apgar/Value}"/>
					</observation>
				</entry>
				<!--分娩结局代码-->
				<xsl:comment>分娩结局代码</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.026.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="分娩结局代码"/>
						<xsl:choose>
							<xsl:when test="result/Value and result/Display">
								<value xsi:type="CD" code="{result/Value}"
									displayName="{result/Display}"
									codeSystem="2.16.156.10011.2.3.2.49" codeSystemName="分娩结局代码表"/>
							</xsl:when>
							<xsl:when test="result/Value and not(result/Display)">
								<value xsi:type="CD" code="{result/Value}"
									codeSystem="2.16.156.10011.2.3.2.49" codeSystemName="分娩结局代码表"/>
							</xsl:when>
						</xsl:choose>

					</observation>
				</entry>
				<!--新生儿异常情况代码-->
				<xsl:comment>新生儿异常情况代码</xsl:comment>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.160.00" codeSystem="2.16.156.10011.2.2.1"
							codeSystemName="卫生信息数据元目录" displayName="新生儿异常情况代码"/>
						<xsl:choose>
							<xsl:when test="abnormal/Value and abnormal/Display">
								<value xsi:type="CD" code="{abnormal/Value}"
									displayName="{abnormal/Display}"
									codeSystem="2.16.156.10011.2.3.1.254"
									codeSystemName="新生儿异常情况代码表"/>
							</xsl:when>
							<xsl:when test="abnormal/Value and not(abnormal/Display)">
								<value xsi:type="CD" code="{abnormal/Value}"
									codeSystem="2.16.156.10011.2.3.1.254"
									codeSystemName="新生儿异常情况代码表"/>
							</xsl:when>
						</xsl:choose>

					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
</xsl:stylesheet>
