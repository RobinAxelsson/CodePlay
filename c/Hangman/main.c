#include <stdio.h>

int main() {
    printf("Welcome to hangman!\n");

    char secret[] = "apa";
    int secretLength = (sizeof(secret) / sizeof(char));
    char guesses[secretLength], guess;
    for (int i = 0; i < secretLength - 1; ++i) {
        guesses[i] = '_';
    }

    int true = 1;
    while(true){
        printf("\nGuess a character: ");
        scanf("%c", &guess);
        getchar();

        for (int i = 0; i < secretLength - 1; ++i) {
            if(secret[i] == guess){
                guesses[i] = guess;
            }
        }

        for (int i = 0; i < secretLength-1; ++i) {
            printf("%c", guesses[i]);
        }

        for (int i = 0; i < secretLength-1; ++i) {
            if(guesses[i] == '_')
                break;

            if(i == (secretLength-2)){
                printf("\nGood play, you won!");
                getchar();
                true = 0;
            }
        }
    }

    return 0;
}

