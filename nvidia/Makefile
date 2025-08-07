.SILENT:

CONFIG_FILE := Brewfile

install:
	# Disable Nvidia Telemetry
	reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\NvTelemetryContainer.exe" /v Debugger /t REG_SZ /d "%windir%\System32\taskkill.exe" /f

extract:
