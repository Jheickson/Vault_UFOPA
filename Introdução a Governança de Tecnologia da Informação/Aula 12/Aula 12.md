# Aula 12

* Não houve aula presencial devido ao problema no fornecimento de energia no campus Tapajós


## Atividade

Construa um esboço do Plano de Continuidade de Negócios de uma empresa varejista, sendo a maior parte das vendas em cartão de crédito.

1 - leia o caso "o pior roubo de dados da história"

1.1 disponível na página 224, livro Sistemas de Informação Gerenciais, autores Laudon & Laudon, 2010, editora Pearson.

1.2 disponível em parte no TCC de Raissa, anexo nesta.

2 - Identifique os riscos (aceitos e mitigados) que foram aceitos no caso das empresas vítimas do "pior roubo...";

3 - Descreva os possíveis papéis na hierarquia corporativa daquelas empresa vítimas;

4 - Identifique os objetivos e restrições olvidados pelas empresas vítimas;

5 - Destaque o Objetivo de Ponto de Retorno (RPO) no seu plano de continuidade;

6 - Destaque o Objetivo de Tempo de Retorno (RTO) no seu plano de continuidade;

7 - Siga os passos PREPARAR, PLANEJAR,  FAZER (link do artigo disponível na aula de 17 set. 2024).


## Resposta

Riscos aceitos e mitigados: No "Pior roubo de dados da história", várias vulnerabilidades foram exploradas, destacando-se a falta de mitigação adequada. A TJX, por exemplo, não atualizou sua criptografia e utilizava um sistema WEP frágil, um risco aceito pela empresa. Outro risco aceito foi a ausência de firewall adequado em diversos sistemas, deixando os dados expostos a ataques de sniffers. A mitigação seria a adoção do WPA e a criptografia dos dados, que a empresa negligenciou​.

Papéis na hierarquia corporativa: A estrutura organizacional dessas empresas vítimas inclui um conselho estratégico (CEO e CFO), responsáveis pela direção e decisões de alto nível. Abaixo deles, o CIO e o CISO supervisionam a gestão técnica e a implementação de políticas de segurança. A camada operacional, composta por gerentes e técnicos de TI, é responsável por garantir a execução das práticas de segurança de acordo com as diretrizes da alta gestão.

Objetivos e restrições olvidados: Entre os principais objetivos olvidados está a proteção adequada dos dados sensíveis dos clientes. A TJX, por exemplo, manteve dados de clientes por muito mais tempo que o permitido, violando as regras do setor. A empresa não considerou a restrição de armazenar dados de maneira segura por períodos limitados, o que abriu brechas para ataques​.

RPO (Objetivo de Ponto de Retorno): O RPO determina o quanto de dados a empresa pode perder antes de comprometer suas operações. No plano de continuidade, deve-se garantir que os dados de transações e históricos de clientes sejam recuperáveis em um curto intervalo, evitando prejuízos significativos.

RTO (Objetivo de Tempo de Retorno): O RTO especifica o tempo necessário para restaurar operações após uma interrupção. Em um cenário de roubo de dados, a empresa deve planejar um tempo de recuperação de no máximo algumas horas, evitando impacto severo nas vendas e na confiança dos consumidores.

Passos para um Plano de Continuidade de Negócios:

Preparar: Definir ativos críticos, como sistemas de pagamento por cartão e a rede de comunicações.
Planejar: Implementar criptografia e monitoramento em tempo real. Estabelecer backups diários para garantir que dados não sejam perdidos além do RPO estabelecido.
Fazer: Testar regularmente os backups e a resiliência dos sistemas contra ataques, treinando a equipe para responder a incidentes.