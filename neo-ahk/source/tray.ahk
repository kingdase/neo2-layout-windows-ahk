﻿; -*- encoding: utf-8 -*-

TrayAktivieren() {
  global
  menu,tray,icon,%ResourceFolder%\neo_enabled.ico,,1
  menu,tray,nostandard
  menu,tray,add,Öffnen,open
    menu,helpmenu,add,About,about
    menu,helpmenu,add,Autohotkey-Hilfe,help
    menu,helpmenu,add
    menu,helpmenu,add,http://autohotkey.com/,autohotkey
    menu,helpmenu,add,http://www.neo-layout.org/,neo
    menu,helpmenu,add,https://gitea.neo.uber.space/neo/neo-layout/,gitea
  menu,tray,add,Hilfe,:helpmenu
  menu,tray,add
  menu,tray,add,%disable%,togglesuspend
  menu,tray,add
  menu,tray,add,Bearbeiten,edit
  menu,tray,add,Neu Laden,reload
  menu,tray,add
  menu,tray,add,Nicht im Systray anzeigen,hide
  menu,tray,add,%name% beenden, exitprogram
  menu,tray,default,%disable%
  menu,tray,tip,%name%

  IniRead,startSuspended,%ini%,Global,startSuspended
  if (startSuspended == 1)
    Traytogglesuspend()
  return

help:
  Run, %A_WinDir%\hh mk:@MSITStore:autohotkey.chm
return

togglesuspend:
  Traytogglesuspend()
return

about:
  TrayAbout()
return

neo:
  run http://neo-layout.org/
return

autohotkey:
  run http://autohotkey.com/
return

gitea:
  run https://gitea.neo.uber.space/neo/neo-layout/
return

open:
  ListLines ; shows the Autohotkey window
return

edit:
  edit
return

reload:
  Reload
return

hide:
  menu, tray, noicon
return

exitprogram:
  SetOldLockStates()
  exitapp
return

}

Traytogglesuspend() {
  global
  if A_IsSuspended {
    menu, tray, rename, %enable%, %disable%
    menu, tray, tip, %name%
    menu, tray, icon, %ResourceFolder%\neo_enabled.ico,,1
    SetNEOLockStates()
    suspend, off ; Schaltet Suspend aus -> NEO
  } else {
    menu, tray, rename, %disable%, %enable%
    menu, tray, tip, %name% : Deaktiviert
    menu, tray, icon, %ResourceFolder%\neo_disabled.ico,,1
    SetOldLockStates()
    suspend, on  ; Schaltet Suspend ein -> QWERTZ
  }
}

TrayAbout() {
  global
  msgbox, 64, %name%  Ergonomische Tastaturbelegung,
  (
  %name%`n
  Das Neo-Layout ersetzt das übliche deutsche
  Tastaturlayout mit der Alternative Neo,
  beschrieben auf http://neo-layout.org/.`n
  Dazu sind keine Administratorrechte nötig.`n
  Wenn Autohotkey aktiviert ist, werden alle Tastendrucke
  abgefangen und statt dessen eine Übersetzung weitergeschickt.`n
  Dies geschieht transparent für den Anwender,
  es muss nichts installiert werden.`n
  Die Zeichenübersetzung kann leicht über das Icon im
  Systemtray deaktiviert werden.`n
  HotKeys:`n
  M4 + F1: Bildschirmtastatur anzeigen/ausblenden
  M3 + F6: Wechsel zwischen Neo und QWERTZ
  M4 + F6: Speichere Layout
  )
}

TrayAktivieren()
