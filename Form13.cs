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
    public partial class Form13 : Form
    {
        string orclDB = "Data Source = ORCL; User Id = hr; Password = hr";
        OracleConnection connection;
        public Form13()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void calculateTimeBtn_Click(object sender, EventArgs e)
        {
            OracleCommand max_com = new OracleCommand();
            max_com.Connection = connection;
            max_com.CommandText = "GetMaxBonus";
            max_com.CommandType = CommandType.StoredProcedure;
            max_com.Parameters.Add("id", OracleDbType.Int32, ParameterDirection.Output);
            max_com.ExecuteNonQuery();
            try
            {
                textBox1.Text = max_com.Parameters["id"].Value.ToString();
                int Emp_id = Convert.ToInt32(max_com.Parameters["id"].Value.ToString());
                OracleCommand info_com = new OracleCommand();
                info_com.Connection = connection;
                info_com.CommandText = "Select EMP_FNAME,EMP_LNAME,DEP_NAME From Employee,DEPARTMENT Where Emp_ID =: ID and DEPARTMENT.DEP_ID=Employee.DEP_ID";
                info_com.Parameters.Add("ID", Emp_id);
                info_com.CommandType = CommandType.Text;
                OracleDataReader dr = info_com.ExecuteReader();
                if (dr.Read())
                {
                    textBox2.Text = dr[0].ToString() + " " + dr[1].ToString();
                    textBox3.Text = dr[2].ToString();
                }
            }
            catch
            {
                textBox1.Text = "0";
            }
        }

        private void Form13_Load(object sender, EventArgs e)
        {

            connection = new OracleConnection(orclDB);
            connection.Open();
        }
    }
}
