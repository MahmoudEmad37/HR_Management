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
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
          //  openChildForm(new Form9());
        }

        private Form activeForm = new Form();
        private void openChildForm(Form childForm)
        {
            if (activeForm != null)
                activeForm.Close();
            activeForm = childForm;
            childForm.TopLevel = false;
            childForm.FormBorderStyle = FormBorderStyle.None;
            childForm.Dock = DockStyle.Fill;
            panelChildForm.Controls.Add(childForm);
            panelChildForm.Tag = childForm;
            childForm.BringToFront();
            childForm.Show();
        }

        private void b2_Click(object sender, EventArgs e)
        {
           // openChildForm(new Form3());
        }

        private void b3_Click(object sender, EventArgs e)
        {
            openChildForm(new Form4());
        }

        private void b1_Click(object sender, EventArgs e)
        {
            openChildForm(new Form14());
        }

        private void b4_Click(object sender, EventArgs e)
        {
            openChildForm(new Form5());
        }

        private void panelChildForm_Paint(object sender, PaintEventArgs e)
        {

        }

        private void feesPerHoursTxt_TextChanged(object sender, EventArgs e)
        {

        }

        private void b5_Click(object sender, EventArgs e)
        {
            openChildForm(new Form6());
        }

        private void b6_Click(object sender, EventArgs e)
        {
          //  openChildForm(new Form7());
        }

        private void b7_Click(object sender, EventArgs e)
        {
        //    openChildForm(new Form8());
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form1 form = new Form1();
            form.Show();
        }

        private void b9_Click(object sender, EventArgs e)
        {
        //    openChildForm(new Form10());
        }

        private void b8_Click(object sender, EventArgs e)
        {
            openChildForm(new Form13());
        }

        private void empInfoBtn_Click(object sender, EventArgs e)
        {
            openChildForm(new EmployeeForm());
        }

        private void p1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            openChildForm(new Form11());
        }

        private void Form2_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            openChildForm(new Form16());
        }

        private void report_Click(object sender, EventArgs e)
        {
            openChildForm(new ReportForm());
        }
    }
}
