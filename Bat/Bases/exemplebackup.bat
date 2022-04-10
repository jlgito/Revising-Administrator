rem "mecaniqme de savuegatde" 
cd C:\Répertoire
FOR %%f IN (*.doc *.txt) DO XCOPY C:\Répertoire"%%f" C:\Back-up-Répertoire\Textes /m /y
FOR %%f IN (*.jpg *.png *.bmp) DO XCOPY C:\Répertoire "%%f" C:\Back-up-Répertoire\Images /m /y
