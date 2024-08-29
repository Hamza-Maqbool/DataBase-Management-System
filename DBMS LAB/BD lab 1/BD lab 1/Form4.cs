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

namespace BD_lab_1
{
    public partial class Form4 : Form
    {
        public Form4()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("Select * from Students", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
        }

        private void Form4_Load(object sender, EventArgs e)
        {
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("Select * from Students", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
            dataGridView1.AllowUserToAddRows = false;
            DataGridViewButtonColumn buttonColumn = new DataGridViewButtonColumn();
            dataGridView1.Columns.Insert(5, buttonColumn);
            buttonColumn.HeaderText = "Delete Row";
            buttonColumn.Text = "DELETE";
            buttonColumn.Width = 100;
            buttonColumn.UseColumnTextForButtonValue = true;
            DataGridViewButtonColumn buttonColumn1 = new DataGridViewButtonColumn();
            dataGridView1.Columns.Insert(6, buttonColumn1);
            buttonColumn1.HeaderText = "Update Row";
            buttonColumn1.Text = "UPDATE";
            buttonColumn1.Width = 100;
            buttonColumn1.UseColumnTextForButtonValue = true;
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if(e.ColumnIndex == 5)
            {
                DataGridViewRow row = dataGridView1.Rows[e.RowIndex];
                var con = Configuration.getInstance().getConnection();
                SqlCommand cmd = new SqlCommand("DELETE FROM Students WHERE regNum = @regNum", con);
                /*cmd.Parameters.AddWithValue("@name", Name);*/
                cmd.Parameters.AddWithValue("regNum", row.Cells["regNum"].Value);
                cmd.ExecuteNonQuery();
                MessageBox.Show("Successfully deleted");

            }
                   
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 6)
            {
                for(int i= 0; i <= dataGridView1.Rows.Count - 1; i++)
                {
                    var con = Configuration.getInstance().getConnection();
                    SqlCommand cmd = new SqlCommand("UPDATE Students SET name = @name, department = @department, address = @address WHERE regNum = @regNum", con);
                    cmd.Parameters.AddWithValue("@name", dataGridView1.Rows[i].Cells[0].Value);
                    cmd.Parameters.AddWithValue("@regNum", dataGridView1.Rows[i].Cells[1].Value);
                    cmd.Parameters.AddWithValue("@department", dataGridView1.Rows[i].Cells[2].Value);
                    cmd.Parameters.AddWithValue("@session", dataGridView1.Rows[i].Cells[3].Value);
                    cmd.Parameters.AddWithValue("@address", dataGridView1.Rows[i].Cells[4].Value);
                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Successfully Updated");
                }
                
            }

        }

        private void dataGridView1_AutoSizeColumnsModeChanged(object sender, DataGridViewAutoSizeColumnsModeEventArgs e)
        {

        }
    }
}

