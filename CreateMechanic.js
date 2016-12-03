//<%--
//Name: Ezgi Camur
//Panther Id: 5598239
//Assignment: Assignment 3
//Class: COP 4813 
//Semester: Fall 2016
//I attest that this is my original work 
//Ezgi Camur
//--%>

function CheckCallSign()
{ 
    var callSign = document.getElementById('ContentPlaceHolder1_txtCallSign').value;
    DangerZone.checkMecCallSign(callSign, CheckCallSignCallback);
} 
function CheckCallSignCallback(result) 
{
    if (result) {
        $('#lblCallSign').text("Your Call sign already exists, Please try another one");
    }
    else
        $('#lblCallSign').text("Your Call sign has been verified");
}