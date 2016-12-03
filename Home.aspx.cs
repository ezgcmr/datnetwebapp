//<%--
//Name: Ezgi Camur
//Panther Id: 5598239
//Assignment: Assignment 3
//Class: COP 4813 
//Semester: Fall 2016
//I attest that this is my original work
//Ezgi Camur
//--%>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        lblUnderLined.Attributes.Add("onClick", "CallMe();");
        //ProsClients.Visible = true;

        if (!IsPostBack)
        {
            //this is the first time
            lblCount.Text = "0";
        }
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        int count = Convert.ToInt32(lblCount.Text);
        count++;
        lblCount.Text = count.ToString();
    }
}