//<%--
//Ezgi Camur
//--%>

using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class ClientVendorUC : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
       String from = Request.QueryString["ClientVendor"];
        btnSaveClient.Text = "Save " + from;

        if(from == "Client")
        {
            rdpNo.Checked = true;
        }
        else
        {
            rdbYes.Checked = true;
        }
    }

    public Boolean SaveClientVendor()
    {
        if (rdbYes.Checked)
        {
            return SaveVendor();
        }
        else
        {
            return SaveClient();
        }

    }

    protected void btnSaveClient_Click(object sender, EventArgs e)
    {
        SaveClientVendor();
    }

    private Boolean SaveClient()
    {
        try
        {
            execProcedure('C');
            cleanField();
            return true;
        }
        catch(Exception ex)
        {
            lblResultMsg.Text = ex.Message;
            lblResultMsg.Visible = true;
            return false;
        }
    }

    private Boolean SaveVendor()
    {
        try
        {
            execProcedure('V');
            cleanField();
            return true;
        }
        catch(Exception ex)
        {
            lblResultMsg.Text = ex.Message;
            lblResultMsg.Visible = true;
            return false;
        }
    }

    private void execProcedure(Char clientType)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DangerZoneConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("AddClientVendor", con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@FederalTaxId", SqlDbType.VarChar).Value = txtFederalTaxId.Text;
        cmd.Parameters.Add("@BusinessName", SqlDbType.VarChar).Value = txtBusinessName.Text;
        cmd.Parameters.Add("@AddressLine", SqlDbType.VarChar).Value = txtAddressLine.Text;
        cmd.Parameters.Add("@City", SqlDbType.VarChar).Value = txtCity.Text;
        cmd.Parameters.Add("@State", SqlDbType.Char).Value = drpState.SelectedValue;
        cmd.Parameters.Add("@ZipCode", SqlDbType.Char).Value = txtZipCode.Text;
        cmd.Parameters.Add("@ClientType", SqlDbType.Char).Value = clientType;

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    private void cleanField()
    {
        txtFederalTaxId.Text = string.Empty;
        txtBusinessName.Text = string.Empty;
        txtAddressLine.Text = string.Empty;
        txtCity.Text = string.Empty;
        drpState.SelectedValue = null;
        txtZipCode.Text = string.Empty;

    }
}