@ECHO OFF

REM get which version from the cmd
%1

IF "%1"=="" (
	cd C:\Users\%USERNAME%\Downloads

	echo Deleting old LATEST files/folders in ~/Downloads
	if exist C:\Users\%USERNAME%\Downloads\valheim_plus_latest.zip del "C:\Users\%USERNAME%\Downloads\valheim_plus_latest.zip" >nul 2>&1
	if exist C:\Users\%USERNAME%\Downloads\valheim_plus_latest\ rmdir /s /q C:\Users\%USERNAME%\Downloads\valheim_plus_latest 2>nul

	echo Downloading LATEST zip
	REM bitsadmin /transfer myDownloadJob /download /priority high https://github.com/valheimPlus/ValheimPlus/releases/download/%1/WindowsClient.zip C:\Users\%USERNAME%\Downloads\valheim_plus_windows_client_%1.zip
	"C:\Windows\System32\curl.exe" -o C:\Users\%USERNAME%\Downloads\valheim_plus_latest.zip -O -L https://github.com/ValheimPlus/ValheimPlus/releases/latest/download/WindowsClient.zip

	echo Extracting files
	"C:\Program Files\PeaZip\peazip.exe" -ext2folder C:\Users\%USERNAME%\Downloads\valheim_plus_latest.zip

	echo Copying files
	xcopy /E /Y  "C:\Users\%USERNAME%\Downloads\valheim_plus_latest" "C:\Program Files (x86)\Steam\steamapps\common\Valheim\"

	echo Update Complete!!
	pause

) ELSE (

	cd C:\Users\%USERNAME%\Downloads

	REM delete old files if they exist
	echo Deleting old %1 files/folders in ~/Downloads
	if exist C:\Users\%USERNAME%\Downloads\valheim_plus_windows_client_%1.zip del "C:\Users\%USERNAME%\Downloads\valheim_plus_windows_client_%1.zip" >nul 2>&1
	if exist C:\Users\%USERNAME%\Downloads\valheim_plus_windows_client_%1\ rmdir /s /q C:\Users\%USERNAME%\Downloads\valheim_plus_windows_client_%1 2>nul

	echo Downloading zip
	REM bitsadmin /transfer myDownloadJob /download /priority high https://github.com/valheimPlus/ValheimPlus/releases/download/%1/WindowsClient.zip C:\Users\%USERNAME%\Downloads\valheim_plus_windows_client_%1.zip
	"C:\Windows\System32\curl.exe" -o C:\Users\%USERNAME%\Downloads\valheim_plus_windows_client_%1.zip -O -L https://github.com/valheimPlus/ValheimPlus/releases/download/%1/WindowsClient.zip

	echo Extracting files
	"C:\Program Files\PeaZip\peazip.exe" -ext2folder C:\Users\%USERNAME%\Downloads\valheim_plus_windows_client_%1.zip

	echo Copying files
	xcopy /E /Y  "C:\Users\%USERNAME%\Downloads\valheim_plus_windows_client_%1" "C:\Program Files (x86)\Steam\steamapps\common\Valheim\"

	echo Update Complete!!

)