using System;
using System.Collections.Generic;

class Program {
    static void Main() {
        int N = 12;
        List<(int,int)> pts = new List<(int,int)>();

        for(int x=-N; x<=N; x++)
        for(int y=-N; y<=N; y++)
            if(x*x+y*y < N*N)
                pts.Add((x,y));

        long T = 0;

        for(int i=0;i<pts.Count;i++){
            var (x1,y1) = pts[i];
            long r1=x1*x1+y1*y1;
            for(int j=0;j<pts.Count;j++){
                if(i==j) continue;
                var (x2,y2)=pts[j];
                long r2=x2*x2+y2*y2;
                for(int k=0;k<pts.Count;k++){
                    if(i==k||j==k) continue;
                    var (x3,y3)=pts[k];
                    long r3=x3*x3+y3*y3;

                    long det = x1*(y2*r3-y3*r2)
                              - y1*(x2*r3-x3*r2)
                              + r1*(x2*y3-x3*y2);

                    if(det==0) T++;
                }
            }
        }
        Console.WriteLine(T);
    }
}
