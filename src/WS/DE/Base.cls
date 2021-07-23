/// Author: QP
/// Version: 1.0
/// Date: 2021/07/04
/// 数据元基类
Class WS.DE.Base Extends (%SerialObject, %XML.Adaptor, %JSON.Adaptor) [ Abstract, Language = objectscript, Not ProcedureBlock ]
{

/// 数据集
Parameter Category;

/// 数据元描述
Parameter Description;

/// 数据元格式
Parameter Format;

/// 值集
Parameter ValueSet;

/// 值集显示值
Parameter ValueSetDisplay;

/// 数据元数据类型
Parameter WSDT;

/// 数据元内部标识符
Parameter InternalID;

// Property Value As %DataType;

Property Display As %DataType [ Calculated ];

Method DisplayGet() As %Library.String
{
    Quit ##class(WS.DE.Tools).GetValueSetDisplay(..%ClassName(1),..Value)
}

Storage Default
{
<Data name="BaseState">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>BaseState</State>
<StreamLocation>^WS.DE.BaseS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
