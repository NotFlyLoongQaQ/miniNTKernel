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
}