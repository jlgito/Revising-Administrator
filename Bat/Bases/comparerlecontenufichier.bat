for /f "delims=" %%i in ('type "fichier.txt" ^|findstr /i /r "jul"') do echo %%i
