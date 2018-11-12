#Etapas envolvidas para resolução do desafio-k8s
1. Analise da proposta e separação dos criteiros necessários e extras
2. Crianção de projeto em meistertask(alternativa ao trello) para acompanhar o progresso da tarefa
3. Foi criado 10 tarefas necessarias para conclusão da tarefa, cada uma delas correspondente a um requisito
4. Configuração do ambiente de trabalho vs_code, adicionado extensões kubenentee e kuberentes suporte
5. Analise da melhor maneira de proceder para executar o desafio.
6. Maneira escolida criação manual dos arquivos deployment.yaml service.yaml ingress.yaml
7. Problema encontrado: construção da imagem docker
8. Problema analisado: a ferramenta minikube possue um registro de images separado devido sua natureza de maquina virtual logo uma build no local de desenvolvimento não afetaria
9. Problema solucionado: realizar a build dentro da maquina virtual do minikube e definir politicas de pull para Never - cumpriu requisito 
10. Observação: situação não ideal, alternativa mais segura e consistennte é utilização de ferramentas de terceiros para a etapa da build como kaniko ou se utilizar dos repositorios de registro, melhor auternativa disponivel utilização do quay.io
11. Levantamento da tarefa utilzilar helm e impactos nos progressos
12. Para utilização devida dos recursos helm foi utilizado o scaffold para evitar instabilidades - cumpriu requisito
13. Foram configurados os arquivos yaml para o comportamento desejado utilizando-se da aplicação e dockerfile fornecidos - cumpriu requisito
14. Devido a complexidade do projeto não se viu utilidade aplicar diversos namespace, teria como conseguencia esforço desnecessário e causaria impactos no desempenho da aplicação - requisito abandonado
15. criação de script (run.sh) para automatizar as etapas anteriores, build, helm, exposição da aplicação para as porta mapeada 8081- cumpriu requisito
16. confirmação de deploy executado em apenas um linha de comando - cumpriu requisito.

## tempo total para execução de todas as etapas: 03:00

#requisitos para execução
1. minikube
2. helm instalado

#etapas para reprodução
1. minikube start
2. helm init
3. sh run.sh (dentro do diretorio kubernetes do repositorio)
