namespace HR_Management
{
    partial class ReportForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.SWorkingHour = new System.Windows.Forms.TextBox();
            this.DepName = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.EWorkingHour = new System.Windows.Forms.TextBox();
            this.GenReport = new System.Windows.Forms.Button();
            this.crystalReportViewer = new CrystalDecisions.Windows.Forms.CrystalReportViewer();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.ForeColor = System.Drawing.SystemColors.ActiveCaption;
            this.label1.Location = new System.Drawing.Point(114, 24);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(140, 20);
            this.label1.TabIndex = 0;
            this.label1.Text = "Department Name";
            // 
            // SWorkingHour
            // 
            this.SWorkingHour.Location = new System.Drawing.Point(808, 24);
            this.SWorkingHour.Name = "SWorkingHour";
            this.SWorkingHour.Size = new System.Drawing.Size(151, 26);
            this.SWorkingHour.TabIndex = 1;
            // 
            // DepName
            // 
            this.DepName.FormattingEnabled = true;
            this.DepName.Location = new System.Drawing.Point(272, 24);
            this.DepName.Name = "DepName";
            this.DepName.Size = new System.Drawing.Size(182, 28);
            this.DepName.TabIndex = 2;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.ForeColor = System.Drawing.SystemColors.ActiveCaption;
            this.label2.Location = new System.Drawing.Point(614, 24);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(176, 20);
            this.label2.TabIndex = 3;
            this.label2.Text = "Range of Working Hour";
            // 
            // EWorkingHour
            // 
            this.EWorkingHour.Location = new System.Drawing.Point(992, 24);
            this.EWorkingHour.Name = "EWorkingHour";
            this.EWorkingHour.Size = new System.Drawing.Size(151, 26);
            this.EWorkingHour.TabIndex = 4;
            // 
            // GenReport
            // 
            this.GenReport.Location = new System.Drawing.Point(1291, 12);
            this.GenReport.Name = "GenReport";
            this.GenReport.Size = new System.Drawing.Size(271, 51);
            this.GenReport.TabIndex = 5;
            this.GenReport.Text = "Generate Report";
            this.GenReport.UseVisualStyleBackColor = true;
            this.GenReport.Click += new System.EventHandler(this.GenReport_Click);
            // 
            // crystalReportViewer
            // 
            this.crystalReportViewer.ActiveViewIndex = -1;
            this.crystalReportViewer.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.crystalReportViewer.Cursor = System.Windows.Forms.Cursors.Default;
            this.crystalReportViewer.Location = new System.Drawing.Point(-3, 63);
            this.crystalReportViewer.Name = "crystalReportViewer";
            this.crystalReportViewer.Size = new System.Drawing.Size(1590, 814);
            this.crystalReportViewer.TabIndex = 6;
            // 
            // ReportForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(32)))), ((int)(((byte)(30)))), ((int)(((byte)(45)))));
            this.ClientSize = new System.Drawing.Size(1924, 1050);
            this.Controls.Add(this.crystalReportViewer);
            this.Controls.Add(this.GenReport);
            this.Controls.Add(this.EWorkingHour);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.DepName);
            this.Controls.Add(this.SWorkingHour);
            this.Controls.Add(this.label1);
            this.Name = "ReportForm";
            this.Text = "ReportForm";
            this.Load += new System.EventHandler(this.ReportForm_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox SWorkingHour;
        private System.Windows.Forms.ComboBox DepName;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox EWorkingHour;
        private System.Windows.Forms.Button GenReport;
        private CrystalDecisions.Windows.Forms.CrystalReportViewer crystalReportViewer;
    }
}