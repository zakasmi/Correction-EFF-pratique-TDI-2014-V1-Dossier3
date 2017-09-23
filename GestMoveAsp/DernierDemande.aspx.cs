using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestMoveAsp
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                int x = 0;
                bool result = false;
                using (SqlCommand cmd = new SqlCommand("select dbo.Calculer_Points('"+Session["ProfConnect"] +"')", Provider.cnx))
                {
                    
                    Provider.cnx.Open();
                    result = int.TryParse(cmd.ExecuteScalar().ToString(),out x);
                    if (result)
                    {
                        if (x > 30)
                        {
                            LBL_Message.ForeColor = System.Drawing.Color.Green;
                            LBL_Message.Text = "demaprle favorable";
                        }else if (x>=20) {
                            LBL_Message.ForeColor = System.Drawing.Color.Black;
                            LBL_Message.Text = "demande normale";
                        }else 
                        {
                            LBL_Message.ForeColor = System.Drawing.Color.Red;
                            LBL_Message.Text = "demande non favorable";
                            
                        }
                    }
            
                }

            }
            catch (Exception e3)
            {
                LBL_Message.Text = e3.Message;
            }
            finally
            {
                Provider.cnx.Close();
            }
        }
    }
}