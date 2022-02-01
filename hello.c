#include <stdio.h>

int main(int argc, char *argv[])
{
  printf("C: Hello!: ");
  int counter;
  for (counter = 0; counter < argc; counter++)
    printf(" %s", argv[counter]);
  printf("\n");
  return 0;
}