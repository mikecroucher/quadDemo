function [r, D] = solveQuadratic(a,b,c)
% solveQuadratic  Solve ax^2 + bx + c = 0
%   [r, D] = solveQuadratic(a,b,c) returns:
%     r : 1x2 vector of roots (if linear, second root is NaN)
%     D : discriminant (b^2 - 4*a*c)
%
%   Example:
%     r = solveQuadratic(1, -3, 2)    % returns [2 1]

    % Validate inputs
    if ~(isscalar(a) && isscalar(b) && isscalar(c) && isnumeric(a) && isnumeric(b) && isnumeric(c))
        error('Inputs a, b, c must be numeric scalars.');
    end

    % Initialize
    r = [NaN, NaN];
    D = b.^2 - 4.*a.*c;

    % Handle quadratic and linear cases
    if a == 0
        % Linear: bx + c = 0
        if b == 0
            if c == 0
                error('MATLAB:solveQuadratic:Indeterminate');
            else
                error('No solution (constant nonzero = 0).');
            end
        end
        r(1) = -c / b;
        r(2) = NaN;
        D = NaN;
        return
    end

    % Quadratic formula (handles complex roots automatically)
    sqrtD = sqrt(D);
    r(1) = (-b + sqrtD) / (2*a);
    r(2) = (-b - sqrtD) / (2*a);
end
