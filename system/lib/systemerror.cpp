#include "stdc++.h"
typedef void (*constructor)();
constructor start_ctors;
constructor end_ctors;

void callConstructors()
{
    for (constructor *i = &start_ctors; i != &end_ctors; i++)
    {
        (*i)();
    }
}
void breakdown(char* code,char* because){
    clear()
    for(int i=0;i<12;i++){
        printf('-');
    }
    printf("Oh,no!\n");
    printf("Your computer has failed and now you can't operate it, \n restarting your computer may help.");
    printf("Error Code:" + code);
    printf("\n");
    printf(because);
    while(True){
        io_hlt()
    }
}