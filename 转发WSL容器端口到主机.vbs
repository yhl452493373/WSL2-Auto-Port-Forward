path = CreateObject("Scripting.FileSystemObject").GetFile(Wscript.ScriptFullName).ParentFolder.Path

'forward wsl port to host port
CreateObject("Shell.Application").ShellExecute "cmd.exe","/c " & path & "\转发WSL容器端口到主机.cmd yes","","runas",0