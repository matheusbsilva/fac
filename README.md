## Linguagem de montagem MIPS

- A CPU MIPS contém 32 registradores, enumerados de 0 a 31. O registrador n é designado por $n.

- Para MIPS, uma word tem 32 bits ou 4 bytes.

- Registradores armazenam 32 bits.

- Somente as intruções `load` e `store` têm acesso à memória

- As intruções da ULA **operam somente com valores em registradores**

### Estrutura básica de um programa

- `.text`: área do programa(instruções) em si;

- `.data`: área para declarações de variáveis estáticas;

- `.globl`: declaração para rótuloes globais.

**obs**: áreas independentes da ordem, montador é responsável pela colocação

### Boas práticas

- O registrador $0($zero) contém sempre o valor 0(hardwired)

- Os registradores $1($at), $26($k0) e $27($k1) são reservados para uso do montador e sistema operacional

- Os registradores $2 e $3 ($v0, $v1) são utilizados para retornar valores de funções 

- Os registradores $4...$7($a0...$a3) são utilizados para passagem dos primeiros quatro argumentos para sub-programas/funções (os argumentos restantes são passados através da pilha)

- Os registradores $8...$15, $24, $25($t0...$t9) não são preservados pelo calle. Ou seja, convenientemente usado para receber dados temporários que não necessitam ser preservados durante as chamadas de funções/sub-rotinas.

- Os registradores $16..$24($s0...$s7) são callee-saved para dados que necessitam ser preservados durante as chamadas. Ou seja, o caller tem a garantia de que esses registradores não serão alterados entre chamadas de outras rotinas. (variáveis locais)

**obs**: Callee = Função ou subrotina chamada pelo Caller.

- O registrador $28($gp) é um ponteiro global que aponta para o meio de um bloco de memória de 64k, no segmento de dados estáticos.

- O registrador $29($sp) é o ponteiro de pilha, apontando sempre para o primeiro elemento da pilha.

- O registrador $30($fp) é o ponteiro de frame. Pode ser utilizado como registrador callee-saved $s8.

- O registrador $31($ra) armazena o endereço de retorno quando é executada a instrução jal(jump to subroutine label)
