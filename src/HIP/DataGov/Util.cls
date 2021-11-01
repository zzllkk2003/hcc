/// Author: QP
/// Version: 1.0
/// Date:2021/09
/// 数据治理工具类
Class HIP.DataGov.Util Extends %RegisteredObject
{

/// 检查表数据约束
/// pTable: 全表名
/// pBatch: 批号。如果pBatch不为空，仅检查对应的批号的数据；否则做全表检查
ClassMethod CheckContrains(pTable, pBatch = "") As %Status
{
    Set tSC = $$$ERROR($$$GeneralError,"表"_pTable_"不存在")
    // get class name from table name
    Set tTable = $ZCVT($P(pTable,".",2),"U"), tSchema = $ZCVT($P(pTable,"."),"U"), tClass = ""
    &sql(select Name into :tClass from %Dictionary.CompiledClass where UPPER(SqlTableName)= :tTable and UPPER(SqlSchemaName)= :tSchema)
    return:(SQLCODE=100) tSC
    
    // only subclass of HCC.SQL.Base could be checked
    &SQL(select count(*) into :tReady4Check from %Dictionary.CompiledClass where id=:tClass and super ['HCC.SQL.Base')
    return:(tReady4Check=0) $$$ERROR($$$GeneralError,"表"_pTable_"不是检查就绪的表")
    
    #dim tRS As %SQL.StatementResult
    // list properties of all unique indices and foreign keys
    Set tSQL = "select Name,Properties from %Dictionary.CompiledIndex where parent='"_tClass_"' and (PrimaryKey=1 or _Unique=1)"
    Set tQuery = ##class(%SQL.Statement).%New()
    Set tSC = tQuery.%Prepare(tSQL)
    return:$$$ISERR(tSC) tSC
    Set tRS=tQuery.%Execute()
    While (tRS.%Next()) 
    {
        Set tIndProp(tRS.%Get("Name"))=tRS.%Get("Properties")
    }
    Do tQuery.%Close(),tRS.%Close()
    // get prop to col mapping
    Set tPropColMapping=""
    Do ..GetColPropMapping(pTable,.tPropColMapping)
    
    // check all data
    Set tQuery = ##class(%SQL.Statement).%New()
    If pBatch '=""
    {
        Set tSQL="select A.ID from "_pTable_" A, HCC_SQL.Document D where A.DocumentNo = D.ID and D.BatchNo=?"
        Set tSC = tQuery.%Prepare(tSQL)
        return:$$$ISERR(tSC) tSC
        Set tRS=tQuery.%Execute(pBatch)
    }
    Else
    {
        Set tSC = tQuery.%PrepareClassQuery(tClass,"Extent")
        return:$$$ISERR(tSC) tSC
        Set tRS=tQuery.%Execute()
    }

    While (tRS.%Next()) 
    {
        Set tObjId = tRS.%Get("ID")
        set tOBJ = $classmethod(tClass, "%OpenId", tObjId)
        Do tOBJ.SetModified()
                
        set tSC = tOBJ.%ValidateObject()
        if $$$ISERR(tSC) 
        {
            Kill errorlist
            do $system.Status.DecomposeStatus(tSC,.tErrLst)
            If $$$ISERR(tSC) 
            {
                // if error, log error message so users can see them
                Do $SYSTEM.Status.DecomposeStatus(tSC,.errorlist)
                For i=1:1:errorlist
                {
                    //error code
                    Set tErrorCode = errorlist(i,"code")
                    //error msg
                    Set tMsg = errorlist(i)
                    //property name and value
                    Set (tProp,tValue)=""
                    Set tDepth = $G(errorlist(i,"embeddederror"))
                    If tDepth'=""
                    {
                        Kill tTmp
                        For j=1:1:tDepth
                        {
                            Set tErrMsg = $G(errorlist(i,"embeddederror",j))
                            Set tErrMsg = $E(tErrMsg,3,$L(tErrMsg))
                            Set tProp=$P($lg($lg(tErrMsg,1),2),":",2)_"."_tProp
                            Set:(j=1) tValue=$lg($lg(tErrMsg,1),3)
                        }
                        //
                        If tErrorCode="5659"
                        {
                            Set tProp = tProp_$P($P($P($G(errorlist(i)),"属性'",2),"::",2),"("),tValue=""
                        }
                        Else
                        {
                            Set tProp = $E(tProp,1,$L(tProp)-1)
                        }
                    }
                    Else
                    {
                        Set tProp = $P($P($P($G(errorlist(i)),"属性'",2),"::",2),"(")
                    }
                    
                    Set tCol = $G(tPropColMapping("PC",tProp))
                    Set:(tCol ="") tCol = $G(tPropColMapping("PC",tProp_".Value"))
                    &SQL(
                    INSERT INTO HIP_DataGov.Log(SQLTable,RecordId,ColumnName,Value,ErrorCode,Error,Batch) 
                    VALUES(:tClass,:tObjId,:tCol,:tValue,:tErrorCode,:tMsg,:pBatch)
                    )
                }
                
                /*
                For i=1:1:errorlist 
                {
                    Set tErrorlog = errorlist(i)
                    Set tCount = $L(tErrorlog,": 属性'")
                    Kill tTmp
                    For j=1:1:(tCount-1)
                    {
                        Set tTmp(j)=$P($P($P(tErrorlog,": 属性'",j+1),"'"),":",2)
                    }

                    For j=1:1:(tCount-1)
                    {
                        if j=1 
                        {
                            Set tProp=tTmp(j)
                        }
                        else
                        {
                            Set tProp=tTmp(j)_"."_tProp
                        }
                    }
                    
                    Set tRegex=##class(%Regex.Matcher).%New("错误 #(\d{4}):(.*)(?s).*\> 错误 #5802: 属性'"_tClass_":(.{1,100})'.*\值等于""(.*)""")
                    Set tRegex.Text=errorlist(i)
                    while tRegex.Locate() 
                    {
                        //error code
                        Set tErrorCode = tRegex.SubstituteIn("$1")
                        //error msg
                        Set tMsg = tRegex.SubstituteIn("$2")
                        //property name
                        Set tProp = tRegex.SubstituteIn("$3")
                        //property value
                        Set tValue = tRegex.SubstituteIn("$4")
                        
                        &SQL(
                        INSERT INTO HIP_DataGov.Log(SQLTable,RecordId,ColumnName,Value,ErrorCode,Error) 
                        VALUES(:tClass,:tObjId,:tProp,:tValue,:tErrorCode,:tMsg)
                        )
                    }
                    Kill tRegex

                }
                */
            }
            //Set tError = $system.Status.GetErrorText(tSC)
        }
        Kill tOBJ
        
        set tSC=$classmethod(tClass,"%CheckConstraints",tObjId)
        if $$$ISERR(tSC) 
        {
            Set tError = $system.Status.GetErrorText(tSC)
            Kill errorlist
            ;do $system.Status.DisplayError(tSC)
            Do $SYSTEM.Status.DecomposeStatus(tSC,.errorlist)
            For i=1:1:errorlist 
            {
                set tRegex=##class(%Regex.Matcher).%New("错误 #(\d{4}):(.*)\: "_tClass_"\.(.*)")
                Set tRegex.Text=errorlist(i)

                while tRegex.Locate() 
                {
                    //error code
                    Set tErrorCode = tRegex.SubstituteIn("$1")
                    //error msg
                    Set tMsg = tRegex.SubstituteIn("$2")
                    //property name
                    Set tProp = $G(tIndProp(tRegex.SubstituteIn("$3")))
                    //column name
                    Set tCol = $G(tPropColMapping("PC",tProp))
                    &SQL(
                    INSERT INTO HIP_DataGov.Log(SQLTable,RecordId,ColumnName,ErrorCode,Error,Batch) 
                    VALUES(:tClass,:tObjId,:tCol,:tErrorCode,:tMsg,:pBatch)
                    )
                }
                Kill tRegex
            }
        }
    }
    Do tQuery.%Close(),tRS.%Close()
    
    Return tSC
}

/// 获得表字段与属性的对应关系
/// pTable: 完整表名
/// pMapping: 产生的对应关系. 
/// pMapping("CP","<字段>")="<属性>"
/// pMapping("PC","<属性>")="<字段>"
ClassMethod GetColPropMapping(pTable, Output pMapping) As %Status
{
    Set pMapping="",tSC=$$$OK
    Set tQry = ##class(%SQL.Statement).%New()
    Set tSC = tQry.%PrepareClassQuery("HCC.SQL.QPTools","SQLFields")
    Return:$$$ISERR(tSC) tSC
    Set tRS=tQry.%Execute(pTable)

    While (tRS.%Next()) 
    {
        Set tCol = tRS.%Get("FIELD_NAME"),
            tPar = tRS.%Get("CONTAINER_FIELD"),
            tOPro = tRS.%Get("ORIGINATING_PROPERTY"),
            tOTyp = tRS.%Get("CONTAINER_TYPE"),
            tHid = tRS.%Get("HIDDEN"),
            tSeF = tRS.%Get("SERIAL_FIELD")   
        
        If (tHid="Yes") 
        {
            Set tProp = $Case(tOTyp,"":tOPro,:tOTyp_"."_tOPro)
            Set:(tPar'="") tProp = $G(tHidLst(tPar))_"."_tOPro
            Set tHidLst(tCol)=tProp
        }
        Else
        {
            Set tProp = $Case(tOTyp,"":tOPro,:tOTyp_"."_tOPro)
            Set:(tPar'="") tProp = $G(tHidLst(tPar))_"."_tOPro
            Set pMapping("CP",tCol)=tProp
            Set pMapping("PC",tProp)=tCol
        }
    }
    k tHidLst
    Return tSC
}

ClassMethod GetClassType(pClassName) As %String
{
    set tClassType=""
    &SQL(SELECT ClassType into :tClassType FROM %Dictionary.CompiledClass WHERE ID = :pClassName)
    Q tClassType
}

}
