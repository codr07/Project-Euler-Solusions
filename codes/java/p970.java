import org.apache.commons.math3.complex.Complex;

public class Main {
    static Complex lambertW(Complex z, int k) {
        double r = z.abs();
        double t = z.getArgument();
        Complex w = new Complex(Math.log(r), t + 2*Math.PI*k);

        for(int i=0;i<100;i++) {
            Complex ew = w.exp();
            Complex f  = w.multiply(ew).subtract(z);
            Complex fp = ew.multiply(w.add(1));
            Complex dw = f.divide(fp);
            w = w.subtract(dw);
        }
        return w;
    }
}
