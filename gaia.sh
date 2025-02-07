#!/bin/bash  

# Fungsi untuk menginstall Gaianet Node  
install_gaianet_node() {  
    echo "Memulai instalasi Gaianet Node..."  
    curl -sSfL 'https://github.com/GaiaNet-AI/gaianet-node/releases/latest/download/install.sh' | bash  
    source /root/.bashrc  
    gaianet init --config https://raw.githubusercontent.com/GaiaNet-AI/node-configs/main/qwen-1.5-0.5b-chat/config.json  
    gaianet config --domain gaia.domains  
    gaianet start  
    echo "Instalasi selesai!"  
}  

# Fungsi untuk menampilkan log Gaianet  
show_gaianet_log() {  
    echo "Menampilkan log Gaianet..."  
    gaianet info  
}  

# Menu utama  
while true; do  
    echo "========================="  
    echo " Menu Gaianet Node"  
    echo "========================="  
    echo "1. Install Gaianet Node"  
    echo "2. Tampilkan Log Gaianet"  
    echo "3. Keluar"  
    echo "========================="  
    read -p "Pilih opsi (1-3): " choice  

    # Validasi input  
    if [[ -z "$choice" || ! "$choice" =~ ^[1-3]$ ]]; then  
        echo "Pilihan tidak valid. Silakan coba lagi."  
        continue  
    fi  

    case $choice in  
        1)   
            read -p "Apakah Anda yakin ingin menginstall Gaianet Node? (y/n): " confirm  
            if [[ $confirm == "y" || $confirm == "Y" ]]; then  
                install_gaianet_node  
            else  
                echo "Instalasi dibatalkan."  
            fi  
            ;;  
        2)   
            read -p "Apakah Anda yakin ingin menampilkan log Gaianet? (y/n): " confirm  
            if [[ $confirm == "y" || $confirm == "Y" ]]; then  
                show_gaianet_log  
            else  
                echo "Menampilkan log dibatalkan."  
            fi  
            ;;  
        3)   
            read -p "Apakah Anda yakin ingin keluar? (y/n): " confirm  
            if [[ $confirm == "y" || $confirm == "Y" ]]; then  
                echo "Keluar dari program."  
                break  
            else  
                echo "Keluar dibatalkan."  
            fi  
            ;;  
    esac  
done  
