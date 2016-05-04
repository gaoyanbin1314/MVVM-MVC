# MVVM-MVC
mvvm和mvc 对比的小demo

mvvm 是 mvc 设计模式的变种

如果把app比做一个饭馆的话
MVC模式
M - Model  是食物
v - view   是餐馆装修
C - Controller 是老板 － 既 做厨师（做饭）又是 服务员（把菜端上桌）
 
所以 Controller的功能比较多 如果业务逻辑多的话 

MVVM 模式
M - Model         是食材
V - View          是装饰    有时候也要做一些数据处理 类似智能家具的功能
VM - ViewModel    是服务生  老板Controller 让做什么就做什么 要处理数据 或 加载数据 看老板的心情
C  - Controller   老板      不再亲自干活 只负责分配任务 把控全局

当服务员完成一件事后 服务生要向老板报告，反馈结果 让老板掌握全局 等待老板处理 或安排新的任务

MVVM 只是把 controller 要完成是事交给了其他模块完成 不用让controller去处理所有的 业务逻辑 和 加载数据的细节 使功能更加清晰 有更好的阅读性
一些ViewModel 也可能复用 节省开发时间 但对controller的压力减轻效果 也许不如预期好

只是个人拙见 🌴😁
