# arhiLAZAR_infra
arhiLAZAR Infra repository

## Домашнее задание №6
- Добавлены манифесты терраформа, описание переменных и пример tfvars

####Задание со *
Terraform добавляет инстансу только ssh-ключи, указанные в манифесте. Ключи, добавленные в веб-интерфейсе, игнорируются. 

## Домашнее задание №5
- Добавлено два шаблона packer: ubuntu16.json и immutable.json
- Добавлен скрипт create-redditvm.sh
- Добавлен systemd-unit для puma

## Домашнее задание №4
testapp_IP = 35.228.240.95
testapp_port = 9292

####Создание ВМ с указанием startup-script из файла:

    gcloud compute instances create reddit-app\
      --boot-disk-size=10GB \
      --image-family ubuntu-1604-lts \
      --image-project=ubuntu-os-cloud \
      --machine-type=g1-small \
      --tags puma-server \
      --restart-on-failure \
      --metadata-from-file startup-script=startup_script.sh

####Создание ВМ с указанием startup-script по url (из google cloud):

    gcloud compute instances create reddit-app\
      --boot-disk-size=10GB \
      --image-family ubuntu-1604-lts \
      --image-project=ubuntu-os-cloud \
      --machine-type=g1-small \
      --tags puma-server \
      --restart-on-failure \
      --metadata startup-script-url=gs://laz-startup-scripts/startup_script.sh

####Создание правила фаервола:

    gcloud compute firewall-rules create puma-server --allow tcp:9292 --direction IN --target-tags puma-server


## Домашнее задание №3
bastion_IP = 35.228.240.95
someinternalhost_IP = 10.166.0.3

####Подключение в одну команду к **omeinternalhost**:

    ssh -J appuser@35.228.240.95 appuser@10.166.0.3

####Пример ssh_config для подключения командой "_ssh someinternalhost_":

    Host bastion
        HostName 35.228.240.95
        User appuser
        Port 22

    Host someinternalhost
        User appuser
        Port 22
        ProxyCommand bash -c 'exec ssh -W 10.166.0.3:22 bastion'
