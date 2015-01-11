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
        internal int _intCustomerID = 2013140002;
        internal string _strMemberShipType = string.Empty;
        internal float _fltCurrentBookAmount = 0;
        frmCustomerSearch _refToParent = null;

        public frmMultiIssue(string[] strElements,Form refToParent)
        {
            InitializeComponent();
            lblCustID.Text = strElements[0];
            lblCustomerName.Text = strElements[1];
            lblCustomerType.Text = Program.MainObj.GetDetailedCustomerType(strElements[8]);  
            if (strElements[8] == "R" || strElements[8] == "Rental")
            {
                lblAdvance.Text = "Advance :";
                lblAdvanceAmount.Text = strElements[6];
                lblBalance.Text = "Balance :";
                lblBalanceAmount.Text = strElements[7];                             
            }
            else if (strElements[8] == "N" || strElements[8] == "Non-Rental")
            {
                lblAdvance.Text = "Max Limit :";
                lblAdvanceAmount.Text = strElements[10];
                lblBalance.Text = "Used Limit :";
                lblBalanceAmount.Text = strElements[11];
                
            }
            _refToParent = (frmCustomerSearch)refToParent;

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
                BLSSchema.ctStockSearchDataTable ctSelectedStockItems = ((BLSSchema.ctStockSearchDataTable)(dgvStudentBooks.DataSource));

                ctSelectedStockItems.Rows.RemoveAt(e.RowIndex);
                dgvStudentBooks.DataSource = ctSelectedStockItems;
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

        private void btnAddIssueItem_Click(object sender, EventArgs e)
        {

        }

     
    }
}
