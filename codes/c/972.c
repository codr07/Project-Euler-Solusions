//Problem 972 
//Copyright (c) 2011-2024 by Sankha Saha

typedef struct {
    int x, y; // rational numerator
} Pt;

int inside(int x, int y) {
    return x*x + y*y < 12*12;
}

int main() {
    int N = 12;
    Pt pts[20000];
    int count = 0;

    for(int x=-N; x<=N; x++)
        for(int y=-N; y<=N; y++)
            if(inside(x,y))
                pts[count++] = (Pt){x,y};

    long long T = 0;
    for(int i=0;i<count;i++){
        for(int j=0;j<count;j++){
            if(i==j) continue;
            for(int k=0;k<count;k++){
                if(i==k || j==k) continue;

                long long x1=pts[i].x, y1=pts[i].y;
                long long x2=pts[j].x, y2=pts[j].y;
                long long x3=pts[k].x, y3=pts[k].y;

                long long det = x1*(y2*(x3*x3+y3*y3)-y3*(x2*x2+y2*y2))
                              - y1*(x2*(x3*x3+y3*y3)-x3*(x2*x2+y2*y2))
                              + (x1*x1+y1*y1)*(x2*y3-x3*y2);

                if(det==0) T++;
            }
        }
    }
    printf("%lld\n",T);
}
