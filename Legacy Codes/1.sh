echo -n "masukkan satuan menit : ";
read menit;
if [ $menit -ge 1400 ]
then
let hari=$menit/1400;
let menit=$menit-$hari*1400;
echo"$hari hari"
fi
if [ $menit -ge 60 ]
then
let jam=$menit/60;
let menit=$menit-$jam*60;
echo "$jam jam"
fi


echo "$menit menit";
echo 
