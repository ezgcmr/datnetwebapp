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
using System.Web.UI.WebControls;

using Newtonsoft.Json;

public partial class PartEntry : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        txtDateEntered.Text = DateTime.Now.ToString(@"MM/dd/yyyy");
        txtDateEntered.Enabled = false;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {


        if (String.IsNullOrEmpty(drpClient.Text) || String.IsNullOrEmpty(drpManufacturer.Text)
            || String.IsNullOrEmpty(txtOrderNum.Text) || String.IsNullOrEmpty(txtDateEntered.Text)
            || String.IsNullOrEmpty(txtDescription.Text) || String.IsNullOrEmpty(txtPartNo.Text)
            || String.IsNullOrEmpty(txtSerial.Text) || String.IsNullOrEmpty(txtModel.Text))
        {

            lblResultMsg.Visible = true;
            lblResultMsg.Text = "The required fields in the first section have not been populated. Please try again.";

            return; //cancel submittion
        }


        Dictionary<string, string> results = SavePart();
        string json = JsonConvert.SerializeObject(results, Formatting.Indented);
        hdnSavedValues.Value = json;
        txtSavedValues.Text = json;
        txtSavedValues.Visible = true;

        prgHide.Visible = false;
        lblResultMsg.Text = "Your entries have been saved, you can be my wingman anytime.";
        lblResultMsg.Visible = true;


        try
        {

            SqlDataSource4.Insert();

        }
        catch (Exception ex)
        {
            prgHide.Visible = false;
            lblResultMsg.Text = ex.Message;
            lblResultMsg.Visible = true;
        }


    }

    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        //args.IsValid = args.Value.Length <= 50;
    }

    protected Dictionary<string, string> SavePart()
    {
        Dictionary<string, string> fieldList = new Dictionary<string, string>();

        fieldList.Add(drpClient.ID, drpClient.SelectedValue);
        fieldList.Add(txtOrderNum.ID, txtOrderNum.Text);
        fieldList.Add(txtDateEntered.ID, txtDateEntered.Text);
        fieldList.Add(txtDescription.ID, txtDescription.Text);
        fieldList.Add(txtPartNo.ID, txtPartNo.Text);
        fieldList.Add(txtSerial.ID, txtSerial.Text);
        fieldList.Add(drpManufacturer.ID, drpManufacturer.SelectedValue);
        fieldList.Add(drpMechanicCallSign.ID, drpMechanicCallSign.SelectedValue);
        fieldList.Add(txtModel.ID, txtModel.Text);
        fieldList.Add(txtInstructions.ID, txtInstructions.Text);
        fieldList.Add(txtTroubleReported.ID, txtTroubleReported.Text);

        if (chckMaster.Checked == true)
            fieldList.Add(chckMaster.ID, "Master Contract");
        else
            fieldList.Add(chckMaster.ID, "Not Master Contract");

        return fieldList;

    }
}