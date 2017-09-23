using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace GestMoveAsp
{
    /// <summary>
    /// Summary description for NombreDemandeProf
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class NombreDemandeProf : System.Web.Services.WebService
    {

        [WebMethod]
        public string GetNombreDemandeMutParProf(string IdProf)
        {
            try
            {
                string Nombre = "0";
           
                using (SqlCommand cmd = new SqlCommand("select count(*) from Demande where IdProfesseur = '" + IdProf + "'", Provider.cnx))
                {
                    Provider.cnx.Open();
                    Nombre = cmd.ExecuteScalar().ToString();
                
                }
                return Nombre;
            }
            catch (Exception e3)
            {
                return e3.Message;
            }
            finally
            {
                Provider.cnx.Close();
            }
        }
    }
}
