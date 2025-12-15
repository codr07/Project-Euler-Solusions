using LinearAlgebra

function lambertw_branch(z, k; maxit=100, tol=1e-15)
    r = abs(z)
    θ = angle(z)
    w = log(r) + im*(θ + 2π*k)
    for i in 1:maxit
        ew = exp(w)
        dw = (w*ew - z)/(ew*(w+1))
        w -= dw
        abs(dw) < tol*(1+abs(w)) && return w
    end
    w
end
