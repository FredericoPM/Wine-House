# Wine house
  Wine house é um aplicativo de cadastro e gerência de vinhos voltado para aqueles que tem uma coleção extensa de garrafas. O aplicativo permite ao usuário cadastrar, pesquisar,  editar e excluir (CRUD) vinhos além de também permitir o cadastro de vários vinhos de uma vez só por meio de um arquivo csv e gerar um pdf com um cardápio dos vinhos cadastrados no app (essas duas funcionalidades ainda estão sendo implementadas). Todas essas funcionalidades atuam em conjunto a um design minimalista e simples proporcionando uma experiência agradável e sem maiores dificuldades para o usuário.

## CRUD
  O app permite o cadastro de diversas características sobre o vinho incluindo nome, safra, país, região, tipo, nota de alguns sommeliers (W.S. e R.P.), idade aconselhada para se beber (Beber R.P.), quantidade em estoque e as etiquetas presentes na garrafa. A pesquisa de vinhos no app foi feita utilizando o método de casamento de padrões de distância de Levenshtein, funcionando da seguinte forma se a distância (quantidade de caracteres que devem ser trocados para que uma palavra vire a outra) entre duas as palavras, a pesquisada e a desejada, fossem pequenas o vinho também é exibido, assim permitindo ao usuário inserir um nome parecido com desejado ou que ele cometa alguns erros ao digitar e ainda ache o que deseja.
  
## Adição de múltiplos vinhos
  O aplicativo permitirá que o usuário insira um arquivo csv com vários vinhos para que o usuário possa cadastrá-los todos de uma vez. O arquivo segue o formato de uma coluna para cada dado seguindo a mesma ordem dos campos que aparecem no aplicativo.
  
## Criação do cardápio
  O aplicativo permite ao usuário gerar um pdf com um cardápio dos seus vinhos. O pdf é separado primeiramente por pais e depois por região e no fim de cada região apresenta o total de vinhos daquela região.
  
|V1|V2|
| --- | --- |
| ![sample V1](https://i.imgur.com/iZU94aZ.gif) | ![sample V2](https://i.imgur.com/2c8aNbY.gif) |
