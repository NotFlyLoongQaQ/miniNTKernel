void systemCall(char *code){
    char *tmp = code;
    if (tmp == "1"){
        clear();
    }else if (tmp == "2")
    {
        io_hlt();
    }
    return;
}