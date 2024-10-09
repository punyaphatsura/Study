#include <stdio.h>

/* Prototype function */
void myfunction(int i);
char *p;

int main() {
    printf("&main = %0.16p\n", &main);
    printf("&myfunction = %0.16p\n", &myfunction);
    printf("&&retaddr = %0.16p\n", &&retaddr);

    myfunction(12);

retaddr:
    printf("... end\n");

    return 0;
}

void myfunction(int i) {
    char buf[20] = "0123456789012345678";
    printf("&i = %0.16p\n", &i);
    printf("sizeof(pointer) is %d\n", (int)sizeof(p));
    printf("&buf[0] = %0.16p\n", buf);

    for (p = ((char *) &i) + 64; p > buf; p--) {
        printf("%0.16p: 0x%0.2x\t", p, *(unsigned char *) p);
        if (!((unsigned int)p % 4)) {
            printf("\n");
        }
    }

    printf("\n");
}
