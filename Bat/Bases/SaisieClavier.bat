echo off
set /P Nom="Comment t'appelles-tu ? "
echo Bonjour %Nom%
set /p Age="Quel age as-tu ? "
set /a reste=65-Age
echo Encore %reste% ans de turbin avant la retraite!
