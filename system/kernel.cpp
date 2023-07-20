#define True 1
#define False 0
#include "lib/io.h"
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
void main(){
    printf("Hello World!");
}
