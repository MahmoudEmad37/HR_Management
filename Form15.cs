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
    public partial class Form15 : Form
    {
        string orclDB = "Data Source = ORCL; User Id = hr; Password = hr";
        OracleConnection connection;
        public Form15()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void calculateTimeBtn_Click(object sender, EventArgs e)
        {

            int id = int.Parse(textBox1.Text);
            DateTime Date = Convert.ToDateTime( textBox2.Text);
            string res;
            try
            {  res = textBox3.Text; }
            catch
            {  res = ""; }
            int interviwee = int.Parse(textBox4.Text);
            int hr = int.Parse(textBox5.Text);

            OracleCommand insert_com = new OracleCommand();
            insert_com.Connection = connection;
            insert_com.CommandText = "Insert_interview";
            insert_com.Parameters.Add("id", id);
            insert_com.Parameters.Add("date", Date);
            insert_com.Parameters.Add("res", res);
            insert_com.Parameters.Add("interviwee", interviwee);
            insert_com.Parameters.Add("hr", hr);
            insert_com.CommandType = CommandType.StoredProcedure;
            insert_com.ExecuteNonQuery();

            MessageBox.Show("Done");
            this.Close();
        }

        private void Form13_Load(object sender, EventArgs e)
        {
            connection = new OracleConnection(orclDB);
            connection.Open();
        }
    }
}
