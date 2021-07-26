#include <stdio.h>

int main() {
  float nota1, nota2, media;  
  scanf("%f", &nota1);
    
  scanf("%f", &nota2);

  media = (nota1 + nota2) / 2;

  if(media >= 7) {
    printf("Aprovado");
  } else {
    printf("Reprovado");
  }
}