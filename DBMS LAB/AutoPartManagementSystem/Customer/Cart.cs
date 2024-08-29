using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using AutoPartManagementSystem;

namespace FinalProject.Customer
{
    public partial class Cart : Form
    {
        public Cart()
        {
            InitializeComponent();
        }

        private void lblData_Click(object sender, EventArgs e)
        {

        }

        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

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
            lblData.ForeColor = ThemeColor.PrimaryColor;
        }

        private void Cart_Load(object sender, EventArgs e)
        {
            LoadTheme();
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("SELECT c.id,name,description,cost,price FROM SpareParts JOIN Cart AS c ON SpareParts.id = c.SparePartsID",con);
            cmd.Connection = con;
            SqlDataReader sqlData = cmd.ExecuteReader();
            DataTable dataTable = new DataTable();
            dataTable.Load(sqlData);
            dataGridView2.DataSource = dataTable;
        }
    }
}
