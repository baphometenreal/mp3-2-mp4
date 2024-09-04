@echo OFF
TITLE mp3 2 mp4

:conversion
cls
echo where is the mp3 bark
set /p mp3=
echo where is the album cover bark
set /p album=
echo where do you want the file bark
set /p mp4=
echo what do you want the file to be called bark
set /p filename=
ffmpeg -r 1 -loop 1 -y -i "%album%" -i "%mp3%" -c:a copy -r 1 -vcodec libx264 -s 1080*1080 -shortest "%mp4%\%filename%.mp4"

echo done bark bark!
choice /C 12 /m "would you like to convert another bark? 1=y 2=n"

:option-1
goto conversion

:option-2
exit /B