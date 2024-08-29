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
    public partial class Purchase : Form
    {
        int ID, CompanyId, CategoryId;
        string Name, Cost, Price, Quantity;

        private void guna2Button1_Click(object sender, EventArgs e)
        {
            try
            {
                /* var con = Configuration.getInstance().getConnection();
                 SqlCommand cmd = new SqlCommand("INSERT INTO [dbo].[Cart](CustomerID,SparePartsID) VALUES (1,@Id)", con);
                 cmd.Parameters.AddWithValue("@SparePartsID", Id);
                 cmd.ExecuteNonQuery();*/
                var con = Configuration.getInstance().getConnection();
                using (SqlCommand cmd = new SqlCommand("insert into Customer values(1,@ID)", con))
                {
                    cmd.Parameters.AddWithValue("@ID", ID);
                    cmd.ExecuteNonQuery();
                }


                //cmd.Parameters.AddWithValue("@Contact", txtContactNumber.Text);
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message);
            }


        }

        public Purchase()
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
            lblData.ForeColor = ThemeColor.PrimaryColor;
        }
        private void Purchase_Load(object sender, EventArgs e)
        {
            LoadTheme();
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("select id , name, description,cost,price,quantity,companyID,categoryID from SpareParts");
            cmd.Connection = con;
            SqlDataReader sqlData = cmd.ExecuteReader();
            DataTable dataTable = new DataTable();
            dataTable.Load(sqlData);
            dataGridView2.DataSource = dataTable;
        }

        private void dataGridView2_RowHeaderMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                ID = int.Parse(dataGridView2.Rows[e.RowIndex].Cells[0].Value.ToString());
                Name = dataGridView2.Rows[e.RowIndex].Cells[1].Value.ToString();
                Cost = dataGridView2.Rows[e.RowIndex].Cells[2].Value.ToString();
                Price = dataGridView2.Rows[e.RowIndex].Cells[3].Value.ToString();
                Quantity = dataGridView2.Rows[e.RowIndex].Cells[4].Value.ToString();
                CompanyId = int.Parse(dataGridView2.Rows[e.RowIndex].Cells[5].Value.ToString());
                CategoryId = int.Parse(dataGridView2.Rows[e.RowIndex].Cells[6].Value.ToString());
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message);
            }

        }
    }
}
