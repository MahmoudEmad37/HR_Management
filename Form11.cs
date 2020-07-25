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
    public partial class Form11 : Form
    {

        string orclDB = "Data Source = ORCL; User Id = hr; Password = hr";
        OracleConnection connection;
        public Form11()
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
            OracleCommand Name_cmd = new OracleCommand();
            Name_cmd.Connection = connection;
            Name_cmd.CommandText = "Get_training_Emp";
            Name_cmd.CommandType = CommandType.StoredProcedure;
            Name_cmd.Parameters.Add("title", comboBox1.Text);
            Name_cmd.Parameters.Add("name", OracleDbType.RefCursor, ParameterDirection.Output);
            OracleDataReader dr = Name_cmd.ExecuteReader();
            while (dr.Read())
            {
                string str = dr[0].ToString() + " " + dr[1].ToString();
                comboBox2.Items.Add(str);
            }
            dr.Close();
        }

        private void Form11_Load(object sender, EventArgs e)
        {

            connection = new OracleConnection(orclDB);
            connection.Open();

            OracleDataReader dr;
            OracleCommand com = new OracleCommand();
            com.Connection = connection;
            com.CommandText = "Select TRAINING_TITLE From TRAINING";
            com.CommandType = CommandType.Text;
            dr = com.ExecuteReader();
            while (dr.Read())
            {
                comboBox1.Items.Add(dr[0]);
            }
            dr.Close();
        }
    }
}
