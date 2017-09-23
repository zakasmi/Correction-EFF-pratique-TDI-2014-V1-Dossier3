using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestMoveAsp
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            NombreDemandeProf NDP = new NombreDemandeProf();
            Label3.Text =NDP.GetNombreDemandeMutParProf(TextBox1.Text);

        }
    }
}