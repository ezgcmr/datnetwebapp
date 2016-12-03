//Name: Ezgi Camur
//Panther Id: 5598239
//Assignment: Assignment 2
//Class: COP 4813 
//Semester: Fall 2016
//I attest that this is my original work
//Ezgi Camur

using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;

[ServiceContract(Namespace = "")]
[AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
public class DangerZone
{
    // To use HTTP GET, add [WebGet] attribute. (Default ResponseFormat is WebMessageFormat.Json)
    // To create an operation that returns XML,
    //     add [WebGet(ResponseFormat=WebMessageFormat.Xml)],
    //     and include the following line in the operation body:
    //         WebOperationContext.Current.OutgoingResponse.ContentType = "text/xml";
    [OperationContract]
    public bool checkMecCallSign(String callSign)
    {
        String[] callSignList = new String[] { "Viper", "Jester", "Cougar" };

        for (int i = 0; i < callSignList.Length; i++)
        {
            if (callSign == callSignList[i])
            {
                return true;
            }
        }
        return false;
    }

    // Add more operations here and mark them with [OperationContract]
}
