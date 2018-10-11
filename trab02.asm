# FAC: TRABALHO 01
	.text
main:
	li $v0, 5	# load appropriate system call code into register $v0;
			# code for reading integer is 5
	syscall		# call operating system to perform operation
	move $a0, $v0	# O PRIMEIRO VALOR LIDO DO TECLADO ESTA DISPONIVEL EM $A0
	li $v0, 5	# load appropriate system call code into register $v0;
			# code for reading integer is 5
	syscall		# call operating system to perform operation
	move $a1, $v0	# O SEGUNDO VALOR LIDO DO TECLADO ESTA DISPONIVEL EM $A1
      
# =================== IMPLEMENTE AQUI SUA SOLUCAO: INICIO

#########  rotina para checar qual o maior dos valores lidos
max_number:
	slt $t1, $a0, $a1 	# checa se primeiro valor lido($a0) é menor que o segundo($a1)
	beq $t1, $zero, else	# caso o primeiro seja maior que o segundo pula para função else
	move $s0, $a1		# carrega o segundo valor lido em $s0
	jal mmc			# chama a rotina mmc

else:
	move $s0, $a0		# carrega o primeiro valor lido em $s0
	jal mmc			# chama a rotina mmc
# =================== Fim da rotina
		
#########  rotina para calcular o mmc	
mmc:
	

# =================== Fim da rotina

	jal max_number # chama rotina para pegar maior valor entre os lidos
	
# =================== IMPLEMENTE AQUI SUA SOLUCAO: FIM      
      
      jal  print            # call print routine. 
      li   $v0, 10          # system call for exit
      syscall               # we are out of here.
		
#########  routine to print messages
      .data
space:		.asciiz  " "          # space
new_line:	.asciiz  "\n"         # newline
string_MDC:	.asciiz  "MDC: "
string_MMC:	.asciiz  "\nMMC: "
      .text
print:	la   $a0, string_MDC  
      	li   $v0, 4		# specify Print String service
      	syscall               	# print heading
      	move   $a0, $t0      	# 
	li   $v0, 1           	# specify Print Integer service
      	syscall               	# print $t0
	la   $a0, string_MMC   	# load address of print heading
      	li   $v0, 4           	# specify Print String service
      	syscall               	# print heading
      	move   $a0, $t1      	# 
	li   $v0, 1           	# specify Print Integer service
      	syscall               	# print $t1
	jr   $ra              	# return