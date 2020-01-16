function checkForEmptyFields() {
    alert("a");
    var rollNum = document.getElementById("rollNumField").value;
    var name = document.getElementById("nameField").value;
    var degree = document.getElementById("degreeField").value;
    var date = document.getElementById("dateField").value;
    if (name == "" || rollNum == "" || date == "" || degree == "") {
        document.getElementById("status").innerText = "Please fill in the missing fields.";
        return false;
    }
    return true;
}
function rollNumLength()
{
    var rollNum = document.getElementById("rollNumField").value;
    var len = rollNum.length;
    if(len<=8 || len>=16)
    {
        document.getElementById("status2").innerText = "Please enter a rollNum that is between 8-16 characters long.";
        return false;

    }
    return true;
}
function validateName()
{
    var name = document.getElementById("nameField").value;
    var len = name.length;
    
    if(len<4||len>20)
    {
        document.getElementById("status3").innerText = "Please enter a name that is between 3-20 alphabets long.";
        return false;
    }
    for(var x=0;x<len;x++)
    {
        var char = name.charAt(x);
        if((char<65 || (char>90 &&char<97) || char>122))
        {
            document.getElementById("status3").innerText = "Please enter a name that contains alphabets only.";
            return false;
        }
    }
    return true;
}
function validateDegree()
{
    var degree = document.getElementById("degreeField").value;
    var len=degree.length;
    if(len<5||len>30)
    {
        document.getElementById("status4").innerText = "Please enter a degree that is between 5-30 alphabets long.";
        return false;
    }
    for(var x=0;x<len;x++)
    {
        var char = degree.charAt(x);
        if((char<65 || (char>90 &&char<97) || char>122))
        {
            document.getElementById("status4").innerText = "Please enter a degree that contains alphabets only.";
            return false;
        }
    }
    return true;
}