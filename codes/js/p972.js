const N = 12;
const pts = [];

for(let x=-N; x<=N; x++)
for(let y=-N; y<=N; y++)
    if(x*x+y*y < N*N)
        pts.push([x,y]);

let T = 0;

for(let i=0;i<pts.length;i++){
    const [x1,y1] = pts[i];
    const r1 = x1*x1+y1*y1;
    for(let j=0;j<pts.length;j++){
        if(i===j) continue;
        const [x2,y2]=pts[j];
        const r2 = x2*x2+y2*y2;
        for(let k=0;k<pts.length;k++){
            if(i===k || j===k) continue;
            const [x3,y3]=pts[k];
            const r3 = x3*x3+y3*y3;

            const det = x1*(y2*r3-y3*r2)
                       - y1*(x2*r3-x3*r2)
                       + r1*(x2*y3-x3*y2);
            if(det===0) T++;
        }
    }
}

console.log(T);
