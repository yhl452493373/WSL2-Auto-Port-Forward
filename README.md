# WSL2-Auto-Port-Forward(WSL2端口自动转发脚本)
### auto forward host port to wsl2 port

## 中文说明

WSL:Ubuntu-18.04
文件位置:我放在 D:\WSL 目录下

+ "导出Ubuntu-18.04.cmd" 用于导出WSL到脚本所在目录,导出后文件名为Ubuntu-18.04.tar
+ "TAR恢复Ubuntu-18.04.cmd" 用于恢复 "导出Ubuntu-18.04.cmd" 脚本所导出的WSL,恢复位置为: E:\Linux\Ubuntu-18.04,可通过修改脚本修改恢复位置
+ "移除恢复的Ubuntu-18.04.cmd" 用于卸载 "TAR恢复Ubuntu-18.04.cmd" 脚本所恢复的WSL
+ "WSL状态.cmd" 用于显示WSL运行状态以及端口转发列表
+ "启动WSL容器.cmd" 用于启动WSL容器以及运行WSL需要开机启动的脚本.文件init.sh为WSL开机启动脚本,需放到WSL下的/etc/下面.如果执行脚本时跟了参数 yes,则在脚本执行完成后不会直接退出
+ "删除转发到WSL的端口.cmd" 用于删除本机转发到WSL的端口以及关闭WSL.如果如果执行脚本时跟了参数 yes,则在脚本执行完成后不会直接退出,也不会关闭WSL
+ "转发端口到WSL容器.cmd" 用于转发本机端口到WSL端口,便于通过本机IP:端口的组合访问WSL.文件getIp.sh为获取WSL当前IP的脚本,需放到WSL下的/etc/下面.如果执行脚本时跟了参数 yes,则在脚本执行完成后不会直接退出
+ "启动WSL容器并转发端口.vbs" 用于登陆时自动启动WSL,并执行WSL开机自启脚本,且不会有CMD黑窗.可以用Windows的计划任务,在登录时执行;或直接放到Windows的"启动"文件夹实现开机自启
+ "关闭WSL容器并取消转发端口.vbs" 用于注销时自动取消转发本机端口到WSL以及关闭WSL

## English

WSL:Ubuntu-18.04
ALL FILES IN: D:\WSL

+ "导出Ubuntu-18.04.cmd" is use to export WSL to script dir,export file name is Ubuntu-18.04.tar.
+ "TAR恢复Ubuntu-18.04.cmd" is use to restore exported WSL by "导出Ubuntu-18.04.cmd" ,restore WSL file at: E:\Linux\Ubuntu-18.04,you can change it in script.
+ "移除恢复的Ubuntu-18.04.cmd" is use to uninstall exported WSL by "TAR恢复Ubuntu-18.04.cmd".
+ "WSL状态.cmd" is use to show WSL state,version and port forward list.
+ "启动WSL容器.cmd" is use to launch WSL and the init script of WSL when it's start.file init.sh is a script of WSL which need to launch at WSL start,put it at /etc/init.sh in WSL.if this cmd has a param "yes",it won't exit when is run complete
+ "删除转发到WSL的端口.cmd" is use to DELETE FORWARD host port to WSL port and shutdown WSL.if this cmd has a param "yes",it won't exit when is run complete , also won't shutdown WS.L
+ "转发端口到WSL容器.cmd" is use to FORWARD host port to WSL,because of this, you can use "host port:WSL port" to visit WSL.file getIp.sh is a script to get WSL's IP,put it at /etc/getIp.sh.if this cmd has a param "yes",it won't exit when is run complete.
+ "启动WSL容器并转发端口.vbs" is use to auto startup WSL and forward host port to WSL.
+ "关闭WSL容器并取消转发端口.vbs" is use to disable forward host port to WSL and shutdown WSL.
