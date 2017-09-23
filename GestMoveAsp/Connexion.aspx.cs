using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestMoveAsp
{
    public partial class Connexion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BTN_Connexion_Click(object sender, EventArgs e)
        {
            if (IsValid) {
                try
                {
                    int x = 0;
                    bool result = false;
                    using (SqlCommand cmd = new SqlCommand("select count(*) from Professeur where IdProfesseur = '" + TB_IdProf.Text + "' and Pass='" + TB_Pass.Text + "' ", Provider.cnx))
                    {
                        Provider.cnx.Open();
                        result = int.TryParse(cmd.ExecuteScalar().ToString(), out x);
                        if (result) {
                            if (x > 0) {
                                Session["ProfConnect"] = TB_IdProf.Text;
                                Response.Redirect("~/Accueil.aspx");
                            }
                            else
                            {
                                Label3.Text = "IdProfesseur Ou Mot De Pass Incorrect";
                            }
                        }
                    }

                }
                catch (Exception e3)
                {
                    Label3.Text = e3.Message;
                }
                finally
                {
                    Provider.cnx.Close();
                }
            }
        }
    }
}