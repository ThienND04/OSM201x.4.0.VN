#!/bin/sh

echo -n "Enter first number: "
read firstNumber
echo -n "Enter second number: "
read secondNumber

echo "Sum: $(($firstNumber + $secondNumber))"