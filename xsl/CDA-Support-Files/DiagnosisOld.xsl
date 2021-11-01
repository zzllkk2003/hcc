<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<!--诊断编码条目，用于多个模板，code=DE05.01.024.00, 但displayName在因不同的诊断类型有变化-->
	<xsl:template match="*" mode="Diag024">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<!--疾病诊断编码-->
				<code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="疾病诊断编码"/>
				<value xsi:type="CD" code="{diag/code/Value}" displayName="{diag/code/Display}" codeSystem="2.16.156.10011.2.3.3.11.3" codeSystemName="诊断代码表（ICD-10）"/>
			</observation>
		</entry>
	</xsl:template>
	
	<!-- "西医诊断编码"+ICD10疾病编码+病情转归，用于:病例概要中主要诊断 -->
	<xsl:template match="*" mode="DiagnosisWithOutcome">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.01.024.00" displayName="西医诊断编码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
					<qualifier>
						<name displayName="西医诊断编码"/>
					</qualifier>
				</code>
				<value type="CD" code="{DiagnosisCode/Code}" displayName="{DiagnosisCode/Name}" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10"/>
				<!--病情转归-->
				<entryRelationship typeCode="COMP">
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.113.00" displayName="病情转归代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<value xsi:type="CD" code="{Outcome/Code}" codeSystem="{Outcome/Name}" codeSystemName="病情转归代码表" displayName="{Outcome/Name}"/>
					</observation>
				</entryRelationship>
			</observation>
		</entry>
	</xsl:template>
	<!-- "西医诊断编码"+ICD10疾病编码，用于:病例概要中其他诊断 -->
	<xsl:template match="*" mode="DiagnosisNoPrimary">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.01.024.00" displayName="其他西医诊断编码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
					<qualifier>
						<name displayName="其他西医诊断编码"/>
					</qualifier>
				</code>
				<value xsi:type="CD" code="{DiagnosisCode/Code}" displayName="{DiagnosisCode/Name}" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10"/>
			</observation>
		</entry>
	</xsl:template>
	<!-- 诊断+performer，用于检验报告 -->
	<xsl:template match="*" mode="GeneralDiagnosisWithPerformer">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.01.024.00" displayName="诊断代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
				<effectiveTime value="{/Document/Diagnosis/date}"/>
				<value xsi:type="CD" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="病情转归代码表">
					<xsl:attribute name="code"><xsl:value-of select="DiagnosisStatusCode/Code"/></xsl:attribute>
					<xsl:attribute name="displayName"><xsl:value-of select="DiagnosisStatusCode/Name"/></xsl:attribute>
				</value>
			</observation>
			<!--Performer-->
			<xsl:apply-templates select="Practitioners/Practitioner[PractitionerRole!='医师']" mode="Authenticator"/>
		</entry>
	</xsl:template>
	<xsl:template match="*" mode="DiagnosisEntry1">
		<xsl:variable name="displayName">
			<xsl:choose>
				<xsl:when test="DiagnosisType ='初步诊断'">初步诊断-西医诊断编码</xsl:when>
				<xsl:when test="DiagnosisType='术前诊断'">术前诊断编码</xsl:when>
				<xsl:when test="DiagnosisType ='术后诊断'">术后诊断编码</xsl:when>
				<xsl:when test="DiagnosisType ='入院诊断'">入院诊断</xsl:when>
				<xsl:when test="DiagnosisType ='入院诊断'">入院诊断</xsl:when>
				<xsl:otherwise>诊断编码</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{$displayName}"/>
				<value xsi:type="CD" code="{DiagnosisCode/Code}" displayName="{DiagnosisCode/Name}" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10"/>
			</observation>
		</entry>
	</xsl:template>
	<!--诊断编码条目,只有诊断名称，没有ICD编码,dispalyName多变， 用于多个模板，包括：首次病程-->
	<xsl:template match="*" mode="DiagnosisEntry2">
		<entry>
			<observation classCode="OBS" moodCode="EVN ">
				<code code="DE05.01.025.00" displayName="鉴别诊断-西医诊断名称" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
				<value xsi:type="ST">
					<xsl:value-of select="DiagnosisCode/Name"/>
				</value>
			</observation>
		</entry>
	</xsl:template>
	<!--诊断DE05.01.025.00 + DE05.01.024.00，名称+条目entryRelationship：-->
	<xsl:template match="*" mode="DiagnosisEntry3">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.01.025.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="出院诊断-西医诊断名称"/>
				<value xsi:type="ST">
					<xsl:value-of select="DiagnosisCode/Name"/>
				</value>
				<xsl:variable name="displayName">
					<xsl:choose>
						<xsl:when test="DiagnosisType ='初步诊断'">初步诊断-西医诊断编码</xsl:when>
						<xsl:when test="DiagnosisType='术前诊断'">术前诊断编码</xsl:when>
						<xsl:when test="DiagnosisType ='术后诊断'">术后诊断编码</xsl:when>
						<xsl:when test="DiagnosisType ='入院诊断'">入院诊断</xsl:when>
						<xsl:when test="DiagnosisType ='出院诊断'">出院诊断</xsl:when>
						<xsl:otherwise>诊断编码</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<entryRelationship>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{$displayName}"/>
						<value xsi:type="CD" code="{DiagnosisCode/Code}" displayName="{DiagnosisCode/Name}" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10"/>
					</observation>
				</entryRelationship>
			</observation>
		</entry>
	</xsl:template>
	<!--Mode3: -->
	<xsl:template match="*" mode="DiagnosisMode3">
		<section>
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE05.01.024.00" displayName="诊断代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
					<!--诊断日期-->
					<effectiveTime value="00000000"/>
					<value xsi:type="CD" code="B95.100" displayName="B族链球菌感染" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10"/>
					<performer>
						<assignedEntity>
							<id/>
							<representedOrganization>
								<name>北京大学第三医院</name>
							</representedOrganization>
						</assignedEntity>
					</performer>
				</observation>
			</entry>
		</section>
	</xsl:template>
	<!-- reserved-->
	<xsl:template match="*" mode="GeneralDiagnosisEntry">
		<section>
			<code code="29548-5" displayName="西医诊断编码" codeSystem="2.16.840.1.11883.6.1" codeSystemName="LOINC"/>
			<text/>
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE05.01.024.00" displayName="诊断代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
					<value xsi:type="CD" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="病情转归代码表">
						<xsl:attribute name="code"><xsl:value-of select="DiagnosisStatusCode/Code"/></xsl:attribute>
						<xsl:attribute name="displayName"><xsl:value-of select="DiagnosisStatusCode/Name"/></xsl:attribute>
					</value>
				</observation>
			</entry>
		</section>
	</xsl:template>
	<xsl:template name="ChineseMedicine"/>
	<!--适用文档  ：治疗记录
				：一般手术记录
	-->
	<xsl:template match="Diagnosis" mode="Diag1">
		<component>
			<section>
				<code code="10219-4" displayName="Surgical operation note preoperative Dx" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--术前诊断-->
				<xsl:apply-templates select="'tbd'" mode="DiagnosisEntry"/>
			</section>
		</component>
	</xsl:template>
	<!--适用文档  :门急诊病历-->
	<xsl:template match="Diagnosis" mode="Diag2">
		<component>
			<section>
				<code code="29548-5" displayName="Diagnosis" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--初诊标志代码-->
				<xsl:apply-templates select="*" mode="DiagnosisEntry"/>
				<!--中医“四诊”观察结果-->
				<xsl:apply-templates select="' '" mode="Chinese4OBSEntry"/>
				<!--条目：诊断-->
				<entry>
					<organizer classCode="CLUSTER" moodCode="EVN">
						<statusCode/>
						<component>
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE05.01.025.00" displayName="诊断名称" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
								<value xsi:type="ST">先天性心脏病</value>
							</observation>
						</component>
						<component>
							<observation classCode="OBS" moodCode="EVN">
								<code code="DE05.01.024.00" displayName="诊断代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
								<value xsi:type="CD" code="B95.100" displayName="B族链球菌感染" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10"/>
							</observation>
						</component>
					</organizer>
				</entry>
				<xsl:call-template name="ChineseMedicine"/>
			</section>
		</component>
	</xsl:template>
	<!-- Mode3: 中医四诊-->
	<xsl:template name="Chinese4OBSEntry">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE02.10.028.00" displayName="中医“四诊”观察结果" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
				<value xsi:type="ST">观察结果描述</value>
			</observation>
		</entry>
	</xsl:template>
</xsl:stylesheet>
