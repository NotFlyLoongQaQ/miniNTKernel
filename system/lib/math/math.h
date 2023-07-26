#define PI 3.14
double pow(double num1,int num2){
    double res = 1;
    for(int i=0;i<num2;i++){
        res *= num1;
    }
    return num1;
}
double sqrt(double num){
    double x = num;
    double y = 1;
    double precision = 0.0000001;  // 设定精度

    while (x - y > precision) {
        x = (x + y) / 2;
        y = num / x;
    }

    return x;
}
double abs(double num){
    double tmp;
    tmp = num;
    if(tmp < 0){
        for(int i=0;i<2;i++){
            tmp += (0 - tmp);
        }
    }else{
        tmp = tmp;
    }
    return tmp;
}
int celi(double num){
    double tmp;
    tmp = num;
    if((int)tmp != tmp){
        tmp += 1;
    }else{
        tmp = tmp;
    }
    return tmp;
}
int floor(double num){
    int tmp;
    tmp = num;
    return tmp;
}
int round(double num) {
    if (num == 0){
        // 特殊处理
        return 0;
    }
    int floored = (int)num; 
    double decimal = num - floored;

    if (decimal >= 0.5) {
        return floored + 1;
    } else {
        return floored;
    }
}

