;#DropDB Project_Three_BackupEasyTest

#Application Project_Three_Backup.Win
#Application Project_Three_Backup.Web

*FillForm
 User Name = Admin
*Action Log On

#IfDef Project_Three_Backup.Win

*Action About...
 
*Action OK

#EndIf

#IfDef Project_Three_Backup.Web
*Action Navigation(My Details)
#EndIf
