//<%--
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