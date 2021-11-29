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
						<code xsi:type="CD" code="{code/Value}" displayName="{code/Display}" codeSystem="2.16.156.10011.2.3.3.12" codeSystemName="手术(操作)代码表(ICD-9-CM)"/>
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
						<value xsi:type="CD" code="{anesthesiaMethod/Value}" displayName="{anesthesiaMethod/Display}" codeSystem="2.16.156.10011.2.3.1.159" codeSystemName="麻醉方法代码表"/>
					</observation>
				</entry>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.10.063.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术过程"/>
						<value xsi:type="ST"><xsl:value-of select="process/Value"/></value>
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
				<!--术后诊断条目-->
				<xsl:apply-templates select="SurgicalOperationNotePostoperativeDX[code/Value]"></xsl:apply-templates>
				<entry>
					<observation classCode="OBS" moodCode="EVN">
						<code code="DE05.01.070.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="诊断依据"/>
						<value xsi:type="ST"><xsl:value-of select="SurgicalOperationNotePostoperativeDX[basis/Value]/basis/Value"/></value>
					</observation>
				</entry>
			</section>
		</component>
	</xsl:template>
	<xsl:template match="SurgicalOperationNotePostoperativeDX[code/Value]">
		<entry>
			<observation classCode="OBS" moodCode="EVN">
				<code code="DE05.01.025.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="术后诊断名称"/>
				<value xsi:type="ST"><xsl:value-of select="code/Display"/></value>
				<xsl:if test="code/Value">
					<entryRelationship typeCode="COMP"> 
						<observation classCode="OBS" moodCode="EVN"> 
							<code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="术后诊断编码"/>  
							<value xsi:type="CD" code="{code/Value}" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10">
								<xsl:if test="code/Display">
									<xsl:attribute name="displayName"><xsl:value-of select="code/Display"/></xsl:attribute>
								</xsl:if>
							</value> 
						</observation> 
					</entryRelationship> 
				</xsl:if>
			</observation>
		</entry>
	</xsl:template>
	<xsl:template match="*" mode="C0048P3">
		<!--注意事项章节-->
		<component>
			<section>
				<code code="DE09.00.119.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="注意事项章节"/>
				<text/>
			</section>
		</component>
	</xsl:template>
	<xsl:template match="*" mode="C0053PC">
		<component> 
			<section> 
				<code code="47519-4" displayName="HISTORY OF PROCEDURES" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>  
				<text/>  
				<!--手术记录条目-->  
				<entry> 
					<!-- 手术记录 -->  
					<procedure classCode="PROC" moodCode="EVN"> 
						<!--HDSD00.16.038 DE06.00.093.00 手术及操作编码 -->  
						<code code="43.41013" displayName="胃镜下胃病损电切术" codeSystem="2.16.156.10011.2.3.3.12" codeSystemName="手术(操作)代码表(ICD-9-CM)"/>  
						<statusCode/>  
						<!--手术及操作编码、操作日期/时间-->  
						<!--HDSD00.16.039 DE06.00.221.00 手术及操作开始日期时间 -->  
						<effectiveTime value="{beginTime/Value}"/>  
						<!--HDSD00.16.040 DE06.00.257.00 手术切口类别代码 -->  
						<entryRelationship typeCode="COMP"> 
							<observation classCode="OBS" moodCode="EVN"> 
								<code code="DE06.00.257.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="手术切口类别代码"/>  
								<value xsi:type="CD"  code="{cutLevel/Value}" displayName="{cutLevel/Display}" codeSystem="2.16.156.10011.2.3.1.256" codeSystemName="手术切口类别代码表" /> 
							</observation> 
						</entryRelationship>  
						<!--HDSD00.16.029 DE05.10.147.00 切口愈合等级代码 -->  
						<entryRelationship typeCode="COMP"> 
							<observation classCode="OBS" moodCode="EVN"> 
								<code code="DE05.10.147.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="切口愈合等级代码"/>  
								<value xsi:type="CD" code="{healingLevel/Value}" displayName="{healingLevel/Display}" codeSystem="2.16.156.10011.2.3.1.257" codeSystemName="手术切口愈合等级代码表"/> 
							</observation> 
						</entryRelationship>  
						<!--HDSD00.16.025 DE06.00.073.00 麻醉方法代码 -->  
						<entryRelationship typeCode="COMP"> 
							<observation classCode="OBS" moodCode="EVN"> 
								<code code="DE06.00.073.00" codeSystem="2.16.156.10011.2.2.2" codeSystemName="卫生信息数据元目录" displayName="麻醉方法代码"/>  
								<value code="{anesthesiaMethod/Value}" displayName="{anesthesiaMethod/Display}" codeSystem="2.16.156.10011.2.3.1.159" codeSystemName="麻醉方法代码表" xsi:type="CD"/> 
							</observation> 
						</entryRelationship>  
						<!-- HDSD00.16.037 DE05.10.063.00 手术过程 -->  
						<xsl:if test="process/Value">
							<entryRelationship typeCode="COMP"> 
								<observation classCode="OBS" moodCode="EVN"> 
									<code code="DE05.10.063.00" codeSystem="2.16.156.10011.2.2.2" codeSystemName="卫生信息数据元目录" displayName="手术过程"/>  
									<value xsi:type="ST"><xsl:value-of select="process/Value"/></value> 
								</observation> 
							</entryRelationship> 
						</xsl:if>
					</procedure> 
				</entry> 
			</section> 
		</component>
	</xsl:template>
</xsl:stylesheet>
