<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XMLSpy v2013 (http://www.altova.com) by  () -->
<xsl:stylesheet version="2.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<!--疾病史（含外伤）-->
	<xsl:template match="*" mode="IllnessHistory">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE02.10.026.00" displayName="疾病史（含外伤）" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
				<value xsi:type="ST">
					<xsl:value-of select="name/value"/>
				</value>
			</observation>
		</entry>
	</xsl:template>
	<!--传染病史-->
	<xsl:template match="*" mode="InfectiousDiseaseHistory">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE02.10.008.00" displayName="传染病史" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
				<value xsi:type="ST">
					<xsl:value-of select="name/value"/>
				</value>
			</observation>
		</entry>
	</xsl:template>
	<!--手术史-->
	<xsl:template match="*" mode="SurgeryHistory">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE02.10.061.00" displayName="手术史" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
				<value xsi:type="ST">
					<xsl:value-of select="name/value"/>
				</value>
			</observation>
		</entry>
	</xsl:template>
	<!--婚育史条目-->
	<xsl:template match="*" mode="Obstericalhistory">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE02.10.098.00" displayName="婚育史" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
				<value xsi:type="ST">
					<xsl:value-of select="name/value"/>
				</value>
			</observation>
		</entry>
	</xsl:template>
	<!--输血章节-->
	<xsl:template match="*" mode="BloodTransfusionHistory">
		<xsl:comment>输血史</xsl:comment>
		<observation classCode="OBS" moodCode="EVN">
			<code code="DE02.10.100.00" displayName="输血史" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
			<value xsi:type="ST">
				<xsl:value-of select="Value"/>
			</value>
		</observation>
	</xsl:template>
	<!--过敏史章节-->
	<xsl:template match="*" mode="Allergy">
		<xsl:comment>过敏史</xsl:comment>
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE02.10.022.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="过敏史"/>
				<value xsi:type="ST">
					<xsl:value-of select="name/value"/>
				</value>
			</observation>
		</entry>
	</xsl:template>
	<!--预防接种史章节-->
	<xsl:template match="*" mode="ImmunizationHistory">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE02.10.101.00" displayName="预防接种史" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
				<value xsi:type="ST">
					<xsl:value-of select="name/value"/>
				</value>
			</observation>
		</entry>
	</xsl:template>
	<!--个人史章节-->
	<xsl:template match="*" mode="SocialHistory">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="29762-2" displayName="个人史" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<value xsi:type="ST">
					<xsl:value-of select="name/value"/>
				</value>
			</observation>
		</entry>
	</xsl:template>
	<!--月经史章节-->
	<xsl:template match="*" mode="MenstrualHistory">
		<xsl:comment>月经史</xsl:comment>
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE02.10.102.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="月经史"/>
				<value xsi:type="ST">
					<xsl:value-of select="name/value"/>
				</value>
			</observation>
		</entry>
	</xsl:template>
	<!--家族史-->
	<xsl:template match="*" mode="FamilyHistory">
		<xsl:comment>家族史</xsl:comment>
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE02.10.103.00" displayName="家族史" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
				<value xsi:type="ST">
					<xsl:value-of select="name/value"/>
				</value>
			</observation>
		</entry>
	</xsl:template>
</xsl:stylesheet>
