#include <IE.au3>


;
; AutoIt Version: 3.0
; Author:         Tom Paolillo
;
; Script Function:
;   Retrieve patch notes data for specific champions
;

$championName = $CmdLine[1]

FileDelete("\documents\school\mqp\raw_patch_note_files\ " & $championName & "_patch_notes_raw.txt")

$oIE = _IECreate ()

_IENavigate ($oIE, "http://leagueoflegends.wikia.com/wiki/" & $championName & "/Background")
_IELoadWait($oIE)
$pageText = _IEBodyReadText($oIE)

FileWrite("\documents\school\mqp\raw_patch_note_files\ " & $championName & "_patch_notes_raw.txt", $pageText)

_IEQuit($oIE)
