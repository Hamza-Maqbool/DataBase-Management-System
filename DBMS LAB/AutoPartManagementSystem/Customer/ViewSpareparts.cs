using System;
using System.Collections.Generic;
using System.ComponentModel;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Configuration;
using System.Collections;
using FinalProject.Customer;
using System.Data.SqlClient;
using AutoPartManagementSystem;

namespace FinalProject.Customer
{
    public partial class ViewSpareparts : Form
    {
        public ViewSpareparts()
        {
            InitializeComponent();
        }
        private void LoadTheme()
        {
            foreach (Control btns in this.Controls)
            {
                if (btns.GetType() == typeof(Button))
                {
                    Button btn = (Button)btns;
                    btn.BackColor = ThemeColor.PrimaryColor;
                    btn.ForeColor = Color.White;
                    btn.FlatAppearance.BorderColor = ThemeColor.SecondaryColor;
                }
            }
            //lblData.ForeColor = ThemeColor.PrimaryColor;
        }


        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void ViewSpareparts_Load(object sender, EventArgs e)
        {
            LoadTheme();
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("select id , name, description,cost,price,quantity,companyID,categoryID from SpareParts");
            cmd.Connection = con;
            SqlDataReader sqlData = cmd.ExecuteReader();
            DataTable dataTable = new DataTable();
            dataTable.Load(sqlData);
            dataGridView1.DataSource = dataTable;

        }

    }
}
