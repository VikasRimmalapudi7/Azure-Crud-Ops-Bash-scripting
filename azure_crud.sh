#! /usr/bin/bash

echo "started CRUD "
az group create  -l eastus -n crudgroup
az group create  -l eastus -n demorgrg

az vm create -n crudvm --resource-group crudgroup --image Win2019Datacenter --admin-username vikas --admin-password Vikas@1379375 --generate-ssh-keys

az appservice plan create -g crudgroup -n crudapp --sku F1

az group update -n crudgroup --tags tag1=1 

az vm update -n crudvm --resource-group demorgrg

az appservice plan update -n crudapp -g crudgroup --sku F1

az appservice plan delete --name crudapp --resource-group crudgroup --yes

az vm delete --resource-group crudgroup --name crudvm --yes

az group delete --name crudgroup --yes

az group delete --name demorgrg --yes


echo "done!!!"