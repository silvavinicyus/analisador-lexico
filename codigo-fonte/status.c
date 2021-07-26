#include <stdio.h>

int main() {
  float nota1, nota2, media;  
  scanf('%f', &nota1);
    
  scanf('%f', &nota2);

  media = (nota1 + nota2) / 2;

  if(media >= 7) {
    printf('Aluno aprovado com media %.2f', media);
  } else {
    printf('Aluno reprovado com media %.2f', media);
  }
}