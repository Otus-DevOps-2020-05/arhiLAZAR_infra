# arhiLAZAR_infra
arhiLAZAR Infra repository

## Домашнее задание №3
bastion_IP = 35.228.240.95
someinternalhost_IP = 10.166.0.3

Подключение в одну команду к **omeinternalhost**:

    ssh -J appuser@35.228.240.95 appuser@10.166.0.3

Пример ssh_config для подключения командой "_ssh someinternalhost_":

    Host bastion
        HostName 35.228.240.95
        User appuser
        Port 22

    Host someinternalhost
        User appuser
        Port 22
        ProxyCommand bash -c 'exec ssh -W 10.166.0.3:22 bastion'
