fn main() {
    let n = 12;
    let mut pts = Vec::new();

    for x in -n..=n {
        for y in -n..=n {
            if x*x + y*y < n*n {
                pts.push((x, y));
            }
        }
    }

    let mut t: i64 = 0;

    for i in 0..pts.len() {
        let (x1, y1) = pts[i];
        let r1 = (x1*x1 + y1*y1) as i64;

        for j in 0..pts.len() {
            if i == j { continue; }

            let (x2, y2) = pts[j];
            let r2 = (x2*x2 + y2*y2) as i64;

            for k in 0..pts.len() {
                if k == i || k == j { continue; }

                let (x3, y3) = pts[k];
                let r3 = (x3*x3 + y3*y3) as i64;

                let det =
                    x1 as i64 * (y2 as i64 * r3 - y3 as i64 * r2)
                  - y1 as i64 * (x2 as i64 * r3 - x3 as i64 * r2)
                  + r1 * (x2 as i64 * y3 as i64 - x3 as i64 * y2 as i64);

                if det == 0 { t += 1; }
            }
        }
    }

    println!("{}", t);
}
