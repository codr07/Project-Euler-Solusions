#include <stdio.h>
#include <math.h>
#include <complex.h>

complex double lambertw_branch(complex double z, int k, int maxit, double tol) {
    double r = cabs(z);
    double theta = carg(z);
    complex double w = log(r) + I*(theta + 2*M_PI*k);

    for (int i=0; i<maxit; i++) {
        complex double ew = cexp(w);
        complex double f  = w*ew - z;
        complex double fp = ew*(w+1.0);
        complex double dw = f/fp;
        complex double w_new = w - dw;
        if (cabs(dw) < tol*(1.0 + cabs(w_new))) return w_new;
        w = w_new;
    }
    return w;
}

char* first_non6(int N, int answer_len, int block_len) {
    static char out[1024];

    complex double z = -exp(-1.0);
    complex double w1 = lambertw_branch(z, 1, 100, 1e-15);
    complex double rho = 1.0 + w1;
    complex double Dp  = 1.0 - cexp(-rho);

    double re = creal(rho);
    double im = cimag(rho);
    double ln10 = log(10.0);

    double log10_eps = (re*N + log(2.0 / cabs(Dp))) / ln10;
    int K0 = (int)floor(-log10_eps);
    int J = K0 + block_len/2;

    double real_a = re*N + J*ln10;
    double imag_a = im*N;
    complex double expa = cexp(real_a + I*imag_a);
    double delta = 2.0 * creal(expa / Dp);

    long long B = floor(2.0/3.0 + delta);
    long long M = pow(10LL, block_len);
    long long S = (M - 1) * 2 / 3;
    long long D = (S + B) % M;

    char buf[2048];
    sprintf(buf, "%0*lld", block_len, D);

    int p=0;
    for (int i=0; i<block_len && p<answer_len; i++) {
        if (buf[i] != '6') out[p++] = buf[i];
    }
    out[p] = '\0';
    return out;
}

int main() {
    printf("%s\n", first_non6(1000000, 8, 128));
}
