index_usr=1;
index_mhs=1;
temp_mhs=1;
temp_npm=1;
temp_index=1;
loop=1;
loop1=1;
loop_main=1;
loop_menu=1;
check=0;
max=0;
usr_control=2;

declare -a usr;
declare -a pass;
declare -a namamhs;
declare -a npm;

daftar (){
clear
echo "---------------- DAFTAR ----------------"
let loop=1;												#inisialisasi loop
while [[ $loop -eq 1 ]]; do
  read -p "Masukkan username 	: " temp_usr;			#input username
  let max=$index_usr-1;
  for (( i = 0; i < $index_usr; i++ )); do
    if [[ $temp_usr == ${usr[$i]} ]]; then			#cek apabila username telah terpakai atau belum
      echo "Username sudah digunakan!";
      read
      clear
    elif [[ $i == $max ]]; then
      #statements
      let loop=0;
      break;
    fi
  done
done
let loop=1;												#inisialisasi loop
while [[ $loop -eq 1 ]]; do
  read -sp "Masukkan Password	: " temp_pass1;			#input Password
  let check=0;										#inisialisiasi flag untuk cek password
  let max=$index_usr-1;
  for (( i = 0; i < $index_usr; i++ )); do
    if [[ ${pass[$i]} == $temp_pass1 ]]; then
      echo "password sudah digunakan";
      break;
    elif [[ $i == $max ]]; then
      echo "Sudah Oke!!";
      let check=1;
      break;
    fi
  done											#spacing
  read -sp "Masukkan kembali Password : " temp_pass2;
  if [[ $temp_pass1 == $temp_pass2 ]]; then
    if [[ $check == 0 ]]; then
      echo "Password sudah terdaftar oleh username lain";
    else
      echo "Okeysip"
      usr[$index_usr]=$temp_usr;
      pass[$index_usr]=$temp_pass1;
      change_control $index_usr
      let index_usr=$index_usr+1;
      let loop=0;
    fi

  else
    echo "Password yang anda masukkan tidak sesuai"
  fi

done
}

login(){
	let loop=1;

	while [[ $loop == 1 ]]; do
		clear
		echo "-----------Login--------------"
		read -p "Masukkan username 	: " temp_usr;
		read -sp "Password 		: " temp_pass;
		let max=$index_usr-1;
		echo "$max";
		for (( i = 0; i < $index_usr ; i++ )); do
			if [[ $temp_usr == ${usr[$i]} ]]; then
				if [[ $temp_pass == ${pass[$i]} ]]; then
					clear
					echo "Login Berhasil !!";
					echo "Selamat datang ${usr[$i]}!!";
					let temp_index=$i;
					let loop=0;
					break;
				elif [[ $i == $max ]]; then
					echo "Maaf Password salah!"
					echo "Silakan Login Kembali"
				fi
			elif [[ $i == $max ]]; then
				echo "Maaf username anda tidak terdaftar!!!"
				echo "LOGIN LAGI SANA!!"
			fi
		done
		read
	done
}

DaftarMhs(){
  echo "---------------- PENDAFTARAN MAHASISWA ----------------"
  let loop=1;												#inisialisasi loop
  while [[ $loop -eq 1 ]]; do
    read -p "Masukkan nama mahasiswa 	: " temp_mhs;			#input nama MAHASISWA
    let max=$index_mhs-1;
    for (( i = 0; i < $index_mhs; i++ )); do
      if [[ $temp_mhs == ${namamhs[$i]} ]]; then			#cek apabila Nama sudah digunakan atau belum
        echo "Nama sudah digunakan!";
        read
        clear
      elif [[ $i == $max ]]; then
        let loop=0;
        break;
      fi
    done
      namamhs[$index_mhs]=$temp_mhs;
  done
  let loop=1;												#inisialisasi loop
  while [[ $loop -eq 1 ]]; do
    read -p "Masukkan NPM mahasiswa 	: " temp_npm;			#input nama MAHASISWA
    let max=$index_mhs-1;
    for (( i = 0; i < $index_mhs; i++ )); do
      if [[ $temp_npm == ${npm[$i]} ]]; then			#cek apabila Nama sudah digunakan atau belum
        echo "NPM sudah digunakan oleh Mahasiswa lain!!";
        read
        clear
      elif [[ $i == $max ]]; then
        let loop=0;
        break;
      fi
      let loop=1;
    done
  done
  npm[$index_mhs]=$temp_npm;
  let index_mhs=$index_mhs+1;
}
view(){
	echo "_____________________________"
  echo " NAMA MAHASISWA | NPM MAHASISWA"
	for (( i = 1; i < $index_mhs; i++ )); do
		  echo "----------------------------"
			echo "${namamhs[$i]}	|	${npm[$i]}"

	done
	read
}
menu(){
  loop_menu=1;
	while [[ $loop_menu == 1 ]]; do
		clear
    echo "Sistem Pendaftaran Mahasiswa"
    echo "1. Daftarkan Mahasiswa "
    echo "2. Lihat Mahasiswa terdaftar"
    echo "3. Log Out"
    read temp_case;

    case "$temp_case" in
      "1" )
      DaftarMhs
        ;;
      "2" )
      view
        ;;
      "3" )
      let loop_menu=0
        ;;
    esac
done
}
let loop_main=1;
while [[ $loop_main == 1 ]]; do
	clear
	read -p "apakah anda adalah user terdaftar ? (1. Yes/ 2. No) Press 3 to quit" prep;
  echo ""
	if [[ $prep == 1 ]]; then
		login
		menu
	elif [[ $prep == 2 ]]; then
		daftar
		login
		menu
	elif [[ $prep == 3 ]]; then
		let loop_main=0;
	fi

done
