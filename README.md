# analisador-lexico

## Avisos

Para a correta execução do programa é necessário ter o "Flex" instalado.

** Todos os testes e execuções foram performados em ambiente Linux, expecificamente no Ubuntu 20.04 LTS **

## Execução

 * Rodar o comando "flex regras-analisador-lexico.l" 
 * Em seguida rodar o seguinte comando "g++ lex.yy.c -lfl -o analisador-lexico"
 * E por fim, rodar o analisador com o comando "./analisador-lexico codigo-fonte/status.c tokens.lex"

## Resultados

O código tokenizado ficará salvo então no arquivo tokens.lex