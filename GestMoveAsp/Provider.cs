using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace GestMoveAsp
{
    public class Provider
    {
        public static SqlConnection cnx = new SqlConnection(@"Data Source=.\sqlexpress;Initial Catalog=GestMove;Integrated Security=True");
        public static DataSet ds; 
    }
}