@echo OFF
TITLE mp32mp4

:conversion
cls
echo where is the mp3? bark
set /p mp3=
echo where is the album cover? bark
set /p album=
echo where do you want the file? bark
set /p mp4=
echo what do you want the file to be called? bark
set /p filename=
echo what resolution do you want the video to be? bark
set /p res=
choice /C:12 /m "is the album cover you selected a gif? bark 1=y 2=n"

:ONE
ffmpeg -stream_loop -1 -i "%album%" -i "%mp3%" -shortest -c:v libx264 -crf 26 -c:a aac -q:a 4 "%mp4%\%filename%.mp4"
goto done

:TWO
ffmpeg -r 1 -loop 1 -y -i "%album%" -i "%mp3%" -c:a copy -r 1 -vcodec libx264 -s %res%*%res% -shortest "%mp4%\%filename%.mp4"
goto done

:done
echo done bark bark!
choice /C:12 /m "would you like to convert another? bark 1=y 2=n"

:ONE
goto conversion

:TWO
exit /B