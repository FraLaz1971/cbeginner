#include <stdio.h>
/* what happen if you put a name with size longer than 20 characters? */
int main()
{
    char me[20];
    printf("What is your name? ");
    scanf("%s",&me);
    printf("Darn glad to meet you, %s!\n",me);
}
