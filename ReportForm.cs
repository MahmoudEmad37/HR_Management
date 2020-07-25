using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CrystalDecisions.Shared;

namespace HR_Management
{
    
    public partial class ReportForm : Form
    {
        EmpReport er;
        public ReportForm()
        {
            InitializeComponent();
        }

        private void ReportForm_Load(object sender, EventArgs e)
        {
            er = new EmpReport();
            foreach (ParameterDiscreteValue v in er.ParameterFields[0].DefaultValues)
                DepName.Items.Add(v.Value);
        }

        private void GenReport_Click(object sender, EventArgs e)
        {
            er.SetParameterValue(0, DepName.Text);
            er.SetParameterValue(1, SWorkingHour.Text);
            er.SetParameterValue(2, EWorkingHour.Text);

            crystalReportViewer.ReportSource = er;
        }
    }
}
