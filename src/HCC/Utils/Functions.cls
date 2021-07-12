/// 工具类
Class HCC.Utils.Functions Extends Ens.Rule.FunctionSet
{

ClassMethod toUTF8(ByRef tOutput As %GlobalCharacterStream)
{
	Set tLen=3600000, tStreamBuffer="",tTempString=""
	Do tOutput.Rewind()
	While tLen>0
		{
			Set tTempString= tOutput.Read(.tLen,.tSC) 
			Set tTempString= $ZCVT(tTempString,"I","UTF8",handler)
			set tTempString=$REPLACE(tTempString,"&lt;","<")
			set tTempString=$REPLACE(tTempString,"&gt;",">")
			Set tStreamBuffer = tStreamBuffer_tTempString
		}
		Do tOutput.Clear()
		Do tOutput.Write(tStreamBuffer)
}

ClassMethod toUTF8Input(ByRef tOutput As %GlobalCharacterStream)
{
	Set tLen=3600000, tStreamBuffer="",tTempString=""
	Do tOutput.Rewind()
	While tLen>0
		{
			Set tTempString= tOutput.Read(.tLen,.tSC) 
			Set tTempString= $ZCVT(tTempString,"I","UTF8",handler)
			set tTempString=$REPLACE(tTempString,"&lt;","<")
			set tTempString=$REPLACE(tTempString,"&gt;",">")
			Set tStreamBuffer = tStreamBuffer_tTempString
		}
		Do tOutput.Clear()
		Do tOutput.Write(tStreamBuffer)
}

}
