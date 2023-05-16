#include <stdio.h>

int main() {
    printf("Welcome to hangman!\n");

    char secret[] = "apa";
    int secretLength = (sizeof(secret) / sizeof(char));
    char guesses[secretLength], guess;
    for (int i = 0; i < secretLength; ++i) {
        guesses[i] = '_';
    }
    guesses[secretLength-1] = 0;

    while(1){
        printf("\nGuess a character: ");
        scanf("%c", &guess);
        getchar();

        for (int i = 0; i < secretLength - 1; ++i) {
            if(secret[i] == guess){
                guesses[i] = guess;
            }
        }

        printf("%s", guesses);

        for (int i = 0; i < secretLength; ++i) {
            if(guesses[i] == '\000'){
                printf("\nGood play, you won!");
                getchar();
                return 0;
            }
            if(guesses[i] == '_'){
                break;
            }
        }
    }
}

