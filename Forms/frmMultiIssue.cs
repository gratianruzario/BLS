using LibraryDesign_frontEndUI.Library;
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
        internal string _strMemberShipType = string.Empty;
        internal float _fltCurrentBookAmount = 0;
        frmCustomerSearch _refToParent = null;

        BLSSchema _Bschema = new BLSSchema();
        internal BLSSchema.ctIssueBookListDataTable _dtAlreadyIssuedBooks = new BLSSchema.ctIssueBookListDataTable();
        internal BLSSchema.ctStockSearchDataTable _dtSelectedStock = new BLSSchema.ctStockSearchDataTable();

        public frmMultiIssue(string[] strElements,Form refToParent)
        {
            InitializeComponent();
            _dtSelectedStock.Clear();
            lblCustID.Text = strElements[0];
            lblCustomerName.Text = strElements[1];
            _strMemberShipType = strElements[8];
            lblCustomerType.Text = Program.MainObj.GetDetailedCustomerType(strElements[8]);
            pbCustImage.ImageLocation = strElements[12];
            if (strElements[8] == "R" || strElements[8] == "Rental")
            {
                lblAdvance.Text = "Advance :";
                lblAdvanceAmount.Text = strElements[6];
                lblBalance.Text = "Balance :";
                lblBalanceAmount.Text = strElements[7];
                lblRecieptNumber.Visible = false;
                lblRcptNum.Visible = false;
                          
            }
            else if (strElements[8] == "N" || strElements[8] == "Non-Rental")
            {
                lblAdvance.Text = "Max Limit :";
                lblAdvanceAmount.Text = strElements[10];
                lblBalance.Text = "Used Limit :";
                lblBalanceAmount.Text = strElements[11];
                lblRecieptNumber.Text = strElements[11];
                lblRcptNum.Text = "Current Used Limit :";
                
            }
            _refToParent = (frmCustomerSearch)refToParent;
            Search();
            
        }

        public void Search()
        {
            try
            {
               _dtAlreadyIssuedBooks.Clear();
                BusinessLogic BLgc = new BusinessLogic();
                BLgc.GetIssueDetails(_dtAlreadyIssuedBooks, lblCustID.Text);
                if (_dtAlreadyIssuedBooks.Rows.Count > 0 && lblCustomerType.Text == "Rental")
                {
                    dgvStudentIssuedBooks.DataSource =_dtAlreadyIssuedBooks;
                    lblRecieptNumber.Text = _dtAlreadyIssuedBooks[0]["RecieptNumber"].ToString();
                }
                else
                {
                    // lblCustomerStatus.Text = "No Data found.";
                }
            }
            catch (Exception ex)
            {
                //log exception
                Utility.WriteToFile(ex, "Error occured while retrieving record");

                MessageBox.Show("Error occured while retrieving record : " + ex.ToString(), "Error");
            }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            float Limit = 0;
            if (_strMemberShipType == "N")
            {
                Limit = float.Parse(lblRecieptNumber.Text);
            }
            _dtSelectedStock.Clear();
            frmChooseStockItem frmChooseItem = new frmChooseStockItem(this);
            frmChooseItem._MaxLimit = float.Parse(lblAdvanceAmount.Text);
            frmChooseItem._UsedLimit = float.Parse(lblBalanceAmount.Text);
            frmChooseItem._strType =_strMemberShipType;
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

        private void dgvStudentIssuedBooks_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            // If the column is the Artist column, check the 
            // value. 
            if (dgvStudentIssuedBooks.Columns[e.ColumnIndex].Name == "IssueDate" ||
                dgvStudentIssuedBooks.Columns[e.ColumnIndex].Name == "Returndate")
            {
                if (e.Value != null)
                {
                    // Check for the string "pink" in the cell.
                    string stringValue = (string)e.Value;
                    e.Value = stringValue.Substring(0, 10);

                }
            }
        }

        private void dgvStudentBooks_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            // If the column is the Artist column, check the 
            // value. 
            if (dgvStudentBooks.Columns[e.ColumnIndex].Name == "IssueDate" ||
                dgvStudentBooks.Columns[e.ColumnIndex].Name == "Returndate")
            {
                if (e.Value != null)
                {
                    // Check for the string "pink" in the cell.
                    string stringValue = (string)e.Value;
                    e.Value = stringValue.Substring(0, 10);

                }
            }
        }

        internal void RefreshGrid()
        {
            dgvStudentBooks.DataSource = _dtSelectedStock;
            dgvStudentBooks.Refresh();
        }

     
    }
}
