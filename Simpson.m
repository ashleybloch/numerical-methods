function [I] = Simpson(x,y)
% This function applies either the simpson rule or the trapezoidal rule to
% a set of experimental data to evaluate the integral.
%
%Inputs:
% x - a vector of evenly spaced experimental data (independent variable)
% y - a vector of evenly spaced experimental data (dependent variable)
%
%Outputs:
% I - the integral calculated using the Simpson rule, and even neccesary,
% te trapezoidal rule as well.

%Checks that the user put in an x and y vector
if nargin ~= 2, error('2 input arguments are required for this function'), end
    
%Check that the inputs are the same length
if length(x) ~= length(y), error('The number of experimental inputs or must match the number of outputs'), end

%Check that the x input is spaced evenly
space = diff(x);
if ~ all(space == space(1))
    error('X must be evenly spaced')
end

%check if you have to use the tapezoid rule base on how many intervals
%there are
int = -1 + length(x);
if mod(int, 2) ~= 0
    
    %Assigns variables to all but the last interval for the Simpson rule,
    %then assigns the last variable to an interval for the trapezoidal rule
    %to be used
    s = y(1 : end-1);
    t = y(end-1 :end);
    disp('Warning: The trapezoidal rule had to be executed on the last interval due to an odd number of intervals')
    
else
    
    %Assigns variable to have the Simpson rule used on the intervals, then sets the vector for
    %the trapezoidal rule full of zeros since it doesn't need to be
    %applied.
    s = y;
    n = size(y);
    t = zeros(n);
    disp('The integral could be evaluated without using the trapezoidal rule')
    
end

%Assigns a variable to the step size
h = space(1);

%Applies Simpson rule
S = (h/3) * (s(1) + 2*sum(s(3:2:end-2)) + 4*sum(s(2:2:end)) + s(end));

%Applies trapezoidal rule (If it did not need to be applied, then it will
%do it for a zero vector which should be equal to zero)
T = trapz(t);

%Adds the Simpson rule and Trapezoidal rule (If trapezoidal rule did not
%need to be applied, it will just be adding zero)
I = S + T;
end