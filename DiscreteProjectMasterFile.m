%Main file for the base converter. Uses the functions from the other two
%files (BaseToDecimal and DecimalToBase) to display to the command window
%Written by Alexander Ingare

clc

prompt = "What is your input base?" + newline;
inputBase = input(prompt);
prompt = "Please input a valid number in base " + inputBase + newline;
inputNumber = input(prompt, 's');
prompt = "What base would you like to convert to?" + newline;
BaseToConvert = input(prompt);

tic 
if inputBase == BaseToConvert
    disp('Your converted number is: ');
    disp(inputNumber);
end

if inputBase ~= BaseToConvert
%checks if the decimal number is negative and creates a marker for the disp
numInDec = BaseToDecimal(inputBase, inputNumber);
NegMarker = "";
if BaseToConvert ~= 10
    % if numInDec is negative, its because the inital base was negative
    % if the input number was negative, since two's complement is weird,
    % it just transfers the negative symbol to the end
    if numInDec <0
        NegMarker = "-";
    end
end

%output into new base is not for 2s complement
newNum = DecimalToBase(BaseToDecimal(inputBase, inputNumber), BaseToConvert);
disp('Your converted number in decimal is: ')
disp(NegMarker + numInDec)
disp("Your converted number in base " + inputBase + " is: ")
disp(NegMarker + newNum)
toc
end