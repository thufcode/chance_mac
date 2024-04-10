O script CHANGE MAC é uma ferramenta de linha de comando projetada para alterar o endereço MAC (Media Access Control) de uma interface de rede em sistemas Linux. O script lista as interfaces de rede disponíveis, permite ao usuário selecionar uma interface pelo número e altera o endereço MAC da interface selecionada para um valor aleatório que começa com 02. Este script pode ser usado para aumentar a privacidade e a segurança ao se conectar a redes públicas, testar políticas de segurança de rede, ou simplesmente para fins de diagnóstico e teste.

Sistema operacional Linux com o utilitário ip instalado (disponível na maioria das distribuições Linux modernas).
Privilégios de superusuário (sudo) para alterar configurações de rede.

Como Usar

Executar o Script: Navegue até o diretório onde o script CHANGE MAC está salvo. Dê permissão de execução ao script (se necessário) com o comando chmod +x mac.sh, substituindo mac.sh pelo nome do seu arquivo de script. Em seguida, execute o script com ./mac.sh.

Selecionar a Interface de Rede:
Após a execução, o script exibirá uma lista numerada de todas as interfaces de rede disponíveis, excluindo a interface de loopback lo.
Insira o número correspondente à interface que você deseja modificar e pressione Enter.

Confirmação e Alteração:
O script capturará e exibirá o endereço MAC atual da interface selecionada.
Então, desativará temporariamente a interface, aplicará um novo endereço MAC aleatório e reativará a interface.
Um novo endereço MAC, começando com 02, será gerado aleatoriamente e aplicado à interface escolhida.
O script exibirá o endereço MAC original e o novo para fins de diagnóstico.

Verificação:
Após a reativação da interface, o script aguardará 2 segundos e, em seguida, exibirá o estado atual da interface para confirmar a mudança do endereço MAC.
