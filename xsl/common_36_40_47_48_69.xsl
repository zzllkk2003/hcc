<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sdtc="urn:hl7-org:sdtc" xmlns:isc="http://extension-functions.intersystems.com" xmlns:exsl="http://exslt.org/common" xmlns:set="http://exslt.org/sets" exclude-result-prefixes="isc sdtc exsl set">
	<xsl:output method="xml"/>
	<xsl:template match="/Document">
		<!---36-家族史章节-EMR01-->
		<xsl:apply-templates select="FamilyHistories"/>
		<!---40-输血章节-EMR01-->
		<xsl:apply-templates select="BloodTransfusion/history"/>
		<!---47-预防接种史章节-EMR01-->
		<xsl:apply-templates select="Vaccinations"/>
		<!---48-月经史章节章节-EMR01-->
		<xsl:apply-templates select="Menstrual"/>
		<!---69-过敏史章节-EMR01-->
		<xsl:apply-templates select="Allergy/Allergies"/>
	</xsl:template>
	<!--输血章节模板-->
	<xsl:template match="BloodTransfusion/history">
		<component>
			<section>
				<code code="56836-0" displayName="History of blood transfusion" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
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
				<xsl:apply-templates select="Item"/>
			</section>
		</component>
	</xsl:template>
	<!--过敏史条目-->
	<xsl:template match="Item">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE02.10.022.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{allergen/displayName}"/>
				<value xsi:type="ST">
					<xsl:value-of select="allergen/Value"/>
				</value>
			</observation>
		</entry>
	</xsl:template>
	<!--预防接种史章节模板-->
	<xsl:template match="Vaccinations">
		<component>
			<section>
				<code code="11369-6" codeSystem="2.16.840.1.113883.6.1" displayName="HISTORY OF IMMUNIZATIONS" codeSystemName="LOINC"/>
				<text/>
				<xsl:apply-templates select="Vaccination"/>
			</section>
		</component>
	</xsl:template>
	<!--预防接种史条目-->
	<xsl:template match="Vaccination">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE02.10.101.00" displayName="{name/displayName}" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
				<value xsi:type="ST">
					<xsl:value-of select="name/Value"/>
				</value>
			</observation>
		</entry>
	</xsl:template>
	<!--月经史章节模板-->
	<xsl:template match="Menstrual">
		<component>
			<section>
				<code code="49033-4" displayName="Menstrual History" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!--月经史条目-->
				<xsl:apply-templates select="menstrual"/>
			</section>
		</component>
	</xsl:template>
	<!--月经史条目-->
	<xsl:template match="menstrual">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE02.10.102.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="{displayName}"/>
				<value xsi:type="ST">
					<xsl:value-of select="Value"/>
				</value>
			</observation>
		</entry>
	</xsl:template>
	<!--家族史章节模板-->
	<xsl:template match="FamilyHistories">
		<component>
			<section>
				<code code="10157-6" displayName="HISTORY OF FAMILY MEMBER DISEASES" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<xsl:apply-templates select="FamilyHistory"/>
			</section>
		</component>
	</xsl:template>
	<!--家族史条目-->
	<xsl:template match="FamilyHistory">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE02.10.103.00" displayName="{code/displayName}" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
				<value xsi:type="ST">
					<xsl:value-of select="code/Value"/>
				</value>
			</observation>
		</entry>
	</xsl:template>
</xsl:stylesheet>
