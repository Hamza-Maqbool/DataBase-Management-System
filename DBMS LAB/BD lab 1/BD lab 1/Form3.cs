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
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var con = Configuration.getInstance().getConnection();
            SqlCommand cmd = new SqlCommand("Insert into Students values (@name, @regNum, @department ,@session ,@address)", con);
            cmd.Parameters.AddWithValue("@name", (namBox.Text));
            cmd.Parameters.AddWithValue("@regNum", regBox.Text);
            cmd.Parameters.AddWithValue("@department", departmentBox.Text);
            cmd.Parameters.AddWithValue("@session", sessionBox.Text);
            cmd.Parameters.AddWithValue("@address", addressBox.Text);
            cmd.ExecuteNonQuery();
            MessageBox.Show("Successfully saved");
            Form3 f = new Form3();
            f.Close();
        }

        private void Form3_Load(object sender, EventArgs e)
        {

        }
    }
}
