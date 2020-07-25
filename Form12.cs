using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

// --- Next 2 Lines to including oracle in VS 
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;

namespace HR_Management
{
    public partial class EmployeeForm : Form
    {
        // -- Global Variables
        string orclDB = "Data Source = ORCL; User Id = hr; Password = hr";
        OracleConnection connection;

        // -- Constractor
        public EmployeeForm()
        {
            InitializeComponent();
        }

        /* ---- test_form_Load Event ----
         * How it Works ?
         * Get All Employess IDs and Show them at Combo Box
         * Get All Departments IDs and Show them at Combo Box
         * */
        private void EmployeeForm_Load(object sender, EventArgs e)
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
                cmb_EmpID.Items.Add(dr[0]);
            }
            dr.Close();


            //-- For Department
            ID_com = new OracleCommand();
            ID_com.Connection = connection;
            ID_com.CommandText = "Select Dep_ID From Department";
            ID_com.CommandType = CommandType.Text;

            dr = ID_com.ExecuteReader();
            while (dr.Read())
            {
                cmb_DepID.Items.Add(dr[0]);
            }
            dr.Close();
        }

        /* ---- cmb_EmpID_SelectedIndexChanged Event ----
         * How it Works ?
         * Get Selected Employee ID and Show His InFO
         * */
        private void cmb_EmpID_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Emp_id = cmb_EmpID.Text;

            OracleCommand info_com = new OracleCommand();
            info_com.Connection = connection;
            info_com.CommandText = "Select * From Employee Where Emp_ID =: ID";
            info_com.Parameters.Add("ID", Emp_id);
            info_com.CommandType = CommandType.Text;
            OracleDataReader dr = info_com.ExecuteReader();
            if (dr.Read())
            {
                txt_EmpFName.Text = dr[1].ToString();
                txt_EmpLName.Text = dr[2].ToString();
                txt_EmpMail.Text = dr[3].ToString();
                txt_EmpPassword.Text = dr[4].ToString();
                txt_EmpAddress.Text = dr[5].ToString();
                txt_EmpMobile.Text = dr[6].ToString();
                txt_EmpWorkHours.Text = dr[7].ToString();
                txt_EmpSalary.Text = dr[8].ToString();
                cmb_DepID.Text = dr[9].ToString();

            }
            dr.Close();
        }

        /* ---- btn_insert_Click Event ----
         * How it Works ?
         * Insert new Employee 
         * at DataBase using Bind Variables Without Procedures
         * */
        private void btn_insert_Click(object sender, EventArgs e)
        {
            int Emp_id = int.Parse(cmb_EmpID.Text);
            string Emp_Fname = txt_EmpFName.Text;
            string Emp_LName = txt_EmpLName.Text;
            string Emp_Mail = txt_EmpMail.Text;
            string Emp_password = txt_EmpPassword.Text;
            string Emp_address = txt_EmpAddress.Text;
            string Emp_mobile = txt_EmpMobile.Text;
            string Emp_workhours = txt_EmpWorkHours.Text;
            string Emp_Salary = txt_EmpSalary.Text;
            string Emp_Department = cmb_DepID.Text;

            OracleCommand insert_com = new OracleCommand();
            insert_com.Connection = connection;
            insert_com.CommandText = "Insert into Employee Values (:Emp_id, :Emp_Fname, :Emp_LName, :Emp_Mail, :Emp_password, :Emp_address, :Emp_mobile, :Emp_workhours, :Emp_Salary, :Emp_Department)";
            insert_com.Parameters.Add("Emp_id", Emp_id);
            insert_com.Parameters.Add("Emp_Fname", Emp_Fname);
            insert_com.Parameters.Add("Emp_LName", Emp_LName);
            insert_com.Parameters.Add("Emp_Mail", Emp_Mail);
            insert_com.Parameters.Add("Emp_password", Emp_password);
            insert_com.Parameters.Add("Emp_address", Emp_address);
            insert_com.Parameters.Add("Emp_mobile", Emp_mobile);
            insert_com.Parameters.Add("Emp_workhours", Emp_workhours);
            insert_com.Parameters.Add("Emp_Salary", Emp_Salary);
            insert_com.Parameters.Add("Emp_Department", Emp_Department);
            insert_com.CommandType = CommandType.Text;
            int dr = insert_com.ExecuteNonQuery();
            if (dr != -1)
            {
                cmb_EmpID.Items.Add(Emp_id);
                MessageBox.Show("Employee added Successfully", "Adding Employee",
                    MessageBoxButtons.OK, MessageBoxIcon.Information);
            }

            cmb_EmpID.Text = "";
            cmb_DepID.Text = "";
            txt_EmpFName.Clear();
            txt_EmpLName.Clear();
            txt_EmpAddress.Clear();
            txt_EmpMail.Clear();
            txt_EmpMobile.Clear();
            txt_EmpPassword.Clear();
            txt_EmpSalary.Clear();
            txt_EmpWorkHours.Clear();
        }

        /* ---- btn_Update_Click Event ----
         * How it Works ?
         * according to Employee ID changes his info
         * at DataBase using Bind Variables Without Procedures
         * */
        private void btn_Update_Click(object sender, EventArgs e)
        {
            int Emp_id = int.Parse(cmb_EmpID.Text);
            string Emp_Fname = txt_EmpFName.Text;
            string Emp_LName = txt_EmpLName.Text;
            string Emp_Mail = txt_EmpMail.Text;
            string Emp_password = txt_EmpPassword.Text;
            string Emp_address = txt_EmpAddress.Text;
            string Emp_mobile = txt_EmpMobile.Text;
            string Emp_workhours = txt_EmpWorkHours.Text;
            string Emp_Salary = txt_EmpSalary.Text;
            string Emp_Department = cmb_DepID.Text;

            OracleCommand update_com = new OracleCommand();
            update_com.Connection = connection;
            update_com.CommandText = "Update Employee Set F_name =:Fname, L_name=:LName, EMail=:Mail , Emp_password=:pass , Address=:addre, mobile =:mob , Working_Hours =: workhours, Salary=:Sal, Dep_ID=:Dep Where Emp_Id =: ID";
            update_com.Parameters.Add("Fname", Emp_Fname);
            update_com.Parameters.Add("LName", Emp_LName);
            update_com.Parameters.Add("Mail", Emp_Mail);
            update_com.Parameters.Add("pass", Emp_password);
            update_com.Parameters.Add("addre", Emp_address);
            update_com.Parameters.Add("mob", Emp_mobile);
            update_com.Parameters.Add("workhours", Emp_workhours);
            update_com.Parameters.Add("Sal", Emp_Salary);
            update_com.Parameters.Add("Dep", Emp_Department);
            update_com.Parameters.Add("ID", Emp_id);
            update_com.CommandType = CommandType.Text;
            int dr = update_com.ExecuteNonQuery();
            if (dr != -1)
            {
                MessageBox.Show("Employee Updated Successfully", "Update Employee",
                    MessageBoxButtons.OK, MessageBoxIcon.Information);
            }

            cmb_EmpID.Text = "";
            cmb_DepID.Text = "";
            txt_EmpFName.Clear();
            txt_EmpLName.Clear();
            txt_EmpAddress.Clear();
            txt_EmpMail.Clear();
            txt_EmpMobile.Clear();
            txt_EmpPassword.Clear();
            txt_EmpSalary.Clear();
            txt_EmpWorkHours.Clear();

        }

        /* ---- btn_Delete_Click Event ----
         * How it Works ?
         * according to Employee ID Delete his info 
         * at DataBase using Bind Variables Without Procedures
         * */
        private void btn_Delete_Click(object sender, EventArgs e)
        {
            string Emp_id = cmb_EmpID.Text;

            OracleCommand delete_com = new OracleCommand();
            delete_com.Connection = connection;
            delete_com.CommandText = "Delete From Employee Where Emp_Id =: ID";
            delete_com.Parameters.Add("ID", Emp_id);
            delete_com.CommandType = CommandType.Text;
            int dr = delete_com.ExecuteNonQuery();
            if (dr != -1)
            {
                MessageBox.Show("Employee Deleted Successfully", "Deleting Employee",
                    MessageBoxButtons.OK, MessageBoxIcon.Information);
            }

            cmb_EmpID.Items.RemoveAt(cmb_EmpID.SelectedIndex);
            cmb_EmpID.SelectedIndex = -1;
            cmb_DepID.Text = "";
            txt_EmpFName.Clear();
            txt_EmpLName.Clear();
            txt_EmpAddress.Clear();
            txt_EmpMail.Clear();
            txt_EmpMobile.Clear();
            txt_EmpPassword.Clear();
            txt_EmpSalary.Clear();
            txt_EmpWorkHours.Clear();
        }

        /* ---- test_form_FormClosing Event ----
         * How it Works ?
         * Close The Connection
         * */
        private void EmployeeForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            connection.Dispose();
        }
    }
}
