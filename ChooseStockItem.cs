using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using LibraryDesign_frontEndUI.Forms;
using LibraryDesign_frontEndUI.Library;

namespace LibraryDesign_frontEndUI
{
    public partial class frmChooseStockItem : Form
    {
        #region [Variables]
        int _intRowIndex = 0;
        int _intColumnIndex = 0;
        bool _blnPurposeEarlyIssue = false;
        frmMultiIssue _frmParentRef = null;

        string _strEdition = string.Empty;
        string _strTitle = string.Empty;
        string _strPublisher = string.Empty;
        string _strAuthor = string.Empty;
        string _strYear = string.Empty;
        internal BLSSchema _BSchema = new BLSSchema();
      
        string _strColumns = "[ISBN],[Title],[Author],[Year],[Edition],[Publisher],[Count],[OriginalPrice],[Discount],[PurchasePrice],[PriceChangable],[OutCount]";

        #endregion

        public frmChooseStockItem(frmMultiIssue frmRef)
        {
            InitializeComponent();
            _frmParentRef = frmRef;

            _BSchema.ctStockSearch.Clear();
            SearchButtonClick();
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            _BSchema.ctStockSearch.Clear();
            SearchButtonClick();
        }

        internal void SearchButtonClick(string strQuery = null)
        {
            try
            {
                BusinessLogic BLgc = new BusinessLogic();

                if (strQuery == null)
                {
                    if (CheckForEmpty() == false)
                    {
                        strQuery = ConstructQuery(true);

                    }
                    else
                    {
                        strQuery = DefaultQuery();
                    }
                }

                dgvStockSearchResult.DataSource = null;
                _BSchema.ctStockSearch.Clear();
                BLgc.GetStock(_BSchema, strQuery);
                dgvStockSearchResult.DataSource = _BSchema.ctStockSearch;

                /*
                 * if (_frmParentRef == null && _frmPlaceOrderRef == null && _frmAddStockRef == null)
                {
                    dgvStockSearchResult.Columns[dgvStockSearchResult.ColumnCount - 1].Visible = false;
                }
                else
                {
                    dgvStockSearchResult.Columns[dgvStockSearchResult.ColumnCount - 1].Visible = true;
                }
                 */
            }
            catch (Exception ex)
            {
                //log exception
                Utility.WriteToFile(ex, "Error occured while retrieving record");

                MessageBox.Show("Error occured while retrieving records.Please try after some time", "Error");
            }
        }

        private string DefaultQuery()
        {
            if (string.IsNullOrWhiteSpace(txtRecordCount.Text) != true)
            {
                string strQ = "SELECT TOP(" + txtRecordCount.Text + ") " + _strColumns + " FROM TblStock ";
                return (_blnPurposeEarlyIssue) ? strQ : strQ + "WHERE[Count] > 0";
            }
            else
            {
                string strQ = "SELECT TOP(30) " + _strColumns + " FROM TblStock ";
                return (_blnPurposeEarlyIssue) ? strQ : strQ + "WHERE[Count] > 0";
            }
        }

