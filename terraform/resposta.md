#Etapas desenvolvidas para resolução do desafio
1. analise da proposta e separação dos criteiros necessários e extras
2. crianção de projeto em meistertask(alternativa ao trello) para acompanhar o progresso da tarefa
3. foi criado 7 tarefas necessarias para conclusão da tarefa, cada uma delas correspondente a um requisito
4. escolha das ferramentas e dos recursos a serem utlizados, OS = centos 7, editor = vscode, provedor = aws
5. configuração do ambiente de trabalho vscode para trabalhar com arquivos terrafom
6. configuração de github e git local
7. Foi montado a estrura de pastas para a proposta de ambiente de produção
8. criação do arquivo main.tf responsavel por criar a instancia em aws - cumpriu requisito
9. modificação do arquivo main.tf para comunicar em seu output o ip publico da instancia criada - cumpriu requisit
10. modificação do main.tf para aceitar dois input definidos como, range ip de acesso ssh e região desejada -cumpriu requisito
11. criação de arquivo variables.tf, arquivo responsavel por gerenciar variavel que podem ser substituidas.
12. problema encontrado: variação do parametro AMI no resource aws_instance
13. problema identificado: o valor AMI varia de acordo com a região desejada.
14. possiveis soluções: mapear ami das regiões disponiveis, encontrar forma de realizar busca de ami dinamicamente de acordo com a região selecionada 
15. problema solucionado: adição de resource data_ami ao variables.tf, recurso responsavel por localizar ami correspondente - problema encontrado solucionado
16. refatoração e checagem de seguração - as credencias foram movidas para terraform.tfvas e adicionado o .gitignore para evitar exposição das mesmas
17. criação de vpc.tf, arquivo responsavel pelas politicas de acesso a instancia
18. modificação do vpc.tf para especificar somente as portas 80 e 443 para acesso publico - cumpriu requisito
19. arquivo vpc.tf convertido para modulo security_group - cumpriu requisito extra
20. nodificação do modulo security_group para acesso ssh 
21. problema encontrado: diversas configuração são mostração necessarias
22. problema identificado: é necessario a configuração dos seguintes recursos, aws_route_table, aws_internet_gatetway, aws_subnet, aws_vpc, aws_route_table_association.
23. problema solucionada: definição de cidr padrão para vpc e correção na formatação de cidr da subnet
24. configuração dos recursos listados
25. refatoração variaveis e criação do arqquvio variables.tf para gerenciar variaveis no modulo
26. refatoração de resource para resource de definiação default para evitar futuros erros
27. criação de chaves encriptadas publicas e privadas
28. problema enconntrato: falha na conexão ssh (timeout)
29. problema analisado: configuração de cidr errada e input indevido
30. problema solucionado: acesso ssh de range ip definido bem sucedido - cumpriu requisito
31. analise images disponives de servidor apache
32. escolha motivada pela estabilidade e suporte, imagem selecionada: bitnami/apache:2.4-debian-9
33. problema encontrado: durante a conexão atraves do remote exec para provisonamento de apache encontrou-se erros com a utilização da atual chave id_rsa
34. problema analisado: a chave estava protegida com senha
35. problema solucionado: criação de uma nova chave para o desafio sem senha
36. execução de container apache em uma instancia aws atraves de terraform - cumpriu requisito extra

## tempo total para execução de todas as etapas: 08:50
