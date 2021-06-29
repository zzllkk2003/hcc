/// 数据集定义
Class HLHTPKG.Term.DataSet Extends (%Persistent, %XML.Adaptor)
{

/// 数据集名称
Property DatasetName As %String;

/// 子集名称
Property SubName As %String;

/// 内部标识符
Property InternalId As %String;

/// 数据元标识符
Property MetaId As %String;

/// 数据元名称
Property MetaName As %String;

/// 描述定义
Property Description As %String;

/// 数据元值的数据类型
/// S 	- 字符型，通过字符形式表达的值的类型，可包含字母字符（a~z，A~Z）、数字字符等（默认GB 2312）
/// 			- S1 : 不可枚举型，表示数据元的允许值（值域）是不可枚举的，且以字符描述；
/// 			- S2 : 枚举型，表示数据元的允许值（值域）是可枚举的，通常列表值不超过3个；
/// 			- S3 : 引用型，数据元的允许值（值域）是可枚举的，当列表值超过3个时通常会引用代码表；
/// L 	- 布尔型，又称逻辑型，采用0（False）或1（True）形式表示的逻辑值的类型。
/// N 	- 数值型，通过“0”到“9”数字形式表示的值的类型。
/// D 	- 日期型，采用GB/T 7408中规定的YYYYMMDD格式表示的值的类型。
/// DT	-	日期时间型，采用GB/T 7408中规定的YYYYMMDDThhmmss格式表示的值的类型。（字符T作为时间的标志符，说明时间表示的开始。）
/// T		-	时间型，采用GB/T 7408中规定的hhmmss格式表示的值的类型。
/// BY	-	二进制，上述无法表示的其他数据类型，如图像、音频、视频等二进制流文件格式.
Property MetaDatatype As %String;

/// 表示格式
/// 字符含义描述规则
/// 	-	A			：字母字符
/// 	- AN		：字母或（和）数字字符
/// 	- D8		：采用YYYYMMDD的格式表示，其中，“YYYY”表示年份，“MM”表示月份，“DD”表示日期
/// 	- DT15	：采用YYYYMMDDThhmmss的格式表示，字符T作为时间的标志符，说明日的时间表示的开始；其余字符表示与上同
/// 	- N			：数字字符
/// 	- T6		：采用hhmmss的格式表示，其中“hh”表示小时，“mm”表示分钟，“ss”表示秒。
/// 
/// 字符长度描述规则
/// 固定长度	：在数据类型表示符后直接给出字符长度的数目，如N4
/// 可变长度	：
/// 			- 可变长度不超过定义的最大字符数，在数据类型表示符后加“..”后给出数据元最大字符数目，如AN..10
/// 			- 可变长度在定义的最小和最大字符数之间，在数据类型表示符后给出最小字符长度数后加“..”后再给出最大字符数，如AN4..20
/// 有若干字符行表示的长度	：
/// 			按固定长度或可变长度的规定给出每行的字符长度数后加“X”后，再给出最大行数，如AN..40X3
/// 有小数位	：
/// 			按固定长度或可变长度的规定给出字符长度数后，在“,”后给出小数位数，字符长度数包含整数位数、小数点位数和小数位数，如N6,2
Property Expression As %String;

/// 数据元允许值域引用自表Term.Range的DataValueCode字段
Property AllowValues As %String;

Storage Default
{
<Data name="DataSetDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>DatasetName</Value>
</Value>
<Value name="3">
<Value>SubName</Value>
</Value>
<Value name="4">
<Value>InternalId</Value>
</Value>
<Value name="5">
<Value>MetaId</Value>
</Value>
<Value name="6">
<Value>MetaName</Value>
</Value>
<Value name="7">
<Value>Description</Value>
</Value>
<Value name="8">
<Value>MetaDatatype</Value>
</Value>
<Value name="9">
<Value>Expression</Value>
</Value>
<Value name="10">
<Value>AllowValues</Value>
</Value>
</Data>
<DataLocation>^HLHTPKG.Term.DataSetD</DataLocation>
<DefaultData>DataSetDefaultData</DefaultData>
<IdLocation>^HLHTPKG.Term.DataSetD</IdLocation>
<IndexLocation>^HLHTPKG.Term.DataSetI</IndexLocation>
<StreamLocation>^HLHTPKG.Term.DataSetS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
