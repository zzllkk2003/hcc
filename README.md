<!--
 * @Author: Jeff Liu
 * @Date: 2021-08-11 11:28:29
 * @LastEditTime: 2021-08-11 11:30:12
 * @LastEditors: Jeff Liu
 * @Description: 
 * @FilePath: /hcc/README.md
 * Jeff.liu@intersytems.com
-->
# hcc
<font size =4>
healthconnect互联互通实现

命名规范：

## 标准: WS
- DE
- DOC
- VS
## 原型：HCC
- RestfulApi
- SQL
- Config
   - Doc
   - DocSection
- SVR
   - Prod
       - BS
       - BP
       - BO
       - PubSub
       - DT
       - MSG
    - API
      - PubSub(发布订阅注册到外部系统)
- DocRepository
- Utils (工具包)

MockSys 分支中包括模拟系统来测试服务消息。

/CDACoreSchemas 下为共享文档schema和样例

/Messages 下为消息schema以及样例


互联互通服务消息处理日志：
action
sessionID
session开始时间
session结束时间
处理状态

</font>
