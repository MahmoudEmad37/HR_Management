using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HR_Management
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void loginBtn_Click(object sender, EventArgs e)
        {
            /*string user_name = userNameTxt.Text;
            string password = txtPassword.Text;
            if(user_name.Equals("admin") && password.Equals("hr"))
            {
                this.Hide();
                Form2 form = new Form2();
                form.Show();
            }
            else if (!user_name.Equals("admin") && password.Equals("hr"))
            {
                MessageBox.Show("Invalid user name","Login",
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (user_name.Equals("admin") && !password.Equals("hr"))
            {
                MessageBox.Show("Invalid Password", "Login",
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                MessageBox.Show("Invalid user name and Password", "Login",
                    MessageBoxButtons.OK, MessageBoxIcon.Error);
            }*/

            this.Hide();
            Form2 form = new Form2();
            form.Show();

        }
    }
}
