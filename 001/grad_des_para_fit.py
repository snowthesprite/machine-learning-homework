import time

data = [(0,0), (1,1), (2,4)]

b_coeffs = [1,2]

alpha = 0.001
delta = 0.1

def funt(x, coeffs) :
    return coeffs[0] + x * coeffs[1]

def calc_rss(coeffs) :
    rss = 0
    for data_point in data :
        rss += (data_point[1] - funt(data_point[0], coeffs)) ** 2
    return rss

def calc_gradient() :
    gradient = []
    for coeff_id in range(2) :
        parts = []
        for sign in [1,-1] :
            copy_coeff = b_coeffs.copy()
            copy_coeff[coeff_id] += sign * delta
            parts.append(calc_rss(copy_coeff))
        gradient.append((parts[0]-parts[1])/(2*delta))
    return gradient
            
total_time = 0
for __ in range(10) :
    start_time = time.time()
    for _ in range(2) :
        gradient = calc_gradient()
        for coeff_id in range(2) :
            b_coeffs[coeff_id] -= alpha * gradient[coeff_id]
        if __ == 1 :
            print(b_coeffs)
    total_time += time.time() - start_time

print(total_time/10)