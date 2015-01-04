using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace LibraryDesign_frontEndUI
{
    public partial class frmMultiIssue : Form
    {
        BLSSchema.ctStockDataTable _dtNewIssue = new BLSSchema.ctStockDataTable();
        internal int _intCustomerID = 2013140002;
        internal string _strMemberShipType = string.Empty;
        internal float _fltCurrentBookAmount = 0;

        public frmMultiIssue()
        {
            InitializeComponent();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            frmChooseStockItem frmChooseItem = new frmChooseStockItem(this);
            frmChooseItem.ShowDialog();
        }

        private void dgvStudentBooks_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex < 0 || e.ColumnIndex < 0)
                return;

            if (dgvStudentBooks.Columns[e.ColumnIndex].HeaderText == "Remove")
            {
                _dtNewIssue.Rows.RemoveAt(e.RowIndex);
                dgvStudentBooks.DataSource = _dtNewIssue;
            }
            else
            {
                return;
            }
        }

        private void btnIssue_Click(object sender, EventArgs e)
        {
            if (dgvStudentBooks.RowCount == 0)
            {
                MessageBox.Show("Please select the book(s) to issue.", "Error");
            }
        }

     
    }
}
