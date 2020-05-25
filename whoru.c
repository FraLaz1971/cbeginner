#include <stdio.h>
int main()
{
    char me[20];
    printf("What is your name? ");
    scanf("%20s",me);
    printf("Glad to meet you, %s!\n",me);
}
