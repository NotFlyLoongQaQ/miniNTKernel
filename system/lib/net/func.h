#include <driver/func.h>

char *getIP();
char *httpGet(char*url);
char *httpPost(char*url,char*body);
char *socket(char*IP,char*Package);

int startNetwork(char *ip="",bool DHCP);
int stopNetwork();