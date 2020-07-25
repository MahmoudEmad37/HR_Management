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
    public partial class Form6 : Form
    {
        OracleDataAdapter adapter;
        DataSet ds;
        public Form6()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void Form6_Load(object sender, EventArgs e)
        {

            string orclDB = "Data Source = ORCL; User Id = hr; Password = hr";
            OracleConnection connection = new OracleConnection(orclDB);
            connection.Open();

            OracleDataReader dr;
            OracleCommand com = new OracleCommand();
            com.Connection = connection;
            com.CommandText = "Select MEETING_ID From MEETING";
            com.CommandType = CommandType.Text;
            dr = com.ExecuteReader();
            while (dr.Read())
            {
                meetingSearchCb.Items.Add(dr[0]);
            }
            dr.Close();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void viewMeetingBtn_Click(object sender, EventArgs e)
        {

            int id = Convert.ToInt32(meetingSearchCb.Text);
            string str_connection = "Data Source = ORCL; User Id = hr; Password = hr",
            str_cmd = @"select * from MEETING where MEETING_ID=:id";

            adapter = new OracleDataAdapter(str_cmd, str_connection);
            adapter.SelectCommand.Parameters.Add("id", id);
            ds = new DataSet();
            adapter.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
        }
    }
}
