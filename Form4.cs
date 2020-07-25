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
    public partial class Form4 : Form
    {
        OracleDataAdapter adapter;
        OracleCommandBuilder builder1;
        DataSet ds;
        public Form4()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void Form4_Load(object sender, EventArgs e)
        {

            string str_connection = "Data Source = ORCL; User Id = hr; Password = hr",
            str_cmd = "select * from DEPARTMENT";
            adapter = new OracleDataAdapter(str_cmd, str_connection);
            ds = new DataSet();
            adapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
        }

        private void button1_Click(object sender, EventArgs e)
        {
            builder1 = new OracleCommandBuilder(adapter);
            adapter.Update(ds.Tables[0]);
        }
    }
}
