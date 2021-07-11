Class WS.DE.DE085001900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "药品、设备与材料";

Parameter Description = "执法取证设备类别代码";

Parameter Format = "N1";

Parameter ValueSet = "1:摄像机;2:照相机;3:录音机(笔);";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE08.50.019.00");

Storage Default
{
<Data name="DE085001900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE085001900State</State>
<StreamLocation>^WS.DE.DE085001900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
