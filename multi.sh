#!/bin/bash

# Baca akun dan proxy dari file
accounts=("user1@gmail.com" "user2@gmail.com" "user3@gmail.com")
passwords=("password1" "password2" "password3")
proxies=($(cat proxies.txt))  # Membaca proxy dari file proxies.txt

# Loop melalui semua kombinasi akun dan proxy
for i in ${!accounts[@]}; do
  for j in ${!proxies[@]}; do
    # Menjalankan kontainer dengan akun dan proxy yang sesuai
    echo "Starting container for ${accounts[$i]} with proxy ${proxies[$j]}"

    docker run -d \
      -e APP_USER="${accounts[$i]}" \
      -e APP_PASS="${passwords[$i]}" \
      -e PROXY="${proxies[$j]}" \
      -v ./proxies.txt:/app/proxies.txt \
      overtrue/gradient-bot
  done
done
