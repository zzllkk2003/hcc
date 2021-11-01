<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:template match="*" mode="TP297">
		<!--诊疗过程名称-->
		<entry>
			<observation classCode="OBS" moodCode="EVN ">
				<code code="DE06.00.297.00" displayName="诊疗过程名称" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
				<value xsi:type="ST">
					<xsl:value-of select="treatmentProcess/Value"/>
				</value>
			</observation>
		</entry>
	</xsl:template>
	<!--西医诊断名称-->
	<!--治则治法-->
	<xsl:template match="*" mode="TP300">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE06.00.300.00" displayName="治则治法" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
				<value xsi:type="ST">
					<xsl:value-of select="treatmentPrinciple/Value"/>
				</value>
			</observation>
		</entry>
	</xsl:template>
	<!--会诊目的-->
	<xsl:template match="*" mode="TP214">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE06.00.214.00" displayName="会诊目的" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
				<value xsi:type="ST">
					<xsl:value-of select="consultPurpose/Value"/>
				</value>
			</observation>
		</entry>
	</xsl:template>
	<!--辨证论治-->
	<xsl:template match="*" mode="TP131">
		<component>
			<section>
				<code code="18776-5" displayName="TREATMENT PLAN" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--辩证论治-->
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.131.00" displayName="辩证论治" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
						<value xsi:type="ST">
							<xsl:value-of select="differentiationNotes/Value"/>
						</value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
</xsl:stylesheet>
