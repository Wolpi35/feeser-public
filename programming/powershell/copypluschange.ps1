###################################################
#                                                 #
#        Bilder verschieben und umbenennen        ##                                                 #
#    Version        0.1                           #
#    Autor          Stefan Feeser                 #
#    Datum          09.02.2016                    #
#    Aenderungen    09.02.2016     Ersterstellung #
#                                                 #
###################################################
$str_srcpfad = "D:\Multimedia\Grafik\Wildkameras\Temp\"
$str_zielpfad ="D:\Multimedia\Grafik\Wildkameras\Hemsbach\"
$arr_datlist = Get-ChildItem -Path $str_srcpfad *.JPG
$int_lauf = 1
ForEach( $str_item in $arr_datlist )
{
# hier muss ich noch pruefen wenn sich das Datum aendert und dann die laufvariable zurueck auf 1 setzen
$str_aenddat = '{0:yyyyMMdd}' -f $str_item.lastwritetime
   if ($str_aenddat -ne $str_lastdat)
   {
      $int_lauf = 1   
   }
$str_datname = "hemsbach" +"_" + $str_aenddat + "_" + '{0:000}' -f $int_lauf + $str_item.extension
"$str_item wird in $str_datname umbenannt und nach $str_zielpfad kopiert"
$str_zieldat = $str_zielpfad + $str_datname
"$str_zieldat"
$int_lauf = $int_lauf + 1
$str_lastdat = $str_aenddat
Copy-Item $str_item.fullname -Destination $str_zieldat
}