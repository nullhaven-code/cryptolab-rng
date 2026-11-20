
#include <stdio.h>
#include <stdint.h>

#define M 2147483647LL
#define A 48271LL
#define C 12345LL

int64_t lcg_next(int64_t x) {
    return (A * x + C) % M;
}

int main(void) {
    int64_t x = 123456789;

    for (int i = 0; i < 10; i++) {
        x = lcg_next(x);
        printf("%lld\n", (long long)x);
    }

    return 0;
}
