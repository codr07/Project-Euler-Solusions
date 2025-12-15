#include <bits/stdc++.h>
using namespace std;

int main() {
    int N = 12;
    vector<pair<int,int>> pts;
    for(int x=-N; x<=N; x++)
        for(int y=-N; y<=N; y++)
            if(x*x+y*y < N*N)
                pts.emplace_back(x,y);

    long long T = 0;
    int S = pts.size();

    for(int i=0;i<S;i++){
        auto [x1,y1]=pts[i];
        long long r1=x1*x1+y1*y1;
        for(int j=0;j<S;j++){
            if(i==j) continue;
            auto [x2,y2]=pts[j];
            long long r2=x2*x2+y2*y2;
            for(int k=0;k<S;k++){
                if(i==k||j==k) continue;
                auto [x3,y3]=pts[k];
                long long r3=x3*x3+y3*y3;

                long long det =
                    x1*(y2*r3-y3*r2) -
                    y1*(x2*r3-x3*r2) +
                    r1*(x2*y3-x3*y2);

                if(det==0) T++;
            }
        }
    }
    cout << T << endl;
}
