#!/bin/bash -e

set +e

# Variáveis que serão utilizadas de acordo com o servidor

ambiente=production
diretorio=/home/office/production

# Limpa todos os logs que são adicionados no volume de cada container

$diretorio/./clear.sh

# Limpa todas os logs de requests e datas, deixando apenas logs da microsoft e errors para podermos detectar caso necessite

rm $diretorio/instation-auth-api/logs/$ambiente.request.*
rm $diretorio/instation-auth-api/logs/$ambiente.20*
rm $diretorio/instation-api/logs/$ambiente.request.*
rm $diretorio/instation-api/logs/$ambiente.20*
rm $diretorio/instation-cluster-api/logs/$ambiente.request.*
rm $diretorio/instation-cluster-api/logs/$ambiente.20*
rm $diretorio/instation-setting-api/logs/$ambiente.request.*
rm $diretorio/instation-setting-api/logs/$ambiente.20*
rm $diretorio/instation-notification-api/logs/$ambiente.request.*
rm $diretorio/instation-notification-api/logs/$ambiente.20*
rm $diretorio/instation-user-api/logs/$ambiente.request.*
rm $diretorio/instation-user-api/logs/$ambiente.20*
rm $diretorio/instation-metrics-logs-api/logs/$ambiente.request.*
rm $diretorio/instation-metrics-logs-api/logs/$ambiente.20*
rm $diretorio/instation-streaming-api/logs/$ambiente.request.*
rm $diretorio/instation-streaming-api/logs/$ambiente.20*
rm $diretorio/instation-channel-api/logs/$ambiente.request.*
rm $diretorio/instation-channel-api/logs/$ambiente.20*
rm $diretorio/instation-admin-api/logs/$ambiente.request.*
rm $diretorio/instation-admin-api/logs/$ambiente.20*
rm $diretorio/instation-room-status-api/logs/$ambiente.request.*
rm $diretorio/instation-room-status-api/logs/$ambiente.20*
rm $diretorio/instation-room-status-api/logs/$ambiente.microsoft.*
rm $diretorio/instation-room-status-api/logs/$ambiente.queue.*

# Limpa todas as imagens que estão com none

docker rmi -f $(docker images -f "dangling=true" -q)

set -e
