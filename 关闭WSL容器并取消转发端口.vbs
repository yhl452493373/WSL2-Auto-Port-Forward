path = CreateObject("Scripting.FileSystemObject").GetFile(Wscript.ScriptFullName).ParentFolder.Path

'delete forward wsl port to host port
CreateObject("Shell.Application").ShellExecute "cmd.exe","/c " & path & "\删除转发到主机的端口.cmd yes","","runas",0
'shutdown wsl and delete forward host port to wsl port
CreateObject("Shell.Application").ShellExecute "cmd.exe","/c " & path & "\删除转发到WSL的端口.cmd yes","","runas",0