/// 
/// Author: Jeff Liu
/// Date: 2021-11-29 16:50:09
/// LastEditTime: 2021-11-29 16:50:34
/// LastEditors: Jeff Liu
/// Description: 
/// FilePath: /hcc/Users/jiliu/Library/Caches/com.lemonmojo.RoyalTSX.App/LMFileTransferConnection/3538fa5b-6d01-4952-a049-ac116199c617/L2lzYy9oY2MtbWFpbi9zcmMvV1MvREU=/Base.cls
/// Jeff.liu@intersytems.com
/// 
/// Author: QP
/// Version: 1.0
/// Date: 2021/07/04
/// 卫生数据元基类
Class WS.DE.Base Extends (%SerialObject, %XML.Adaptor, %JSON.Adaptor, HCC.SQL.Base) [ Abstract, DependsOn = WS.Tools.CreateWSCode, Language = objectscript, Not ProcedureBlock ]
{

/// 数据集
Parameter Category;

/// 数据元代码
Parameter Code;

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

/// 数据元xsi数据类型
Parameter XSIDT;

/// 数据元内部标识符
/// Parameter InternalID;
/// Code System
Parameter CodeSystem = "2.16.156.10011.2.2.1";

/// Code System Name
Parameter CodeSystemName = "卫生信息数据元目录";

// Property Value As %DataType;

Property DE As %DataType [ Calculated ];

Method DEGet() As %Library.String
{
    Set tTmp=..%ClassName(0)
    Quit $E(tTmp,1,4)_"."_$E(tTmp,5,6)_"."_$E(tTmp,7,9)_"."_$E(tTmp,10,11)
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
