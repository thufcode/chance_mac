#!/bin/bash

VERDE='\033[0;32m'
NC='\033[0m' # No Color
python -c "import pyfiglet; print('\033[0;32m' + pyfiglet.figlet_format('CHANGE  MAC') + '\033[0m')"

echo "Interfaces de rede disponíveis:"
interfaces=$(ip -o link show | awk -F': ' '{if ($2 != "lo") print $2}' | nl -v 1)
echo "$interfaces"

echo "Por favor, escolha o número da interface de rede que deseja modificar:"
read choice

num_interfaces=$(echo "$interfaces" | wc -l)

if ! [[ $choice =~ ^[0-9]+$ ]] || [ "$choice" -lt 1 ] || [ "$choice" -gt "$num_interfaces" ]; then
    echo "Opção inválida. Finalizando o script."
    exit 1
fi

INTERFACE=$(echo "$interfaces" | sed -n "${choice}p" | awk '{print $2}')
echo "Você escolheu a interface: $INTERFACE"

MAC_ORIGINAL=$(ip link show $INTERFACE | awk '/ether/ {print $2}')
if [ -z "$MAC_ORIGINAL" ]; then
    echo "Não foi possível capturar o endereço MAC original da interface $INTERFACE."
    exit 1
fi
sudo ip link set dev $INTERFACE down || { echo "Falha ao desativar a interface $INTERFACE."; exit 1; }

MAC_NOVO=$(printf '02:%02x:%02x:%02x:%02x:%02x' $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)))

echo "Alterando o endereço MAC de $INTERFACE de $MAC_ORIGINAL para $MAC_NOVO"

sudo ip link set dev $INTERFACE address $MAC_NOVO || { echo "Falha ao aplicar o novo endereço MAC à interface $INTERFACE."; exit 1; }

sudo ip link set dev $INTERFACE up || { echo "Falha ao reativar a interface $INTERFACE."; exit 1; }

sleep 2

ip link show $INTERFACE || { echo "Falha ao exibir o estado atual da interface $INTERFACE."; exit 1; }
