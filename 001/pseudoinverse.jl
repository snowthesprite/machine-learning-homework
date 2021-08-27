global total_time = 0

function transative_matrix(matrix) 
    t_matrix = [[],[]]
    for row in matrix 
        push!(t_matrix[1], row[1])
        push!(t_matrix[2], row[2])
    end
    return t_matrix
end

function inverse_matrix(matrix)
    coeff = 1 / (matrix[1][1] * matrix[2][2] - matrix[1][2] * matrix[2][1])
    return [[coeff*matrix[2][2], -coeff*matrix[2][1]], [-coeff*matrix[1][2], coeff*matrix[1][1]]]
end

function multiply_matrix(matrix_1, matrix_2)
    new_elements = [[] for _ in 1:length(matrix_1)]
    for rows in 1:length(matrix_1)
        for matrix_column in 1:length(matrix_2[1])
            end_number = 0
            for column in 1:length(matrix_1[1])
                end_number += matrix_1[rows][column] * matrix_2[column][matrix_column]
            end
            push!(new_elements[rows], end_number)
        end
    end
    return new_elements  
end

y = [[0],[1],[4],[9]]
coeffs = [[0,1],[1,1],[2,1],[3,1]]

for _ in 1:10
    current_time = time_ns()
    trans_coeffs = transative_matrix(coeffs)
    square_coeffs = multiply_matrix(trans_coeffs,coeffs)
    inverse_coeffs = inverse_matrix(square_coeffs)
    finished_y = multiply_matrix(trans_coeffs,y)
    finished_y = multiply_matrix(inverse_coeffs, finished_y)
    global total_time += time_ns() - current_time
    println(finished_y)
end

println(total_time/10^10)
