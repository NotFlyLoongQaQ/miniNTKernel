#include <stdc++.h>
#include <net/net.h>
#define string char*
namespace std{
    const char endl = "\n";
    class printr{
        public:
            const printr& operator<<(const int integer) const{
                printf("%d\n",integer);
                return *this;
            }
            const printr& operator<<(const char *s) const{
                printf("%s\n",s);
                return *this;
            }
    }
    namespace net{
        struct http{
            int code;
            char *text;
        }
        void openNetwork(){
            startNetwork()
            return;
        }
        void closeNetwork(){
            stopNetwork();
            return;
        }
        char *fhttp(char *gmethod,char *URL,char *body,char *fromIP){
            http reslut;
            char* rawReslut;
            if(gmethod == "GET"){
                // method GET
                rawReslut = httpGet(URL)
                http.code = int(rawReslut[0] + rawReslut[1] + rawReslut[2]);
                http.text = rawReslut.c_str();
            }else if (gmethod == "POST")
            {
                // method POST
                rawReslut = httpPost(URL)
                http.code = int(rawReslut[0] + rawReslut[1] + rawReslut[2]);
                http.text = rawReslut.c_str();
            }
        }        
    }
}