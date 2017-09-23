using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestMoveAsp
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Session["IdDemande"] != null)
                    {
                        TB_IdDemande.Text = Session["IdDemande"].ToString();
                        TB_IdDemande.Enabled = false;
                    }
                    else
                    {

                        using (SqlCommand cmd = new SqlCommand(" select Top 1 IdDemande from Demande where IdProfesseur = '" + Session["ProfConnect"] + "' order by DateDem desc ", Provider.cnx))
                        {
                            bool result = false; ;
                            int iddemande;
                            Provider.cnx.Open();
                            result = int.TryParse(cmd.ExecuteScalar().ToString(), out iddemande);
                            if (result)
                            {
                                TB_IdDemande.Text = iddemande.ToString();
                                TB_IdDemande.Enabled = false;
                            }
                            else { Response.Redirect("~/AjouterDemande.aspx"); }
                            Provider.cnx.Close();
                        }
                    }

                }
            }
            catch (Exception)
            {
                Response.Redirect("~/AjouterDemande.aspx");

            }
            finally { Provider.cnx.Close(); }
        }

        protected void BTN_Ajouter_Click(object sender, EventArgs e)
        {

            if (IsValid)
            {
                try
                {
                    int x = 0;
                    int count = 0;
                    bool resultCount = false;
                    using (SqlCommand cmd = new SqlCommand("select count(*) from Detail_Demande where IdDemande ='" + Session["IdDemande"] +"'", Provider.cnx))
                    {
                        Provider.cnx.Open();
                        resultCount = int.TryParse(cmd.ExecuteScalar().ToString(),out count);
                        Provider.cnx.Close();
                    }

                    if (resultCount )
                    {

                        if (count < 10)
                        {
                            count++;
                            using (SqlCommand cmd = new SqlCommand("insert into Detail_Demande values('" + Session["IdDemande"] + "','" + DropDownList1.SelectedValue.ToString() + "','" + count + "')", Provider.cnx))
                            {
                                Provider.cnx.Open();
                                x = cmd.ExecuteNonQuery();
                                if (x > 0)
                                {
                                    LBL_Info.Text = "Detail Demande a ete ajouté avec succes";
                                }
                                else
                                {
                                    LBL_Info.Text = "Detail Demande n'est pas ajouté";
                                }

                            } 
                        }
                        else LBL_Info.Text = "il a 10 Detail Demande , Le Maximum est 10 lycee !!!! ";
                    }

                }
                catch (Exception e3)
                {
                    LBL_Info.Text = e3.Message;
                }
                finally
                {
                    Provider.cnx.Close();
                }
            }
        }
    }
}