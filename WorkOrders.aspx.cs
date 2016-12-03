using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class WorkOrders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtDateInspected.Text = DateTime.Now.ToString(@"MM/dd/yyyy");
        txtDateInspected.Enabled = true;
    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        txtDateExpired.Text = Calendar1.SelectedDate.ToString();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        SaveClient();
    }

    private Boolean SaveClient()
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

    private void execProcedure()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DangerZoneConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand("AddWorkOrders", con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@WorkOrderNumber", SqlDbType.Char).Value = txtWorkOrderNumber.Text;
        cmd.Parameters.Add("@MechanicId", SqlDbType.Int).Value = drpMechanicCallSign.SelectedValue;
        cmd.Parameters.Add("@PartNo", SqlDbType.Char).Value = txtPartNo.Text;
        cmd.Parameters.Add("@InspectionComments", SqlDbType.VarChar).Value = txtInspectionComments.Text;
        cmd.Parameters.Add("@Expires", SqlDbType.Date).Value = txtDateExpired.Text;
        cmd.Parameters.Add("@DateTimeInspected", SqlDbType.DateTime).Value = txtDateInspected.Text;

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    private void cleanField()
    {
        txtWorkOrderNumber.Text = string.Empty;
        drpMechanicCallSign.Text = null;
        txtPartNo.Text = string.Empty;
        txtInspectionComments.Text = string.Empty;
        txtDateExpired.Text = string.Empty;
        txtDateInspected.Text = string.Empty;
        

    }
}