        private string ConstructQuery(bool blnIsEmpty)
        {
            string strQuery = string.Empty;
            string strBaseQuery = string.Empty;
            string strCondition = string.Empty;
            bool blnConditionAdded = false;

            strBaseQuery = DefaultQuery();

            if (_strEdition != string.Empty && chkMatchExact.Checked)
            {
                strCondition += " Edition  =  '" + _strEdition + "'";
                blnConditionAdded = true;
            }
            else if (_strEdition != string.Empty && !chkMatchExact.Checked)
            {
                if (blnConditionAdded)
                {
                    strCondition += " AND Edition  LIKE  '" + _strEdition + "%'";
                }
                else
                {
                    strCondition += "Edition  LIKE  '" + _strEdition + "%'";
                    blnConditionAdded = true;
                }

            }

            if (_strTitle != string.Empty && chkMatchExact.Checked)
            {
                if (blnConditionAdded)
                {
                    strCondition += " AND Title  =  '" + _strTitle + "'";
                }
                else
                {
                    strCondition += "Title  =  '" + _strTitle + "'";
                    blnConditionAdded = true;
                }
            }
            else if (_strTitle != string.Empty && !chkMatchExact.Checked)
            {
                if (blnConditionAdded)
                {
                    strCondition += " AND Title  LIKE  '" + _strTitle + "%'";
                }
                else
                {
                    strCondition += "Title  LIKE  '" + _strTitle + "%'";
                    blnConditionAdded = true;
                }
            }

            if (_strPublisher != string.Empty && chkMatchExact.Checked)
            {
                if (blnConditionAdded)
                {
                    strCondition += " AND Publisher  =  '" + _strPublisher + "'";
                }
                else
                {
                    strCondition += "Publisher  =  '" + _strPublisher + "'";
                    blnConditionAdded = true;
                }
            }
            else if (_strPublisher != string.Empty && !chkMatchExact.Checked)
            {
                if (blnConditionAdded)
                {
                    strCondition += " AND Publisher  LIKE  '" + _strPublisher + "%'";
                }
                else
                {
                    strCondition += "Publisher  LIKE  '" + _strPublisher + "%'";
                    blnConditionAdded = true;
                }
            }

            if (_strAuthor != string.Empty && chkMatchExact.Checked)
            {
                if (blnConditionAdded)
                {
                    strCondition += " AND Author  =  '" + _strAuthor + "'";
                }
                else
                {
                    strCondition += "Author  =  '" + _strAuthor + "'";
                    blnConditionAdded = true;
                }

            }
            else if (_strAuthor != string.Empty && !chkMatchExact.Checked)
            {
                if (blnConditionAdded)
                {
                    strCondition += " AND [Author]  LIKE  '" + _strAuthor + "%'";
                }
                else
                {
                    strCondition += "[Author]  LIKE  '" + _strAuthor + "%'";
                    blnConditionAdded = true;
                }
            }


            if (string.IsNullOrEmpty(strCondition) == false)
            {
                strQuery = (_blnPurposeEarlyIssue) ? strBaseQuery + " WHERE " + strCondition : strBaseQuery + " AND " + strCondition;
            }

            return strQuery;
        }

        public bool CheckForEmpty()
        {
            bool blnEmpty = true;

            _strEdition = string.Empty;
            if (!string.IsNullOrWhiteSpace(txtEdition.Text))
            {
                _strEdition = txtEdition.Text;
                blnEmpty = false;
            }

            _strTitle = string.Empty;
            if (!string.IsNullOrWhiteSpace(txtTitle.Text))
            {
                _strTitle = txtTitle.Text;
                blnEmpty = false;
            }

            _strPublisher = string.Empty;
            if (!string.IsNullOrWhiteSpace(txtPublisher.Text))
            {
                _strPublisher = txtPublisher.Text;
                blnEmpty = false;
            }

            _strAuthor = string.Empty;
            if (!string.IsNullOrWhiteSpace(txtAuthor.Text))
            {
                _strAuthor = txtAuthor.Text;
                blnEmpty = false;
            }

            return blnEmpty;

        }

        private void dgvStockSearchResult_RowPostPaint(object sender, DataGridViewRowPostPaintEventArgs e)
        {
            using (SolidBrush b = new SolidBrush(dgvStockSearchResult.RowHeadersDefaultCellStyle.ForeColor))
            {
                e.Graphics.DrawString((e.RowIndex + 1).ToString(System.Globalization.CultureInfo.CurrentUICulture), e.InheritedRowStyle.Font, b, e.RowBounds.Location.X + 7, e.RowBounds.Location.Y + 4);
            }
        }

        private void dgvStockSearchResult_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            BLSSchema.ctStockSearchDataTable _ctSelectedStockItems = new BLSSchema.ctStockSearchDataTable();

