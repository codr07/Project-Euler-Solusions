public class Hyperbolic {

    static int N = 12;

    static boolean inside(int x, int y) {
        return x*x + y*y < N*N;
    }

    public static void main(String[] args) {
        int[][] pts = new int[20000][2];
        int count=0;
        for(int x=-N; x<=N; x++)
            for(int y=-N; y<=N; y++)
                if(inside(x,y)) {
                    pts[count][0]=x;
                    pts[count][1]=y;
                    count++;
                }

        long T = 0;
        for(int i=0;i<count;i++){
            for(int j=0;j<count;j++){
                if(i==j) continue;
                for(int k=0;k<count;k++){
                    if(i==k || j==k) continue;

                    long x1=pts[i][0], y1=pts[i][1];
                    long x2=pts[j][0], y2=pts[j][1];
                    long x3=pts[k][0], y3=pts[k][1];

                    long det = x1*(y2*(x3*x3+y3*y3)-y3*(x2*x2+y2*y2))
                             - y1*(x2*(x3*x3+y3*y3)-x3*(x2*x2+y2*y2))
                             + (x1*x1+y1*y1)*(x2*y3-x3*y2);

                    if(det == 0) T++;
                }
            }
        }
        System.out.println(T);
    }
}
