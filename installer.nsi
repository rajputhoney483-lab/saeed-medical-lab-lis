; Saeed Medical Lab LIS installer
Unicode True
RequestExecutionLevel admin
Name "Saeed Medical Lab LIS"
Caption "Saeed Medical Lab LIS Setup"
OutFile "Saeed_Medical_Lab_LIS_Setup.exe"
InstallDir "$PROGRAMFILES64\Saeed Medical Lab LIS"
InstallDirRegKey HKLM "Software\Saeed Medical Lab LIS" "InstallDir"
SetCompressor /SOLID lzma

!include "MUI2.nsh"
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\box-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\box-uninstall.ico"

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!define MUI_FINISHPAGE_RUN "$INSTDIR\Saeed Medical Lab LIS.exe"
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_LANGUAGE "English"

Section "Main"
  SetOutPath "$INSTDIR"
  File "dist\Saeed Medical Lab LIS.exe"

  CreateDirectory "$SMPROGRAMS\Saeed Medical Lab LIS"
  CreateShortcut "$SMPROGRAMS\Saeed Medical Lab LIS\Saeed Medical Lab LIS.lnk" "$INSTDIR\Saeed Medical Lab LIS.exe"
  CreateShortcut "$DESKTOP\Saeed Medical Lab LIS.lnk" "$INSTDIR\Saeed Medical Lab LIS.exe"

  WriteRegStr HKLM "Software\Saeed Medical Lab LIS" "InstallDir" "$INSTDIR"
  WriteUninstaller "$INSTDIR\Uninstall.exe"

  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Saeed Medical Lab LIS" "DisplayName" "Saeed Medical Lab LIS"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Saeed Medical Lab LIS" "UninstallString" "$INSTDIR\Uninstall.exe"
SectionEnd

Section "Uninstall"
  Delete "$DESKTOP\Saeed Medical Lab LIS.lnk"
  Delete "$SMPROGRAMS\Saeed Medical Lab LIS\Saeed Medical Lab LIS.lnk"
  RMDir "$SMPROGRAMS\Saeed Medical Lab LIS"
  Delete "$INSTDIR\Saeed Medical Lab LIS.exe"
  Delete "$INSTDIR\Uninstall.exe"
  RMDir "$INSTDIR"
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Saeed Medical Lab LIS"
  DeleteRegKey HKLM "Software\Saeed Medical Lab LIS"
SectionEnd
