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
    public partial class Form14 : Form
    {
        string orclDB = "Data Source = ORCL; User Id = hr; Password = hr";
        OracleConnection connection;
        public Form14()
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
            string fname = textBox2.Text;
            string lname = textBox3.Text;
            string mob = textBox4.Text;
            string email = textBox5.Text;
            string add = textBox6.Text;

            OracleCommand insert_com = new OracleCommand();
            insert_com.Connection = connection;
            insert_com.CommandText = "Insert_interviewee";
            insert_com.Parameters.Add("id", id);
            insert_com.Parameters.Add("fname", fname);
            insert_com.Parameters.Add("lname", lname);
            insert_com.Parameters.Add("mob", mob);
            insert_com.Parameters.Add("email", email);
            insert_com.Parameters.Add("address", add);
            insert_com.CommandType = CommandType.StoredProcedure;
            int dr = insert_com.ExecuteNonQuery();
            if (dr != -1)
            {
                MessageBox.Show("interviewee inserted");
            button1.Visible = true;
            calculateTimeBtn.Visible = false;

            }
        }

        private void Form13_Load(object sender, EventArgs e)
        {
            button1.Visible = false;
            connection = new OracleConnection(orclDB);
            connection.Open();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form15 f=(new Form15());
            f.Show();
        }

        private void label2_Click(object sender, EventArgs e)
        {
            
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int id = int.Parse(textBox1.Text);
            string fname = textBox2.Text;
            string lname = textBox3.Text;
            string mob = textBox4.Text;
            string email = textBox5.Text;
            string add = textBox6.Text;

            OracleCommand update_com = new OracleCommand();
            update_com.Connection = connection;
            update_com.CommandText = "update_interviewee";
            update_com.Parameters.Add("ID", id);
            update_com.Parameters.Add("fname", fname);
            update_com.Parameters.Add("lname", lname);
            update_com.Parameters.Add("mob", mob);
            update_com.Parameters.Add("email", email);
            update_com.Parameters.Add("address", add);
            update_com.CommandType = CommandType.StoredProcedure;
            int dr=update_com.ExecuteNonQuery();
            if (dr != -1)
            {
                MessageBox.Show("interviewee Updated");
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(textBox1.Text);

            OracleCommand delete_com = new OracleCommand();
            delete_com.Connection = connection;
            delete_com.CommandText = "delete_interviewee";
            delete_com.Parameters.Add("ID", id);
            delete_com.CommandType = CommandType.StoredProcedure;
            int dr=delete_com.ExecuteNonQuery();
            if (dr != -1)
                MessageBox.Show("Employee Deleted Successfully");
        }
    }
}
