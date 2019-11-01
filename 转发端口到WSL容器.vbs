path = CreateObject("Scripting.FileSystemObject").GetFile(Wscript.ScriptFullName).ParentFolder.Path

'forward host port to wsl port
CreateObject("Shell.Application").ShellExecute "cmd.exe","/c " & path & "\转发端口到WSL容器.cmd yes","","runas",0