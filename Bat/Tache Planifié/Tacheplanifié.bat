REM https://docs.microsoft.com/fr-fr/troubleshoot/windows-client/system-management-components/use-at-command-to-schedule-tasks
REM Pour copier tous les fichiers du dossier Documents vers le dossier MyDocs à minuit, tapez la ligne suivante, puis appuyez sur Entrée :
at 00:00 cmd /c copy C:\Documents\*.* C:\MyDocs
REM Pour la back up the Products server at 23:00 P.M. Chaque jour de la semaine, créez un fichier de commandes contenant les commandes de sauvegarde (par exemple, Backup.bat), tapez la ligne suivante, puis appuyez sur Entrée pour planifier la sauvegarde
at \\products 23:00 /every:M,T,W,Th,F backup
REM Supprimer une tche programmeé 
at \\computername id /delete | /delete /yes
REM voir cette doucmentation egalement https://docs.microsoft.com/fr-fr/windows-server/administration/windows-commands/schtasks-query
REM Pour demander une liste de tâches planifiées pour un ordinateur distant et ajouter les tâches à un fichier journal séparé par des virgules sur l’ordinateur local, tapez :
schtasks /query /s Reskit16 /fo csv /nh >> \\svr01\data\tasklogs\p0102.csv
