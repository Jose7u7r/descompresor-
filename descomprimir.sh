#!/bin/bash


ctrl_c ()
{
  echo -e "\n\n[!] Saliendo... \n"
  exit 1
}

#Ctrl+c 
trap ctrl_c INT

first_data_name="123"
descompresor_Primer_archivo="$(7z l 123 | tail -n 3 | head -n 1 | awk NF'{print $NF}' )"

7z x $first_data_name &>/dev/null

while [ $descompresor_Primer_archivo ]; do 
echo -e "\n[+] nuevo archivo descomprido: $descompresor_Primer_archivo"
7z x $descompresor_Primer_archivo &>/dev/null
descompresor_Primer_archivo="$(7z l $descompresor_Primer_archivo 2>/dev/null | tail -n 3 | head -n 1 | awk NF'{print $NF}')" 
done
