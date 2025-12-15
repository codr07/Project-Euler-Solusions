using System;
using System.Numerics;
using System.Text;

class Program {
    static Complex LambertW(Complex z, int k, int maxit=100, double tol=1e-15) {
        double r = z.Magnitude;
        double theta = Math.Atan2(z.Imaginary, z.Real);
        Complex w = Math.Log(r) + Complex.ImaginaryOne*(theta + 2*Math.PI*k);

        for (int i=0;i<maxit;i++) {
            Complex ew = Complex.Exp(w);
            Complex f  = w*ew - z;
            Complex fp = ew*(w + 1);
            Complex dw = f/fp;
            Complex wn = w - dw;
            if (dw.Magnitude < tol*(1 + wn.Magnitude)) return wn;
            w = wn;
        }
        return w;
    }

    static string FirstNon6(long N, int ansLen=8, int blockLen=128) {
        Complex z = -Math.Exp(-1.0);
        Complex w1 = LambertW(z,1);
        Complex rho = 1 + w1;
        Complex Dp  = 1 - Complex.Exp(-rho);

        double re = rho.Real, im = rho.Imaginary;
        double ln10 = Math.Log(10);

        double log10eps = (re*N + Math.Log(2.0/Dp.Magnitude)) / ln10;
        long K0 = (long)Math.Floor(-log10eps);
        long J  = K0 + blockLen/2;

        Complex expa = Complex.Exp(re*N + J*ln10 + Complex.ImaginaryOne*(im*N));
        double delta = 2.0*(expa/Dp).Real;

        long B = (long)Math.Floor(2.0/3.0 + delta);
        long M = (long)Math.Pow(10, blockLen);
        long S = (M-1)*2/3;
        long D = (S+B)%M;

        string s = D.ToString().PadLeft(blockLen,'0');
        StringBuilder sb = new StringBuilder();
        foreach(char c in s) {
            if(c!='6') sb.Append(c);
            if(sb.Length==ansLen) break;
        }
        return sb.ToString();
    }

    static void Main() {
        Console.WriteLine(FirstNon6(1000000));
    }
}
