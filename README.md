# neo2-layout-windows-ahk

Dies ist ein Extrakt von github.com/neo-layout/neo-layout/tree/master/windows/neo-vars

Worum geht es hier:

- [x] Neubau von neo20.exe mit einem aktuellen Autohotkey Compiler
- [x] "Einbrennen" des Bildschirm-Tastatur Fonts
- [ ] Hilfe mit sinnvollen Informationen
- [x] Font von GitHub nehmen
- [x] Rechte Strg-Taste als zusätzlichen Mod4 Umschalter aktivieren
- [x] Bildschirmtastatur - Fix fuer Skalierung ; Ticket #390 und #530

## VKDCSC029 Problem

Die Fehlermeldung "VKDCSC029" kommt daher, das das HotKey Kommando nur noch VK (ohne SC) akzeptiert.

Fix fuer VKDCSC029 Problem in keydefinitions.ahk vorgenommen.

neo20-all.ahk laesst sich jetzt mit aktuellem AHK 1.1.32 als Script oder kompiliert nutzen.

## Wie nutzen

Repository clonen oder als ZIP herunterladen und entpacken.

Autohotkey installieren - 32/64 bit scheint momentan keinen Unterschied zu machen.

Im Windows File-Explorer das Kontextmenü zu neo20-all.ahk öffnen.

- Run Script
- Compile

Fehlen die Einträge im Kontextmenü wurde Authotkey nicht richtig installiert.

Mit Compile kann man eine neo20-all.exe erstellen. Dieser Exe fehlt dann allerdings gegenüber der Version 
von neo-layout.org das eingebrannte Icon.

Dies kann über die Kommandozeile gemacht werden:

<code>
"c:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in neo20-all.ahk /out neo20.exe /icon neo_enabled.ico
<code>

Pfad zur Ahk2Exe.exe kann abweichen. Bei der Choco Installation sollte er stimmen.

## neo2.ini

    [Global]
    isQwertz=1
    RControlAsM4=1
    NeoDebug=0

Die initalize.ahk kennt zwei neu Optionen in neo2.ini.

- RControlAsM4 damit kann die rechte Ctrl Taste als zusätzlicher M4 Umschalter genutzt werden
- NeoDebug     sendet Debug Ausgaben an DebugView

Jeweils mit 0/1 ein- und abschaltbar

## Citrix AltGr Problem

Bei Eingabe von AltGr+v werden auf einem lokalen Windows folgende Tastatur-Events generiert:

    A2  01D	 	d	LControl
    A5  138	 	d	RAlt
    56  02F	 	d	v
    56  02F	 	u	v
    A2  01D	 	u	LControl
    A5  138	 	u	RAlt

In einer entfernten Citrix Session werden folgende Tastatur-Events genereriert:

    A2  01D	 	d	LControl
    A5  138	 	d	RAlt
    56  02F	 	d	v
    56  02F	 	u	v
    A2  01D	 	u	LControl
    A2  01D	 	u	LControl
    A5  138	 	u	RAlt

Es wird ein zusätzliches LControl up generiert.

https://kb.vmware.com/s/article/1022454

Die AHK Neo Scripte sind für Control transparent, d.h. die Events werden gar nicht mittels Hotkey Definition(en) verarbeitet.



## Authotkey installieren

Am einfachsten, wenn man https://chocolatey.org nutzt:

    choco install autohotkey -y

## Debugging

Um zu sehen, was in den AHK Scripten passiert, könnte man MsgBox nutzen.
Das ist zum Debuggen eines Tastatur-Treibers aber nicht wirklich komfortabel.

Besser ist die Nutzung der OutPutDebug Funktion von AHK.

Die Nachrichten können dann mit DebugView von Sysinternals angezeigt werden.

DebugView kann zb. von Microsoft, für die PorableApps Platform oder auch über Chocolatey bezogen werden:

    choco install dbgview -y

Für Mapping-Probleme bietet sich eine Modifikation der varsfunctions.ahk an.

Nutzt man die Neo2 Scripte mittels direkter Ausführung über "Run Script",
gelangt man über das Kontextmenü des AHK Interpreters ( in der Taskleiste ggf. versteckt) zu dem Punkt "Öffnen".
Im AHK Fenster kann man sich unter "View -> Key history and script info" die von AHK erkannten Tasten-Events anzeigen lassen.











