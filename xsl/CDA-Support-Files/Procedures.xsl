<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<!--C0048-->
	<xsl:template match="*" mode="C0048P1">
		<component>
			<section>
				<code code="47519-4" displayName="HISTORY OF PROCEDURES" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<!-- 手术及操作编码 DE06.00.093.00 -->
				<entry>
					<procedure classCode="PROC" moodCode="EVN">
						<code xsi:type="CD" code="{code/Value}" displayName="{code/Display}" codeSystem="2.16.156.10011.2.3.3.12" codeSystemName="手术(操作)代码表（ICD-9-CM）"/>
					</procedure>
				</entry>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.094.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术名称"/>
						<value xsi:type="ST"><xsl:value-of select="name/Value"/></value>
					</observation>
				</entry>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.187.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术目标部位名称"/>
						<value xsi:type="ST"><xsl:value-of select="bodyPart/Value"/></value>
					</observation>
				</entry>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.221.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术日期时间"/>
						<value xsi:type="TS" value="{procedureTime/Value}"/>
					</observation>
				</entry>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE06.00.073.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="麻醉方法代码"/>
						<value xsi:type="CD" code="{anesthesiaMethod/Value}" displayNme="{anesthesiaMethod/displayName}" codeSystem="2.16.156.10011.2.3.1.159" codeSystemName="麻醉方法代码表"/>
					</observation>
				</entry>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.063.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术过程"/>
						<value xsi:type="ST"><value xsi:type="TS" value="{process/Value}"/></value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
	<xsl:template match="*" mode="C0048P2">
		<!--术后诊断章节-->
		<component>
			<section>
				<code code="10218-6" displayName="Surgical operation note postoperative Dx" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
				<text/>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.01.025.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="术后诊断名称"/>
						<value xsi:type="ST"><value xsi:type="TS" value="{name/displayName}"/></value>
					</observation>
				</entry>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="术后诊断编码"/>
						<value xsi:type="CD" code="{code/Value}" codeSystem="2.16.156.10011.2.3.3.11.3" codeSystemName="ICD-10诊断编码表"/>
					</observation>
				</entry>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.01.070.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="诊断依据"/>
						<value xsi:type="ST"><value xsi:type="TS" value="{basis/Value}"/></value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
	<xsl:template match="*" mode="C0048P3">
		<!--注意事项章节-->
		<component>
			<section>
				<code code="DE09.00.119.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="注意事项章节"/>
				<text><value xsi:type="TS" value="{Attention/attention/Value}"/></text>
			</section>
		</component>
	</xsl:template>
</xsl:stylesheet>
