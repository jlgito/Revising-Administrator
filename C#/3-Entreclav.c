#include <stdio.h>
int main()
{ char nom[20], prenom[20], ville[25] ; 
    printf("Quelles est votre ville: ");
    gets(ville);
    printf("Donnez votre nom et votre prénom : ");
    scanf("%s %s", nom , prenom);
    printf("Bonjour cher %s %s qui habite à ", prenom , nom);
    puts(ville);
}
