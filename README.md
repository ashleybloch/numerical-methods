# numerical-methods
This repository is a collection of user-defined functions in MATLab created to solve numerical analysis problems for Mech 105 at Colorado State University.

##falsePosition
This function uses a bracketing method to estimate the root of a given function tot he desired relative error. To use this function, input the function being evaluated, the lower guess, the upper guess, and the desired relative error. The function will then output the location of the estimated root, the function evaluated at that root, and the approximate relative error.

##luFactor
This function determines the LU factorization of a square matrix using row reduction and partial pivoting. To use this function, input any square matrix. The function will then output a lower triangle matrix, an upper triangular matrix, and the pivot matrix.

##Simpson
This function applies the Simpson rule and if needed, the trapezoidal rule to evaluate the integral of experimental data. To use this function, input an evenly spaced vector of the independent variables, and another vector of the dependent variables. The function will then output the value of the calculated integral.
