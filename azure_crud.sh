#! /usr/bin/bash

echo "started CRUD "
az login --service-principal -u 97f1a626-1227-42c5-95bd-7cd5aeff5159 -p 4JH8Q~4MQA6I2vPjc3nwmXXM-b61bO9egWqFtdiS --tenant 41dc1c0c-fa35-47de-a6fc-0feb03c776d2
az group create  -l eastus -n crudgroup
az group create  -l eastus -n demorgrg

az vm create -n crudvm --resource-group crudgroup --image Win2019Datacenter --admin-username vikas --admin-password ********* --generate-ssh-keys

az appservice plan create -g crudgroup -n crudapp --sku F1

az group update -n crudgroup --tags tag1=1 

az vm update -n crudvm --resource-group demorgrg

az appservice plan update -n crudapp -g crudgroup --sku F1

az appservice plan delete --name crudapp --resource-group crudgroup --yes

az vm delete --resource-group crudgroup --name crudvm --yes

az group delete --name crudgroup --yes

az group delete --name demorgrg --yes


echo "done!!!"
