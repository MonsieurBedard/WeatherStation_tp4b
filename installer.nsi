NAME "Weather Station"

OutFile "installer.exe"

RequestExecutionLevel user

Unicode true

InstallDir "$PROFILE\1837062"

; Pages

Page components
Page directory
Page instfiles

UninstPage uninstConfirm
UninstPage instfiles

Section "Required"

    SectionIn RO

    SetOutPath $INSTDIR

    FILE "installer.nsi"
    FILE "icon.ico"
    FILE "app\*"

    WriteUninstaller "$INSTDIR\uninstall.exe"

SectionEnd

Section "Shortcuts"

    CreateDirectory "$SMPROGRAMS\1837062"
    CreateShortcut "$SMPROGRAMS\1837062\WeatherApp.lnk" "$INSTDIR\WeatherApp.exe" "" "$INSTDIR\icon.ico" 0
    CreateShortcut "$SMPROGRAMS\1837062\Uninstall.lnk" "$INSTDIR\uninstall.exe"

    CreateShortcut "$DESKTOP\WeatherApp 1837062.lnk" "$INSTDIR\WeatherApp.exe" "" "$INSTDIR\icon.ico" 0

SectionEnd

Section "Uninstall"

    ; Remove files and uninstaller
    Delete "$INSTDIR\*"
    RMDir "$INSTDIR"

    ; Remove shortcuts, if any
    Delete "$SMPROGRAMS\1837062\*"
    RMDir "$SMPROGRAMS\1837062"

    Delete "$DESKTOP\WeatherApp 1837062.lnk"


SectionEnd