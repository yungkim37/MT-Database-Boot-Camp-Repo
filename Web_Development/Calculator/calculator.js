const operators = {
    ADD: "add",
    SUBTRACT: "subtract",
    MULTIPLY: "multiply",
    DIVIDE: "divide"
}

var firstNum = document.getElementById("first-num");
var secondNum = document.getElementById("second-num");
var operator = document.getElementsByName("operators");
var resultText = document.getElementById("output");

function getOperator(op)
{
    debugger;
    let checkedId = "";
    for(let i = 0; i < op.length; i++)
    {
        if (op[i].checked)
        {
            checkedId = op[i].id;
        }
    }
    return checkedId;
}

function validateInput(numOne,numTwo)
{   
    //debugger;
    if (isNaN(numOne) || isNaN(numTwo))
    {
        return false;
    }
    else
    {
        return true;
    }
}

function calculate() 
{
    let opSelected = getOperator(operator);
    let operation = "";
    let result = 0;
    let num1 = Number(firstNum.value);
    let num2 = Number(secondNum.value);
    //debugger;
    if (validateInput(num1,num2))
    {
        switch(opSelected)
        {
            case operators.ADD:
                result = num1 + num2;
                operation = "adding";
                break;
            case operators.SUBTRACT:
                result = num1 - num2;
                operation = "subtracting";
                break;
            case operators.MULTIPLY:
                result = num1 * num2;
                operation = "multiplying"
                break;
            case operators.DIVIDE:
                if (num2 == 0)
                {
                    resultText.innerHTML = "You cannot divide by 0";
                    return;
                }
                else
                {
                    result = num1 / num2;
                    operation = "dividing";
                }
                break;
            default:
                break;
            }
        resultText.innerHTML= "The result of " + operation + " " + num1 + " and " + num2 + " is " + result;
    }

    //by default, any blank input is set to 0. Non-numeric inputs, however, will go through else statement
    else
    {
        resultText.innerHTML= "Please enter a valid input";
    }
   
}

function clearValues() 
{
    //debugger;
    resultText.innerHTML = "The values are cleared";
    firstNum.value = "";
    secondNum.value = "";
    operator.value = "";
    firstNum.focus();
    document.getElementById(getOperator(operator)).checked= false;

}
