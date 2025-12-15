fun main() {
    val N = 12
    val pts = mutableListOf<Pair<Int,Int>>()

    for(x in -N..N)
        for(y in -N..N)
            if(x*x+y*y < N*N)
                pts.add(Pair(x,y))

    var T: Long = 0

    for(i in pts.indices){
        val (x1,y1) = pts[i]
        val r1 = x1*x1+y1*y1
        for(j in pts.indices){
            if(i==j) continue
            val (x2,y2) = pts[j]
            val r2 = x2*x2+y2*y2
            for(k in pts.indices){
                if(i==k || j==k) continue
                val (x3,y3) = pts[k]
                val r3 = x3*x3+y3*y3

                val det = x1*(y2*r3-y3*r2)
                         - y1*(x2*r3-x3*r2)
                         + r1*(x2*y3-x3*y2)
                if(det == 0L) T++
            }
        }
    }
    println(T)
}
