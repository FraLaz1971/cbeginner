#include <stdio.h>
int main()
{
    char me[20]; int age;
    printf("What is your name? ");
    scanf("%20s",me);
    printf("Glad to meet you, %s!\n",me);
    printf("And what's your age? ");
    scanf("%d",&age);
    printf("You're quite young, since you're %i years old!\n",age);
}
