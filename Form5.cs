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
    public partial class Form5 : Form
    {
        string orclDB = "Data Source = ORCL; User Id = hr; Password = hr";
        OracleConnection connection;
        public Form5()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void Form5_Load(object sender, EventArgs e)
        {
            connection = new OracleConnection(orclDB);
            connection.Open();

            OracleCommand ID_com;
            OracleDataReader dr;

            //-- For Employees
            ID_com = new OracleCommand();
            ID_com.Connection = connection;
            ID_com.CommandText = "Select Emp_ID From Employee";
            ID_com.CommandType = CommandType.Text;

            dr = ID_com.ExecuteReader();
            while (dr.Read())
            {
                searchCb.Items.Add(dr[0]);
            }
            dr.Close();

        }

        private void evaluateTxt_Click(object sender, EventArgs e)
        {
            OracleCommand Name_cmd = new OracleCommand();
            Name_cmd.Connection = connection;
            Name_cmd.CommandText = "Get_EVALUATION";
            Name_cmd.CommandType = CommandType.StoredProcedure;
            Name_cmd.Parameters.Add("idd", searchCb.Text);
            Name_cmd.Parameters.Add("res", OracleDbType.RefCursor, ParameterDirection.Output);
            OracleDataReader dr = Name_cmd.ExecuteReader();
            while (dr.Read())
            {
                textBox1.Text = dr[0].ToString();
                textBox2.Text = dr[1].ToString();
                textBox3.Text = dr[2].ToString();
                textBox4.Text = dr[3].ToString();
            }
            dr.Close();
        }

        private void searchCb_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
