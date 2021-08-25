import time

point = [1,2]

def function(x,y) :
    return 1 + 2 * x**2 + 3 * y**2

delta = 0.1
alpha = 0.001

def compute_gradient() :
    gradient = []
    for index in range(2) :
        new_points = []
        new_points_2 = []
        for point_index in range(2) :
            if point_index == index :
                new_points.append(point[index] + delta)
                new_points_2.append(point[index] - delta)
            else :
                new_points.append(point[index])
                new_points_2.append(point[index])
        gradient_part = (function(*new_points) - function(*new_points_2))/ (2 * delta)
        gradient.append(gradient_part)
    return gradient

total_time = 0
for __ in range(10) :
    start_time = time.time()
    for _ in range(2) :
        gradient = compute_gradient()
        for index in range(len(point)) :
            point[index] = point[index] - alpha * gradient[index]
    total_time += time.time() - start_time

print(total_time/10)