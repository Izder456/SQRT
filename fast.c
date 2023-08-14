#include <stdlib.h>
#include <time.h>

float Q_rsqrt( float number ) {
    long i;
    float x2, y;
    const float threehalfs = 1.5F;

    x2 = number * 0.5F;
    y = number;
    i = * ( long * ) &y;
    i = 0x5f3759df - ( i >> 1 );
    y = * ( float * ) &i;
    y = y * ( threehalfs - ( x2 * y * y ) );
    return y;
}

int main () {
    int i;
    float res;
    for ( i = 0; i < 1000000; i++) {
        srand(time(NULL));
        float r = rand() % 8192;
        res = Q_rsqrt(r);
    };
    return 0;
}
