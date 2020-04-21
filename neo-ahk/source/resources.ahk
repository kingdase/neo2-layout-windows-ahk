; -*- encoding: utf-8 -*-

EnvGet, WindowsEnvTempFolder, TEMP
ResourceFolder = %WindowsEnvTempFolder%\Neo2
FileCreateDir, %ResourceFolder%

if (FileExist("ResourceFolder")<>false) {
  FileInstall,ebene0.png,%ResourceFolder%\ebene0.png,1 
  FileInstall,neo_enabled.ico,%ResourceFolder%\neo_enabled.ico,1
  FileInstall,neo_disabled.ico,%ResourceFolder%\neo_disabled.ico,1
  FileInstall,DejaVuSans-Bold.ttf,%ResourceFolder%\DejaVuSans-Bold.ttf,1
}

