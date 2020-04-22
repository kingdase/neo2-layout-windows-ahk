# neo2-layout-windows-ahk

Dies ist ein Extrakt von github.com/neo-layout/neo-layout/tree/master/windows/neo-vars

Worum geht es hier:

- [x] Neubau von neo20.exe mit einem aktuellen Autohotkey Compiler
- [x] "Einbrennen" des Bildschirm-Tastatur Fonts
- [ ] Hilfe mit sinnvollen Informationen
- [x] Font von GitHub nehmen
- [x] Rechte Strg-Taste als zusätzlichen Mod4 Umschalter aktivieren

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


## Authotkey installieren

Am einfachsten, wenn man https://chocolatey.org nutzt:

<code>
choco install autohotkey -y
<code>

## Debugging

Um zu sehen, was in den AHK Scripten passiert, könnte man MsgBox nutzen.
Das ist zum Debuggen eines Tastatur-Treibers aber nicht wirklich komfortabel.

Besser ist die Nutzung der OutPutDebug Funktion von AHK.

Die Nachrichten können dann mit DebugView von Sysinternals angezeigt werden.

DebugView kann zb. von Microsoft, für die PorableApps Platform oder auch über Chocolatey bezogen werden:

<code>
choco install dbgview -y
<code>

Für Mapping-Probleme bietet sich eine Modifikation der varsfunctions.ahk an.

Nutzt man die Neo2 Scripte mittels direkter Ausführung über "Run Script",
gelangt man über das Kontextmenü des AHK Interpreters ( in der Taskleiste ggf. versteckt) zu dem Punkt "Öffnen".
Im AHK Fenster kann man sich unter "View -> Key history and script info" die von AHK erkannten Tasten-Events anzeigen lassen.
 










