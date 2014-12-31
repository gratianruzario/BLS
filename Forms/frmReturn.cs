using LibraryDesign_frontEndUI.Forms;
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
    public partial class frmReturn : Form
    {
        int _intRowIndex = -1;
        int _intColumnIndex = -1;
        internal int _intCurrentSelectedCount = 0;

        internal bool _blnCancelledFromPreview = false;

        frmCustomerSearch _frmParentref = null;

        BLSSchema _Bschema = new BLSSchema();

        BLSSchema.ctIssueBookListDataTable _dtSelectedReturnBooks = new BLSSchema.ctIssueBookListDataTable();

        string _strCustomerID = string.Empty;
        string _strMobile = string.Empty;
        string _strAdvance = string.Empty;
        string _strBalance = string.Empty;
        string _strMemberShipType = string.Empty;
        internal int _intBookCount = 0;
        
        public frmReturn(string[] strelements,frmCustomerSearch frmRef)
        {
            InitializeComponent();
            lblCustID.Text = _strCustomerID = strelements[0];
            _strMobile = strelements[1];
            _strAdvance = strelements[2];
            _strBalance = strelements[3];
            _strMemberShipType = strelements[4];
            lblCustomerName.Text = strelements[5];
            lblCustomerType.Text = Program.MainObj.GetDetailedCustomerType(strelements[4]);
            lblAdvance.Text = strelements[6];
            lblBalanceAmount.Text = strelements[7];            
            lblAmountPayable.Text = "0";
            lblBookCount.Text = "";
            _frmParentref = frmRef;
            Search();
        }

        public void Search()
        {
            try
            {
                _Bschema.ctIssueBookList.Clear();
                BusinessLogic BLgc = new BusinessLogic();
                BLgc.GetIssueDetails(_Bschema, _strCustomerID);
                if (_Bschema.ctIssueBookList.Rows.Count > 0)
                {
                    dgvCustDetails.DataSource = _Bschema.ctIssueBookList;
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

        private void dgvCustDetails_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            if (e.RowIndex != -1&& e.ColumnIndex != -1)
            {
                _intRowIndex = e.RowIndex;
                _intColumnIndex = e.ColumnIndex;

                string strCustomerID = dgvCustDetails.Rows[_intRowIndex].Cells[0].Value.ToString();

                if (e.ColumnIndex == dgvCustDetails.ColumnCount - 1)
                {
                    BLSSchema.ctCustomerRow foundRow = (BLSSchema.ctCustomerRow)_Bschema.ctCustomer.Rows.Find(strCustomerID);

                    if (foundRow != null)
                    {
                        string[] strCustElements = new string[6];
                        strCustElements[0] = foundRow.CustomerID.ToString();
                        strCustElements[1] = foundRow.CustName;
                        strCustElements[2] = foundRow.DOB;
                        strCustElements[3] = foundRow.Student_Mobile;
                        strCustElements[4] = foundRow.EmailID;
                        strCustElements[5] = foundRow.CollegeName;
                        
                    }
                    else
                    {
                       // MessageBox.Show("Some internal error occured.", "Error");
                    }
                }
            }
        }



        private void dgvCustDetails_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            BusinessLogic BL = new BusinessLogic();
            if (e.RowIndex != -1&&e.ColumnIndex!=-1)
            {

                #region[Save grid values to variables]

                string strTitle = dgvCustDetails.Rows[e.RowIndex].Cells["Title"].Value.ToString();

                string strAuthor = dgvCustDetails.Rows[e.RowIndex].Cells["Author"].Value.ToString();

                string strEdition = dgvCustDetails.Rows[e.RowIndex].Cells["Edition"].Value.ToString();

                string strPublisher = dgvCustDetails.Rows[e.RowIndex].Cells["Publisher"].Value.ToString();

                float fltPrice = float.Parse(dgvCustDetails.Rows[e.RowIndex].Cells["BookPrice"].Value.ToString());

                string strUID = dgvCustDetails.Rows[e.RowIndex].Cells["HistoryUID"].Value.ToString();

                int intBookCount = int.Parse(dgvCustDetails.Rows[e.RowIndex].Cells["BookCount"].Value.ToString());

                #endregion

                if (dgvCustDetails.Columns[e.ColumnIndex].HeaderText.ToString() == "Select")
                {
                    #region [Perform Non Rental Return]

                    if (_strMemberShipType == "Non-Rental")
                    {
                        if (MessageBox.Show("Are you sure.you want to return this book?", "Return Confirmation", MessageBoxButtons.YesNo) == DialogResult.Yes)
                        {

                            /**********************************************************************************
                             * Modified By : Shankar
                             * Changed int CustomerID to string CustomerID
                            **********************************************************************************/
                            if(BL.PerformReturnProcess(_strCustomerID,strTitle, strAuthor, strEdition,
                                strPublisher,fltPrice, strUID, intBookCount))
                            {
                                Search();

                                _frmParentref.Search(_frmParentref._strLastQuery);

                                MessageBox.Show("Return Process Completed", "Success");

                            }
                            else
                            {
                                MessageBox.Show("Issue details not found", "Error");
                            }
                        }
                    }
                    #endregion

                    #region [Perform Rental Return]
                    else if (_strMemberShipType == "Rental" || _strMemberShipType == "R")
                    {                                               
                        if (!_blnCancelledFromPreview)
                        {                           
                            /**********************************************************************************
                             * Modified By : Shankar
                             * Changed int CustomerID to string CustomerID
                            **********************************************************************************/
                            //if (BL.PerformReturnProcessForRental(_strCustomerID, strTitle, strAuthor, strEdition,
                            //    strPublisher,fltPrice,strUID, intBookCount,float.Parse(lblAdvance.Text),
                            //    float.Parse(lblBalanceAmount.Text)))
                            //{
                            //    Search();

                            //    _frmParentref.Search(_frmParentref._strLastQuery);

                            //    MessageBox.Show("Return Process Completed", "Success");
                               
                            //}
                            //else
                            //{
                            //    MessageBox.Show("Issue details not found", "Error");
                            //}''

                            //dgvCustDetails row = dgvCustDetails.Rows[e.RowIndex];
                            //int CustomerId = int.parse(row.Cells[0].Text);// to get the column value
                            //CheckBox checkbox1 = (CheckBox)dgvCustDetails.Rows[e.RowIndex].;                           
                            
                            //if (dgvCustDetails.Rows[e.RowIndex].Cells[e.ColumnIndex].Value.ToString() == "Select")
                            //{
                            //    dgvCustDetails.Rows[e.RowIndex].Cells[e.ColumnIndex].Value = "Deselect";
                            //    dgvCustDetails.Rows[e.RowIndex].DefaultCellStyle.BackColor = System.Drawing.Color.Lime;
                            //}
                            //else
                            //{
                            //    dgvCustDetails.Rows[e.RowIndex].Cells[e.ColumnIndex].Value = "Select";
                            //    dgvCustDetails.Rows[e.RowIndex].DefaultCellStyle.BackColor = System.Drawing.Color.SeaGreen;
                            //}
                            
                            //if (dgvCustDetails.Rows[e.RowIndex].DefaultCellStyle.BackColor == System.Drawing.Color.Lime)
                            //{
                            //    dgvCustDetails.Rows[e.RowIndex].DefaultCellStyle.BackColor = System.Drawing.Color.SeaGreen;
                            //}
                            //else
                            //{
                            //    dgvCustDetails.Rows[e.RowIndex].DefaultCellStyle.BackColor = System.Drawing.Color.Lime;                                
                            //}
                             

                        }

                    }
                    #endregion

                    #region [Perform Other Return]
                    else //Type is other.
                    {
                        frmReturnPreviewOther frmRtnPrv = new frmReturnPreviewOther(lblCustomerName.Text, lblAdvance.Text, lblBalanceAmount.Text,
                            dgvCustDetails.Rows[e.RowIndex],this);
                        frmRtnPrv.ShowDialog();
                        if (!_blnCancelledFromPreview)
                        {
                            /**********************************************************************************
                             * Modified By : Shankar
                             * Changed int CustomerID to string CustomerID
                            **********************************************************************************/
                            if (BL.PerformReturnProcessForOther(_strCustomerID, strTitle, strAuthor, strEdition,
                                strPublisher,fltPrice, strUID, intBookCount, float.Parse(lblAdvance.Text),
                                float.Parse(lblBalanceAmount.Text)))
                            {
                                Search();

                                _frmParentref.Search(_frmParentref._strLastQuery);

                                MessageBox.Show("Return Process Completed", "Success");

                            }
                            else
                            {
                                MessageBox.Show("Issue details not found", "Error");
                            }
                        }


                    }
                    #endregion
                }
                else if (dgvCustDetails.Columns[e.ColumnIndex].HeaderText.ToString() == "Remove")
                {
                    //condition here.
                    if (MessageBox.Show("Are you sure.you want to delete this record?", "Delete Confirmation?", MessageBoxButtons.YesNo) == DialogResult.Yes)
                    {
                        if (_strMemberShipType == "Non-Rental")
                        {
                            /**********************************************************************************
                             * Modified By : Shankar
                             * Changed int CustomerID to string CustomerID
                            **********************************************************************************/
                            if (BL.DeleteIssuedBookEntries_NonRental(_strCustomerID, strTitle, strAuthor, 
                                strEdition,strPublisher, fltPrice,strUID, intBookCount, 
                                bool.Parse(dgvCustDetails.Rows[e.RowIndex].Cells["EarlyIssue"].Value.ToString())))
                            {
                                Search();

                                _frmParentref.Search(_frmParentref._strLastQuery);

                                MessageBox.Show("Book entry has been removed", "Success");

                            }
                            else
                            {
                                MessageBox.Show("Some error occured while removing book entry.\n Please try after some time.", "Error");
                            }
                        }
                        else
                        {
                            /**********************************************************************************
                             * Modified By : Shankar
                             * Changed int CustomerID to string CustomerID
                            **********************************************************************************/
                            if (BL.DeleteIssuedBookEntries_Rental(_strCustomerID, strTitle, strAuthor,
                                strEdition, strPublisher,fltPrice,strUID, intBookCount, 
                                bool.Parse(dgvCustDetails.Rows[e.RowIndex].Cells["EarlyIssue"].Value.ToString())))
                            {                               
                                MessageBox.Show("Book entry has been removed", "Success");
                                Search();
                                _frmParentref.Search(_frmParentref._strLastQuery);

                            }
                            else
                            {
                                MessageBox.Show("Some error occured while removing book entry.\n Please try after some time.", "Error");
                            }

                        }
                    }

                }
                 
            }

        }

        private void dgvCustDetails_RowPostPaint(object sender, DataGridViewRowPostPaintEventArgs e)
        {
            using (SolidBrush b = new SolidBrush(dgvCustDetails.RowHeadersDefaultCellStyle.ForeColor))
            {
                e.Graphics.DrawString((e.RowIndex + 1).ToString(System.Globalization.CultureInfo.CurrentUICulture), e.InheritedRowStyle.Font, b, e.RowBounds.Location.X + 7, e.RowBounds.Location.Y + 4);
            }
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            _blnCancelledFromPreview = false;
        }

        private void UpdateAmounts(DataGridViewRow row,int intIndex,bool blnReturnOrCancel)
        {
            int intExtraDays = 0;
            float fltTotalPrice = 0;
            float fltPercentAmount = 0;
            float fltAmountPayable = 0;
            float fltTotalAmountPayable = 0;
            float fltBalance = 0;
            try
            {
                intExtraDays = GetExtraDays(row.Cells["ReturnDate"].Value.ToString());
                fltTotalPrice = float.Parse(row.Cells["BookCount"].Value.ToString()) * float.Parse(row.Cells["BookPrice"].Value.ToString());
                fltPercentAmount = fltTotalPrice / 4;
                fltAmountPayable = fltTotalPrice - fltPercentAmount;
                float fltCurrentPayableAmount = 0;
                if (blnReturnOrCancel)
                {
                    fltCurrentPayableAmount = float.Parse(lblAmountPayable.Text) + fltAmountPayable;
                }
                else
                {
                    fltCurrentPayableAmount = float.Parse(lblAmountPayable.Text) - fltAmountPayable;
                }
                lblAmountPayable.Text = fltCurrentPayableAmount.ToString();
                if (blnReturnOrCancel)
                {
                    _intBookCount += int.Parse(row.Cells["BookCount"].Value.ToString());
                }
                else
                {
                    _intBookCount -= int.Parse(row.Cells["BookCount"].Value.ToString());
                }
                lblBookCount.Text = _intBookCount.ToString();

            }
            catch (Exception ex)
            {
                //log exception
                Utility.WriteToFile(ex, "Error occured while doing return calculations");

                MessageBox.Show("Error occured while doing return calculations", "Error");
            }
        }


        private int GetExtraDays(string strReturndate)
        {
            try
            {
                int intExtradays = -1;
                DateTime dtReturnDate = DateTime.Parse(strReturndate);
                if (dtReturnDate >= DateTime.Now)
                {
                    intExtradays = 0;
                }
                else if (dtReturnDate < DateTime.Now)
                {
                    intExtradays = DateTime.Now.Subtract(dtReturnDate).Days;

                }
                return intExtradays;
            }
            catch (Exception ex)
            {
                //log exception
                Utility.WriteToFile(ex, "Error occured while calcualting extra days");

                MessageBox.Show("Error occured while calcualting extra days", "Error");
                return -1;
            }

        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (_intBookCount > 0)
            {
                frmReturnPreviews frmRtnPrv = new frmReturnPreviews(this);
                frmRtnPrv.txtPreviousAdvance.Text = lblAdvance.Text;
                frmRtnPrv.txtPreviousBalance.Text = lblBalanceAmount.Text;
                frmRtnPrv.txtCustName.Text = lblCustomerName.Text;
                frmRtnPrv.BookCount.Text = lblBookCount.Text;
                frmRtnPrv.txtAmountPayable.Text = lblAmountPayable.Text;
                frmRtnPrv.ShowDialog();
            }
            else
            {
                MessageBox.Show("Please select atleast one book to return", "Return List empty");
                return;
            }
        }        

        /// <summary>
        /// Select the rows and set background color when checkbox is checked
        /// </summary>
        /// <param name="dgvItemsDetails"></param>
        /// <param name="intRowIndex"></param>
        /// <param name="boolIsChecked"></param>
        private void SetDataGridViewRowAsHighlighted(DataGridView dgvCustDetails, int intRowIndex, bool boolIsChecked)
        {
            UpdateAmounts(dgvCustDetails.Rows[intRowIndex], intRowIndex, boolIsChecked);

            if (boolIsChecked)
            {

                //dgvCustDetails.Rows[intRowIndex].Selected = true;
                dgvCustDetails.Rows[intRowIndex].DefaultCellStyle.BackColor = Color.Lime;
            }
            else
            {
                //dgvCustDetails.Rows[intRowIndex].Selected = false;
                dgvCustDetails.Rows[intRowIndex].DefaultCellStyle.BackColor = Color.SeaGreen;
            }
        }

        private void VerifyCheckedOrNot(DataGridView dgvCustDetails,int intRowIndex,int intColumnIndex)
        {
            DataGridViewRow dgvrow = dgvCustDetails.Rows[intRowIndex];

            DataGridViewCheckBoxCell checkbox = (DataGridViewCheckBoxCell)dgvrow.Cells[intColumnIndex];

            bool blnIsChecked = false;

            if (checkbox != null)
            {
                blnIsChecked = (bool)checkbox.EditedFormattedValue;

                if (Convert.ToBoolean(blnIsChecked) == true)
                {    
                    int intBookCount = int.Parse(dgvCustDetails.Rows[intRowIndex].Cells["BookCount"].Value.ToString());
                    if (intBookCount > 1)
                    {
                        frmReturnDetails frmRDetails = new frmReturnDetails(this);
                        frmRDetails._intCurrentCount = intBookCount;
                        frmRDetails.ShowDialog();
                        BLSSchema.ctIssueBookListRow row = _dtSelectedReturnBooks.NewctIssueBookListRow();
                        row.CustomerID = dgvCustDetails.Rows[intRowIndex].Cells["Title"].Value.ToString();
                        row.Title = dgvCustDetails.Rows[intRowIndex].Cells["Title"].Value.ToString();
                        row.Author = dgvCustDetails.Rows[intRowIndex].Cells["Author"].Value.ToString();
                        row.Edition = dgvCustDetails.Rows[intRowIndex].Cells["Edition"].Value.ToString();
                        row.Publisher = dgvCustDetails.Rows[intRowIndex].Cells["Publisher"].Value.ToString();
                        row.IssueDate = dgvCustDetails.Rows[intRowIndex].Cells["IssueDate"].Value.ToString();
                        row.BookCount = _intCurrentSelectedCount.ToString();
                        row.BookPrice = dgvCustDetails.Rows[intRowIndex].Cells["BookPrice"].Value.ToString();
                        //row.RecieptNumber = dgvCustDetails.Rows[intRowIndex].Cells["RecieptNumber"].Value.ToString();
                        row.ReturnDate = dgvCustDetails.Rows[intRowIndex].Cells["ReturnDate"].Value.ToString();
                        row.HistoryUID = dgvCustDetails.Rows[intRowIndex].Cells["HistoryUID"].Value.ToString();
                        row.IssueType = dgvCustDetails.Rows[intRowIndex].Cells["IssueType"].Value.ToString();
                        //row.EarlyIssue = bool.Parse(dgvCustDetails.Rows[intRowIndex].Cells["EarlyIssue"].Value.ToString());
                        _dtSelectedReturnBooks.Rows.Add(row);
                        dgvSelectedBooks.DataSource = _dtSelectedReturnBooks;


                    }
                    SetDataGridViewRowAsHighlighted(dgvCustDetails, intRowIndex, true);
                }
                else
                {                   
                    SetDataGridViewRowAsHighlighted(dgvCustDetails, intRowIndex, false);
                }
                dgvCustDetails.Refresh();
            }
        }

        private void dgvCustDetails_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dgvCustDetails.Columns[e.ColumnIndex].HeaderText == "Select")
            {
                VerifyCheckedOrNot(dgvCustDetails, e.RowIndex, e.ColumnIndex);
            }
        
        }

        private void dgvCustDetails_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            // If the column is the Artist column, check the 
            // value. 
            if (this.dgvCustDetails.Columns[e.ColumnIndex].Name == "IssueDate" ||
                this.dgvCustDetails.Columns[e.ColumnIndex].Name == "Returndate")
            {
                if (e.Value != null)
                {
                    // Check for the string "pink" in the cell.
                    string stringValue = (string)e.Value;
                    e.Value = stringValue.Substring(0, 10);

                }
            }
        }
        
    }
}
