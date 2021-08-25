data = [(0,0), (1,1), (2,4)]

b_coeffs = [1.0,2.0]

alpha = 0.001
delta = 0.1

function funt(x, coeffs) 
    return coeffs[1] + x * coeffs[2]
end

function calc_rss(coeffs) 
    rss = 0.0
    for data_point in data 
        rss += (data_point[2] - funt(data_point[1], coeffs)) ^ 2
    end
    return rss
end

function calc_gradient() 
    gradient = []
    for coeff_id in 1:2 
        parts = []
        for sign in [1,-1] 
            copy_coeff = copy(b_coeffs)
            copy_coeff[coeff_id] += sign * delta
            push!(parts, calc_rss(copy_coeff))
        end
        push!(gradient, (parts[1]-parts[2])/(2*delta))
    end
    return gradient
end
            
global total_time = 0

for __ in 1:10 
    current_time = time_ns()
    for _ in 1:2
        gradient = calc_gradient()
        for coeff_id in 1:2 
            b_coeffs[coeff_id] -= alpha * gradient[coeff_id]
        end
    end
    global total_time += time_ns() - current_time
end

println(total_time/10^10)