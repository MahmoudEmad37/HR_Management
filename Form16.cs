using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;

namespace HR_Management
{
    public partial class Form16 : Form
    {

        string orclDB = "Data Source = ORCL; User Id = hr; Password = hr";
        OracleConnection connection;
        public Form16()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void cbId_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void calculateTimeBtn_Click(object sender, EventArgs e)
        {
            OracleCommand cmd = new OracleCommand();
            cmd.Connection = connection;
            cmd.CommandText = "GetMaxSalary_Emp";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("max", OracleDbType.Int32, ParameterDirection.Output);
            cmd.ExecuteNonQuery();

            textBox1.Text = cmd.Parameters["max"].Value.ToString();
        }

        private void Form11_Load(object sender, EventArgs e)
        {

            connection = new OracleConnection(orclDB);
            connection.Open();

        }
    }
}
