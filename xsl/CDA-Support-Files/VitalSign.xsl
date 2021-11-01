<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<!--生命体征章节模板-->
	<xsl:template match="VitalSigns">
		<component>
			<section>
				<code code="8716-3" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"
					displayName="VITAL SIGNS"/>
				<text/>
				<!--体重条目-->
				<xsl:apply-templates select="VitalSign" mode="weight"></xsl:apply-templates>
				<!--体温条目-->
				<xsl:apply-templates select="VitalSign" mode="temp"></xsl:apply-templates>
				<!--脉率条目-->
				<xsl:apply-templates select="VitalSign" mode="pulse"></xsl:apply-templates>
				<!--呼吸频率条目-->
				<xsl:apply-templates select="VitalSign" mode="breathing"></xsl:apply-templates>
				<!--起搏器心率条目-->
				<xsl:apply-templates select="VitalSign" mode="heart"></xsl:apply-templates>
				
				<entry>
					<organizer classCode="BATTERY" moodCode="EVN">
						<code displayName="血压"/>
						<statusCode/>
						<!--收缩压条目-->
						<xsl:apply-templates select="VitalSign" mode="systolic"></xsl:apply-templates>
						
						<!--舒张压条目-->
						<xsl:apply-templates select="VitalSign" mode="diastolic"></xsl:apply-templates>		
					</organizer>
				</entry>
			</section>
		</component>
	</xsl:template>
	<!--体重条目-->
	<xsl:template match="*" mode="weight">
		<xsl:if test ="type ='DE04.10.188.00'">
			<xsl:comment>体重</xsl:comment>
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE04.10.188.00" codeSystem="2.16.156.10011.2.2.1"
						codeSystemName="卫生信息数据元目录" displayName="体重"/>
					<value xsi:type="PQ" value="{value}" unit="kg"/>
				</observation>
			</entry>
		</xsl:if>
	</xsl:template>
	<!--体温条目-->
	<xsl:template match="*" mode="temp">
		<xsl:if test ="type ='DE04.10.186.00'">
			<!-- 体温 -->
			<xsl:comment>体温</xsl:comment>
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE04.10.186.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="体温"/>
					<value xsi:type="PQ" value="{value}" unit="℃"/>
				</observation>
			</entry>
		</xsl:if>
	</xsl:template>
	<!--脉率条目-->
	<xsl:template match="*" mode="pulse">
		<xsl:if test="type ='DE04.10.118.00'">
			<!-- 脉率 -->
			<xsl:comment>脉率</xsl:comment>
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE04.10.118.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="脉率"/>
					<value xsi:type="PQ" value="{value}" unit="次/min"/>
				</observation>
			</entry>
		</xsl:if>
	</xsl:template>
	<!--呼吸频率条目-->
	<xsl:template match="*" mode="breathing">
		<xsl:if test="type ='DE04.10.081.00'">
			<!-- 呼吸频率 -->
			<xsl:comment>呼吸频率</xsl:comment>
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE04.10.081.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="呼吸频率"/>
					<value xsi:type="PQ" value="{value}" unit="次/min"/>
				</observation>
			</entry>
		</xsl:if>
	</xsl:template>
	<!--起搏器心率条目-->
	<xsl:template match="*" mode="heart">
		<xsl:if test="type ='DE04.10.206.00'">
			<!-- 起搏器心率 -->
			<xsl:comment>起搏器心率</xsl:comment>
			<entry>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE04.10.206.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="心率"/>
					<value xsi:type="PQ" value="{value}" unit="次/min"/>
				</observation>
			</entry>
		</xsl:if>
	</xsl:template>
	<!--收缩压条目-->
	<xsl:template match="*" mode="systolic">
		<xsl:if test="type ='DE04.10.174.00' ">
			<!-- 收缩压 -->
			<xsl:comment>收缩压</xsl:comment>
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
			<!-- 舒张压 -->
			<xsl:comment>舒张压</xsl:comment>
			<component>
				<observation classCode="OBS" moodCode="EVN">
					<code code="DE04.10.176.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="舒张压"/>
					<value xsi:type="PQ" value="{value}" unit="mmHg"/>
				</observation>
			</component>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
