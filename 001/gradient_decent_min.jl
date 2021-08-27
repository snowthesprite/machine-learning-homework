point = [1.0,2.0]

function funct(x,y) 
    return 1 + 2 * x^2 + 3 * y^2
end

delta = 0.1
alpha = 0.001

function compute_gradient() 
    gradient = []
    for index in 1:2 
        new_points = []
        new_points_2 = []
        for point_index in 1:2 
            if point_index == index 
                push!(new_points,(point[index] + delta))
                push!(new_points_2, (point[index] - delta))
            else 
                push!(new_points, point[index])
                push!(new_points_2, point[index])
            end
        end
        gradient_part = (funct(new_points[1], new_points[2]) - funct(new_points_2[1], new_points_2[2]))/ (2 * delta)
        push!(gradient, gradient_part)
    end
    return gradient
end

global total_time = 0

for time in 1:10 
    current_time = time_ns()
    for _ in 1:2
        gradient = compute_gradient()
        for index in 1:2 
            point[index] = point[index] - alpha * gradient[index]
        end
        if time == 1
            println(point)
        end
    end
    global total_time += time_ns() - current_time
end

println(total_time/10^10)