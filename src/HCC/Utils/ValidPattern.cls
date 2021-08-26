/// 保存校验约束内容
Class HCC.Utils.ValidPattern Extends (%Persistent, %XML.Adaptor)
{

/// 校验文档/消息名称
Property DocName As %String;

/// 校验节点内容
Property Node As %String(MAXLEN = "");

/// 基数：显示元素可以重复的次数
/// 格式：a..b
/// 第一位a为可重复最小次数，第二位b为可重复最大次数
/// 例如：1..1 则该项为必填项，0..1 该项为可选项，且最多显示一次
Property Cardinality As %String;

/// 字段说明
Property Comment As %String;

/// 标记该字段验证方式：
///        Expression - 由字段MetaDatatype 和 Expression 验证
///        Fix - 固定值
///        Reference - 链接自表 Term.DataSet 的 MetaId 字段
Property Flag As %String;

/// 外链 Term.DataSet表 的MetaId 字段
/// 该表可能返回多个值，取任一则可
Property Reference As %String;

/// 固定值
Property FixedValue As %String;

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

/// 序号，为了区分规则中的重复项
Property seq As %Integer;

Storage Default
{
<Data name="ValidPatternDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>DocName</Value>
</Value>
<Value name="3">
<Value>Node</Value>
</Value>
<Value name="4">
<Value>Cardinality</Value>
</Value>
<Value name="5">
<Value>Comment</Value>
</Value>
<Value name="6">
<Value>Flag</Value>
</Value>
<Value name="7">
<Value>Reference</Value>
</Value>
<Value name="8">
<Value>FixedValue</Value>
</Value>
<Value name="9">
<Value>MetaDatatype</Value>
</Value>
<Value name="10">
<Value>Expression</Value>
</Value>
<Value name="11">
<Value>seq</Value>
</Value>
</Data>
<DataLocation>^HLHTPKG.Valid.PatternD</DataLocation>
<DefaultData>PatternDefaultData</DefaultData>
<IdLocation>^HLHTPKG.Valid.PatternD</IdLocation>
<IndexLocation>^HLHTPKG.Valid.PatternI</IndexLocation>
<StreamLocation>^HLHTPKG.Valid.PatternS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