            if (e.RowIndex != -1)
            {
                _intRowIndex = e.RowIndex;
                _intColumnIndex = e.ColumnIndex;

                try
                {

                    if (e.ColumnIndex == dgvStockSearchResult.ColumnCount - 1 && _frmParentRef != null)
                    {
                        BLSSchema.ctStockSearchDataTable ctStockSearch = ((BLSSchema.ctStockSearchDataTable)(dgvStockSearchResult.DataSource));
                        
                        BLSSchema.ctStockSearchRow stockSearchRow = _ctSelectedStockItems.NewctStockSearchRow();

                        stockSearchRow.ISBN = dgvStockSearchResult.Rows[e.RowIndex].Cells["ISBN"].Value.ToString();
                        stockSearchRow.Title = dgvStockSearchResult.Rows[e.RowIndex].Cells["Title"].Value.ToString();
                        stockSearchRow.Author = dgvStockSearchResult.Rows[e.RowIndex].Cells["Author"].Value.ToString();
                        stockSearchRow.Year = dgvStockSearchResult.Rows[e.RowIndex].Cells["Year"].Value.ToString();
                        stockSearchRow.Edition = dgvStockSearchResult.Rows[e.RowIndex].Cells["Edition"].Value.ToString();
                        stockSearchRow.Publisher = dgvStockSearchResult.Rows[e.RowIndex].Cells["Publisher"].Value.ToString();
                        stockSearchRow.Count = int.Parse(dgvStockSearchResult.Rows[e.RowIndex].Cells["Count"].Value.ToString());

                        stockSearchRow.OriginalPrice = dgvStockSearchResult.Rows[e.RowIndex].Cells["OriginalPrice"].Value.ToString();
                        stockSearchRow.PurchasePrice = dgvStockSearchResult.Rows[e.RowIndex].Cells["PurchasePrice"].Value.ToString();


                        stockSearchRow.PriceChangable = bool.Parse(dgvStockSearchResult.Rows[e.RowIndex].Cells["PriceChangable"].Value.ToString());
                        stockSearchRow.Discount = double.Parse(dgvStockSearchResult.Rows[e.RowIndex].Cells["Discount"].Value.ToString());
                        stockSearchRow.OutCount = int.Parse(dgvStockSearchResult.Rows[e.RowIndex].Cells["OutCount"].Value.ToString());

                        if (_frmParentRef.dgvStudentBooks.Rows.Count > 0)
                        {
                            _ctSelectedStockItems = ((BLSSchema.ctStockSearchDataTable)(_frmParentRef.dgvStudentBooks.DataSource));
                        }


                        //Check if the book is already selected
                        bool blnIsAlreadySelected = false;
                        foreach (DataRow dr in _ctSelectedStockItems.Rows)
                        {
                            var array1 = stockSearchRow.ItemArray;
                            var array2 = dr.ItemArray;

                            if (array1.SequenceEqual(array2))
                            {
                                blnIsAlreadySelected = true;
                                break;
                            }                          
                        }
                        if (blnIsAlreadySelected)
                        {
                            MessageBox.Show("This book is already selected.", "Error");
                            return;
                        }
                        
                        //Add the selected row to the parent gridview for issuing
                        if (_ctSelectedStockItems.Rows.Count == 0 || !blnIsAlreadySelected)
                        {
                            _ctSelectedStockItems.Rows.Add(stockSearchRow.ItemArray);
                        }
                        _frmParentRef.dgvStudentBooks.DataSource = _ctSelectedStockItems;

                        Close();
                    }
                }
                catch (Exception ex)
                {
                    //log exception
                    Utility.WriteToFile(ex, "Error occured while retrieving record");

                    MessageBox.Show("Could not  retrieve records.Please try after some time", "Error");
                }
            }
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void Number_Validation(object sender, KeyPressEventArgs e)
        {
            Char pressedKey = e.KeyChar;
            if (Char.IsNumber(pressedKey) || (int)pressedKey == 8)
            {
                // Allow input.
                e.Handled = false;
            }
            else
                // Stop the character from being entered into the control since not a letter, nor punctuation, nor a space.
                e.Handled = true;
        }

        private void frmCustomerSearch1_Activated(object sender, EventArgs e)
        {
            SearchButtonClick();
        }

        private void frmCustomerSearch1_KeyPress(object sender, KeyPressEventArgs e)
        {
            Char pressedKey = e.KeyChar;
            if (pressedKey == '\r')
            {
                _BSchema.ctStockSearch.Clear();
                SearchButtonClick();
            }
        }

        private void txtTitle_TextChanged(object sender, EventArgs e)
        {
            _BSchema.ctStockSearch.Clear();
            SearchButtonClick();
        }

        private void txtPublisher_TextChanged(object sender, EventArgs e)
        {
            _BSchema.ctStockSearch.Clear();
            SearchButtonClick();
        }

        private void txtEdition_TextChanged(object sender, EventArgs e)
        {
            _BSchema.ctStockSearch.Clear();
            SearchButtonClick();
        }

        private void txtAuthor_TextChanged(object sender, EventArgs e)
        {
            _BSchema.ctStockSearch.Clear();
            SearchButtonClick();
        }

        private void chkMatchExact_CheckedChanged(object sender, EventArgs e)
        {
            SearchButtonClick();
        }
    }
}
