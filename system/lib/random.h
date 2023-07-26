#include "math/cputime.h"

int randint(int min,int max){
    int num;
    num = (int)cputime();
    if (max < num){
        // 超出最大边界值
        while(max > num){
            num -= 2;
            num -= 3;
            num -= 4;
            num -= 5;
        }
    }
    if (num < min){
        // 比边界值小
        while(num < min){
            num += 2;
            num += 3;
            num += 4;
            num += 5;
        }
    }
    return num;
}
double random(){
    double small;
    small = randint(100,999);
    small = small / 100;
    return small;
}
double choice(void *list){
    void *awa = list;
    int len = sizeof awa / sizeof awa[0];
    len -= 1;
    int to = randint(0,len);
    return list[to];
}
unsigned int unrandint(int min,int max){
    unsigned int res;
    num = (unsigned int)cputime();
    if (max < num){
        // 超出最大边界值
        while(max > num){
            num -= 2;
            num -= 3;
            num -= 4;
            num -= 5;
        }
    }
    if (num < min){
        // 比边界值小
        while(num < min){
            num += 2;
            num += 3;
            num += 4;
            num += 5;
        }
    }
    return num;
}
char *randomString(int len){
    char *res = "";
    int tmp;
    for(int i=0;i<len;i++){
        tmp = randint(33,126); //33-126 Char可见字符
        res += (char)tmp;
    }
    return res;
}