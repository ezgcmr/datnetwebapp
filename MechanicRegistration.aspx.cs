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
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class MechanicRegistration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public Boolean SaveMechanic()
    {
        try
        {
            execProcedure();
            cleanField();
            return true;
        }
        catch (Exception ex)
        {
            lblResultMsg.Text = ex.Message;
            lblResultMsg.Visible = true;
            return false;
        }

    }
    protected void btnSaveMechanic_Click(object sender, EventArgs e)
    {
       SaveMechanic();
    }
    private void execProcedure()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DangerZoneConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("AddMechanic", con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@MechanicCallSign", SqlDbType.VarChar).Value = txtCallSign.Text;
        cmd.Parameters.Add("@FirstName", SqlDbType.VarChar).Value = txtFirstName.Text;
        cmd.Parameters.Add("@LastName", SqlDbType.VarChar).Value = txtLastName.Text;
        cmd.Parameters.Add("@Specialty", SqlDbType.Char).Value = drpSpecialty.SelectedValue;

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    private void cleanField()
    {
        txtCallSign.Text = string.Empty;
        txtFirstName.Text = string.Empty;
        txtLastName.Text = string.Empty;
        drpSpecialty.SelectedValue = null;

    }
}