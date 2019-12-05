Kode Sumber :
clear
declare -a satu
declare -a dua
exit=0

while [ $exit -eq 0 ]
do
    echo "Program Matriks 2X2"
    echo "1. Input pada Matriks (2x2)"
    echo "2. Penjumlahan Matriks"
    echo "3. Perkalian Matriks"
    echo "4. Keluar Program"
    echo -n "Masukan pilihan anda : "
    read pilihan

    if [ $pilihan -eq 1 ]
    then
    clear
    echo "Masukkan Data Matriks 1"

    for ((i=0;i<4;i++))
    do
        echo "Masukkan nilai : "$(( $i+1 ))
        read nilai;
        satu[$i]=$nilai
    done

    echo ""
    echo "Masukkan Data Matriks 2"
    
    for ((i=0;i<4;i++))
    do
        echo "Masukkan nilai :"$(( $i+1 ))
        read nilai;
        dua[$i]=$nilai
    done
    clear

    echo "Matriks Satu"
    echo -e " ${satu[0]} ${satu[1]} \n"
    echo -e " ${satu[2]} ${satu[3]} \n"
echo "Hasil perkalian"
    for ((i=0; i<4; i++))
    do
        echo -n "${matriks[$i]} "
        if [ $i == 1 ]
        then
        echo ""
        fi
    done
    
    unset matriks
    read
    
    elif [ $pilihan -eq 4 ]
    then
    exit=1;
    fi

done
