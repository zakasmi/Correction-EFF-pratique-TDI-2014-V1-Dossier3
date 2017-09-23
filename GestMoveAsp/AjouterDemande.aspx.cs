using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestMoveAsp
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                try
                {
                    int x = 0;
                    using (SqlCommand cmd = new SqlCommand("insert into Demande values('"+ TB_IdDemande.Text+"','"+DateTime.Now+"','"+Session["ProfConnect"] +"')", Provider.cnx))
                    {
                        Provider.cnx.Open();
                        x = cmd.ExecuteNonQuery();
                            if (x > 0)
                            {
                            Session["IdDemande"] = TB_IdDemande.Text;
                            Response.Redirect("~/DetailDemande.aspx");
                            }
                            else
                            {
                            Label2.Text = "La Demande n'est pas ajouté";
                            }
                        
                    }

                }
                catch (Exception e3)
                {
                    Label2.Text = e3.Message;
                }
                finally
                {
                    Provider.cnx.Close();
                }
            }
        }
    }
}