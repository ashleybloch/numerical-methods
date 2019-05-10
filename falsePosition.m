
% Ashley Bloch

function[root, fx, ea,iter] = falsePosition(func, xl, xu, es, maxiter)
% This user defined MATLAB function estimates the root of a given function to the desired
% relative error.
% inputs:
% func - the function being evaluated
% xl - the lower guess
% xu - the upper guess
% es - the desired relative error
% maxiter - the number of iterations desired
% outputs:
% root - the estimated root location
% fx - the function evaluated at the root location
% ea - the approximate relative error
%iter - the number of iterations

if nargin < 3 ,
   error('Please insert the function, your lower guess, and your upper guess'),
end

if nargin < 4 || isempty(es),
   es = .000001; 
end

if nargin < 5 || isempty(maxiter),
   maxiter = 200; 
end
 
% The first if statment above checks that the user inputed all the variables
% necesary. If the desired realtive error is not stated, the second
% statement makes it default to 0.0001%. If the maximum number of
% iterations is not stated, the third statement will make it default to
% 200.

test = func(xl) * func(xu);
if test > 0, error('No sign change occurs between these points. Graph your function for an approximation of where your function has roots.'), end   

%This statement checks that a sign case occurs between the points, in case
%the user put in guesses that did not enclose a root change.

numiters = 0;
ea = 100;
xr = xl;

while (1)
    xrprevious = xr;
    xr = xu - ( func(xu) * (xl - xu)) / ( func(xl) - func(xu) ) ;
    numiters = numiters + 1;
    
 % The first statement makes the old root estimation into a new variable so that the 
 % approximate relative error can be calculated. The second statement finds
 % a new estimate for the root, then the third serves as a counter to the
 % number of iterations that have occured.
    
    ea = abs((xr - xrprevious) / xr);
    
 % Calculates the approximate relative error.
 
    if func(xr) * xl > 0
        xl = xr;
    elseif func(xr) * xl < 0
        xu = xr;
    end
    
 % This segment either determines what bracket xr will replace for the next
 % iteration. 
 
    if ea <= (es / 100), 
        break,
    end
    
    if numiters >= maxiter,
        break,
    end
    
 % This breaks the loop when it reaches the maximum number of iterations or
 % the minimum desired relative error.
    
end

root = xr
fx = func(xr)
ea = ea
iter = numiters

