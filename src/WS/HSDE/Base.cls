/// Author: QP
/// Version: 1.0
/// Date: 2021/07/11
/// 卫生数据集元素基类
Class WS.HSDE.Base Extends (%SerialObject, %XML.Adaptor, %JSON.Adaptor) [ Abstract, Language = objectscript, Not ProcedureBlock ]
{

/// 数据集
Parameter Category;

/// 数据元代码
Parameter DECode;

/// 数据集元素描述
Parameter Description;

/// 数据集元素格式
Parameter Format;

/// 值集
Parameter ValueSet;

/// 值集显示值
Parameter ValueSetDisplay;

/// 数据集元素数据类型
Parameter WSDT;

/// 数据元xsi数据类型
Parameter XSIDT;

/// 数据元内部标识符
/// Parameter InternalID;
/// Code System
Parameter CodeSystem;

/// Code System Name
Parameter CodeSystemName;

// Property Value As %DataType;

Property DE As %DataType [ Calculated ];

Method DEGet() As %Library.String
{
    Set tTmp=..%ClassName(0)
    Quit $E(tTmp,1,6)_"."_$E(tTmp,7,8)_"."_$E(tTmp,9,11)
}

Property Display As %DataType [ Calculated ];

Method DisplayGet() As %Library.String
{
    Quit ##class(WS.DE.Tools).GetValueSetDisplay(..%ClassName(1),..Value)
}

Property codeSystem As %DataType [ Calculated ];

Method codeSystemGet() As %Library.String
{
    Quit ..#CodeSystem
}

Property codeSystemName As %DataType [ Calculated ];

Method codeSystemNameGet() As %Library.String
{
    Quit ..#CodeSystemName
}

Property code As %DataType [ Calculated ];

Method codeGet() As %Library.String
{
    Quit ..#Code
}

Property displayName As %DataType [ Calculated ];

Method displayNameGet() As %Library.String
{
    Quit ..#Description
}

Property xsiType As %DataType [ Calculated ];

Method xsiTypeGet() As %Library.String
{
    Quit ..#XSIDT
}

Storage Default
{
<StreamLocation>^WS.HSDE.BaseS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
