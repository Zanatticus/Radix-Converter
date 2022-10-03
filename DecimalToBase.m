%MATLAB Code to convert a number in base 10 to a number in a given base
%Written by Alexander Ingare

function DecimalInBase = DecimalToBase(InputInDecimal, BaseToConvert)
%prevents circuit from breaking if BaseToConvert is 10
if BaseToConvert == 10
    DecimalInBase = InputInDecimal;
end

%converts InputInDecimal into a column vector
if  BaseToConvert ~= 10
    %Checks if the input is negative and converts it into a positive number to
    %be properly converted
    if InputInDecimal < 0
        InputInDecimal = InputInDecimal *-1;
    end
    InputInDecimal = InputInDecimal(:);
    
    %finds out the highest number of powers of the base to be closest to
    %InputInDecimal and then adds one to find out the length of the converted
    %base's number
    n=0;
    while any(BaseToConvert.^n <= InputInDecimal)
        n = n + 1;
    end
    
    %the nth column (last column) of DecimalInBase is given the value of the
    %remainder after dividing (division method). The other columns are set at
    %zero.
    DecimalInBase(:,n) = rem(InputInDecimal,BaseToConvert);
    
    % any(InputInDecimal) must come first as it breaks for empty nums.
    %loop through from right to left of the column vector to find out the
    %remainder values of the division method for the new converted number
    while any(InputInDecimal) && n >1
        %go back a column
        n = n - 1;
        %finds out the exact number of the power of the base which goes into
        %InputInDecimal and makes InputInDecimal equal to the base to that
        %power
        InputInDecimal = floor(InputInDecimal/BaseToConvert);
        %In the new column spot, set that value equal to the remainder
        DecimalInBase(:,n) = rem(InputInDecimal,BaseToConvert);
    end
    %create an array of alphanumerics
    symbols = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    %all vector elements of DecimalInBase > 9 turn into their respective letter
    DecimalInBase = reshape(symbols(DecimalInBase + 1),size(DecimalInBase));
end
end