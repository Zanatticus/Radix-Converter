%MATLAB Code to convert a number in a given base to a number in base 10
%Written by Alexander Ingare

function InputInDecimal = BaseToDecimal(inputBase, inputNumber)
if  inputBase ~= 10
    %convert the input integer into a string that then goes into a cell array
    inputNumArr = char(num2cell(inputNumber));
    
    %flip array elements for base to decimal conversion
    inputNumArrFlip = fliplr(inputNumArr');
    
    %initializes the decimal base array
    InputNumDecFlip =[];
    
    %converts the input number into base 10
    %since the letters of the array are represented by their ASCII values,
    %they need to be converted into their base form
    for i=1: length(inputNumArrFlip)
        if(inputNumArrFlip(i)>=48 && inputNumArrFlip(i)<= 57)
            InputNumDecFlip(i) = (inputNumArrFlip(i)-48)*(inputBase^(i-1));
        end
        if(inputNumArrFlip(i)>=65 && inputNumArrFlip(i)<= 90)
            InputNumDecFlip(i) = (inputNumArrFlip(i)-55)*(inputBase^(i-1));
        end
    end
    %displays the number in base 10
    InputInDecimal = sum(InputNumDecFlip);
end
%prevents circuit from breaking if inputBase is 10
if inputBase == 10
    %convert the input number back into number form so when put into
    %DecimalToBase it doesn't output an array of numbers
    inputNumber = str2num(inputNumber);
    InputInDecimal = inputNumber;
end