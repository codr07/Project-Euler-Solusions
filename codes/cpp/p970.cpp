#include <bits/stdc++.h>
using namespace std;

complex<double> lambertw_branch(complex<double> z, int k, int maxit=100, double tol=1e-15) {
    double r = abs(z);
    double theta = arg(z);
    complex<double> w = log(r) + 1i*(theta + 2*M_PI*k);

    for (int i=0; i<maxit; i++) {
        auto ew = exp(w);
        auto f  = w*ew - z;
        auto fp = ew*(w+1.0);
        auto dw = f/fp;
        auto w2 = w - dw;
        if (abs(dw) < tol*(1.0 + abs(w2))) return w2;
        w = w2;
    }
    return w;
}

string first_non6(long long N, int answer_len=8, int block_len=128) {
    complex<double> z = -exp(-1.0);
    auto w1  = lambertw_branch(z, 1);
    auto rho = 1.0 + w1;
    auto Dp  = 1.0 - exp(-rho);

    double re = real(rho);
    double im = imag(rho);

    double ln10 = log(10.0);
    double log10_eps = (re*N + log(2.0/abs(Dp))) / ln10;

    long long K0 = floor(-log10_eps);
    long long J  = K0 + block_len/2;

    double real_a = re*N + J*ln10;
    double imag_a = im*N;

    auto expa = exp(complex<double>(real_a, imag_a));
    double delta = 2.0 * real(expa / Dp);

    long long B = floor(2.0/3.0 + delta);
    long long M = pow(10LL, block_len);
    long long S = (M - 1) * 2 / 3;
    long long D = (S + B) % M;

    string s = to_string(D);
    while (s.size() < block_len) s = "0" + s;

    string out;
    for (char c : s) {
        if (c != '6') out.push_back(c);
        if (out.size() == answer_len) break;
    }
    return out;
}

int main() {
    cout << first_non6(1000000) << endl;
}
