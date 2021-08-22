def transative_matrix(matrix) :
    t_matrix = [[],[]]
    for row in matrix :
        t_matrix[0].append(row[0])
        t_matrix[1].append(row[1])
    return t_matrix

def inverse_matrix(matrix) :
    coeff = 1 / (matrix[0][0] * matrix[1][1] - matrix[0][1] * matrix[1][0])
    return [[coeff*matrix[1][1], -coeff*matrix[1][0]], [-coeff*matrix[0][1], coeff*matrix[0][0]]]

def multiply_matrix(matrix_1, matrix_2) :
    new_elements = [[] for _ in range(len(matrix_1))]
    for rows in range(len(matrix_1)) :
        for matrix_column in range(len(matrix_2[0])) :
            end_number = 0
            for column in range(len(matrix_1[0])) :
                end_number += matrix_1[rows][column] * matrix_2[column][matrix_column]
            new_elements[rows].append(end_number)
    return new_elements  

y = [[0],[1],[4],[9]]
coeffs = [[0,1],[1,1],[2,1],[3,1]]

trans_coeffs = transative_matrix(coeffs)
square_coeffs = multiply_matrix(trans_coeffs,coeffs)
inverse_coeffs = inverse_matrix(square_coeffs)
finished_y = multiply_matrix(trans_coeffs,y)
finished_y = multiply_matrix(inverse_coeffs, finished_y)
print(finished_y)