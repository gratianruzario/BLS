﻿using LibraryDesign_frontEndUI.Forms;
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
        bool _blnIsChecked = false;

        internal bool _blnCancelledFromPreview = false;

        frmCustomerSearch _frmParentref = null;

        BLSSchema _Bschema = new BLSSchema();

        BLSSchema.ctIssueBookListDataTable _dtSelectedReturnBooks = new BLSSchema.ctIssueBookListDataTable();
        BLSSchema.ctTempDataTable _dtTemp = new BLSSchema.ctTempDataTable();

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
            lblBookCount.Text = "0";
            _frmParentref = frmRef;
            _Bschema.ctTemp.Clear();
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

                string strPublisher = dgvCustDetails.Rows[e.RowIndex].Cells["BookPublisher"].Value.ToString();

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

        private void UpdateAmounts(bool blnAdd,float fltRfAmount)
        {            
            try
            {
                float fltCurrentPayableAmount = 0;
                int inttotalBookCount = 0;
                if (blnAdd)
                {
                    fltCurrentPayableAmount = float.Parse(lblAmountPayable.Text) + float.Parse(txtRefundAmt.Text);
                    inttotalBookCount = int.Parse(lblBookCount.Text) + int.Parse(txtBookCount.Text);                   
                }
                else
                {                       
                    fltCurrentPayableAmount = float.Parse(lblAmountPayable.Text) - fltRfAmount;
                    inttotalBookCount = int.Parse(lblBookCount.Text) - int.Parse(txtBookCount.Text);  
                }
                lblAmountPayable.Text = fltCurrentPayableAmount.ToString();
                lblBookCount.Text = inttotalBookCount.ToString();
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
        }        

        /// <summary>
        /// Select the rows and set background color when checkbox is checked
        /// </summary>
        /// <param name="dgvItemsDetails"></param>
        /// <param name="intRowIndex"></param>
        /// <param name="boolIsChecked"></param>
        private void SetDataGridViewRowAsHighlighted(DataGridView dgvCustDetails, int intRowIndex, bool boolIsChecked)
        {  

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

        private void VerifyCheckedOrNot(DataGridView dgvCustDetails,int intRowIndex,int intColumnIndex,bool blnIsCheck)
        {
            
            if (blnIsCheck)
            {
                _intRowIndex = intRowIndex;
                DataGridViewRow dgvrow = dgvCustDetails.Rows[intRowIndex];

                DataGridViewCheckBoxCell checkbox = (DataGridViewCheckBoxCell)dgvrow.Cells[intColumnIndex];
                              
                _blnIsChecked = false;

                if (checkbox != null)
                {
                    _blnIsChecked = (bool)checkbox.EditedFormattedValue;

                    if (Convert.ToBoolean(_blnIsChecked) == true)
                    {
                        txtIssueDate.Text = dgvCustDetails.Rows[intRowIndex].Cells["IssueDate"].Value.ToString().Substring(0, 10);
                        txtReturnDate.Text = dgvCustDetails.Rows[intRowIndex].Cells["Returndate"].Value.ToString().Substring(0, 10);
                        int intExtraDays = GetExtraDays(dgvCustDetails.Rows[intRowIndex].Cells["Returndate"].Value.ToString());
                        if (intExtraDays > 0)
                        {
                            txtExtraDays.BackColor = Color.Red;
                        }
                        else
                        {
                            txtExtraDays.BackColor = Color.White;
                        }
                        txtExtraDays.Text = intExtraDays.ToString();
                        txtBookPrice.Text = dgvCustDetails.Rows[intRowIndex].Cells["BookPrice"].Value.ToString();
                        txtBookCount.Text = dgvCustDetails.Rows[intRowIndex].Cells["BookCount"].Value.ToString();
                        float fltAmt = CalCulateRefundAmount(float.Parse(txtBookPrice.Text), float.Parse(txtPercentDeduction.Text));
                        txtRefundAmt.Text = fltAmt.ToString();
                        _blnIsChecked = true;
                    }
                    else
                    {
                        ClearTexts();
                    }
                    dgvCustDetails.Refresh();
                }
            }
            //else
            //{
            //    int intBookCount = int.Parse(dgvSelectedBooks.Rows[intRowIndex].Cells["SelectedBookCount"].Value.ToString());
            //    //if (intBookCount > 1)
            //   // {
            //        txtIssueDate.Text = dgvSelectedBooks.Rows[intRowIndex].Cells["SelectedIssueDate"].Value.ToString().Substring(0, 10);
            //        txtReturnDate.Text = dgvSelectedBooks.Rows[intRowIndex].Cells["SelectedReturndate"].Value.ToString().Substring(0, 10);
            //        int intExtraDays = GetExtraDays(dgvSelectedBooks.Rows[intRowIndex].Cells["SelectedReturndate"].Value.ToString());                    
            //        txtExtraDays.Text = intExtraDays.ToString();
            //        txtBookPrice.Text = dgvSelectedBooks.Rows[intRowIndex].Cells["SelectedBookPrice"].Value.ToString();
            //        txtBookCount.Text = dgvSelectedBooks.Rows[intRowIndex].Cells["SelectedBookCount"].Value.ToString();
            //        float fltAmt = CalCulateRefundAmount(float.Parse(txtBookPrice.Text), float.Parse(txtPercentDeduction.Text));
            //        fltAmt = fltAmt * float.Parse(txtBookCount.Text);
            //        txtRefundAmt.Text = fltAmt.ToString();
            //    //}               
            //}
            
        }

        private float CalCulateRefundAmount(float fltPrice, float fltPercntDeduction)
        {
            float RefundAmount = 0;
            float PercntAmt = (fltPrice / 100) * fltPercntDeduction;
            RefundAmount = fltPrice - PercntAmt;
            return RefundAmount;
        }

        private void dgvCustDetails_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dgvCustDetails.Columns[e.ColumnIndex].HeaderText == "Select")
            {
                VerifyCheckedOrNot(dgvCustDetails, e.RowIndex, e.ColumnIndex,true);
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

        private void btnAdd_Click(object sender, EventArgs e)
        {            
            try
            {
                if (_blnIsChecked)
                {
                    UpdateAmounts(true,0);
                    BLSSchema.ctIssueBookListRow row = _dtSelectedReturnBooks.NewctIssueBookListRow();
                    BLSSchema.ctTempRow Temprow = _dtTemp.NewctTempRow();
                    row.CustomerID = dgvCustDetails.Rows[_intRowIndex].Cells["CustomerID"].Value.ToString();
                    row.Title = dgvCustDetails.Rows[_intRowIndex].Cells["Title"].Value.ToString();
                    row.Author = dgvCustDetails.Rows[_intRowIndex].Cells["Author"].Value.ToString();
                    row.Edition = dgvCustDetails.Rows[_intRowIndex].Cells["Edition"].Value.ToString();
                    row.Publisher = dgvCustDetails.Rows[_intRowIndex].Cells["BookPublisher"].Value.ToString();
                    row.IssueDate = dgvCustDetails.Rows[_intRowIndex].Cells["IssueDate"].Value.ToString();
                    row.BookCount = txtBookCount.Text;
                    row.BookPrice = dgvCustDetails.Rows[_intRowIndex].Cells["BookPrice"].Value.ToString();
                    //row.RecieptNumber = dgvCustDetails.Rows[intRowIndex].Cells["RecieptNumber"].Value.ToString();
                    row.ReturnDate = dgvCustDetails.Rows[_intRowIndex].Cells["ReturnDate"].Value.ToString();
                    row.HistoryUID = dgvCustDetails.Rows[_intRowIndex].Cells["HistoryUID"].Value.ToString();
                    row.IssueType = dgvCustDetails.Rows[_intRowIndex].Cells["IssueType"].Value.ToString();
                    //row.EarlyIssue = bool.Parse(dgvCustDetails.Rows[intRowIndex].Cells["EarlyIssue"].Value.ToString());
                    Temprow.ID = dgvCustDetails.Rows[_intRowIndex].Cells["HistoryUID"].Value.ToString();
                    Temprow.RefundAmount = txtRefundAmt.Text;
                    _dtSelectedReturnBooks.Rows.Add(row);
                    _dtTemp.Rows.Add(Temprow);
                    dgvSelectedBooks.DataSource = _dtSelectedReturnBooks;
                    _Bschema.ctIssueBookList.RemovectIssueBookListRow(_Bschema.ctIssueBookList[_intRowIndex]);
                     ClearTexts();
                }
            }
            catch(Exception ex)
            {
                MessageBox.Show("Error occured while selecting record to return","Error");
            }

        }        

        private void ClearTexts()
        {
            txtIssueDate.Text = "";
            txtReturnDate.Text = "";
            txtBookPrice.Text = "";
            txtBookCount.Text = "";
            txtPercentDeduction.Text = "25";
            txtRefundAmt.Text = "";
            txtExtraDays.Text = "";
            txtExtraDays.BackColor = Color.White;
        }

        private void UpdateRespctdValues()
        {
            float fltAmt = CalCulateRefundAmount(float.Parse(txtBookPrice.Text), float.Parse(txtPercentDeduction.Text));
            fltAmt = fltAmt * float.Parse(txtBookCount.Text);
            txtRefundAmt.Text = fltAmt.ToString();
        }

        private void txtPercentDeduction_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(txtPercentDeduction.Text) && !string.IsNullOrWhiteSpace(txtBookPrice.Text))
            {
                UpdateRespctdValues();
            }
        }

        private void txtBookCount_KeyPress(object sender, KeyPressEventArgs e)
        {
            Program.MainObj.Number_Validation(sender, e);
        }

        private void txtPercentDeduction_KeyPress(object sender, KeyPressEventArgs e)
        {
            Program.MainObj.Number_Validation(sender, e);
        }

        private void dgvSelectedBooks_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            // If the column is the Artist column, check the 
            // value. 
            if (this.dgvSelectedBooks.Columns[e.ColumnIndex].Name == "SelectedIssueDate" ||
                this.dgvSelectedBooks.Columns[e.ColumnIndex].Name == "SelectedReturndate")
            {
                if (e.Value != null)
                {
                    // Check for the string "pink" in the cell.
                    string stringValue = (string)e.Value;
                    e.Value = stringValue.Substring(0, 10);

                }
            }
        }

        private void dgvSelectedBooks_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex != -1&&e.ColumnIndex!=-1)
            {
                if (dgvSelectedBooks.Columns[e.ColumnIndex].HeaderText.ToString() == "Remove")
                {
                    //VerifyCheckedOrNot(dgvSelectedBooks, e.RowIndex, e.ColumnIndex, false);
                    DataRow[] dt = _dtTemp.Select("ID = '" + dgvSelectedBooks.Rows[e.RowIndex].Cells["SelectedHistoryUID"].Value.ToString() + "'");
                    float fltAmount = float.Parse(dt[0]["RefundAmount"].ToString());
                    UpdateAmounts(false,fltAmount);                   
                    _Bschema.ctIssueBookList.ImportRow(_dtSelectedReturnBooks[e.RowIndex]);
                    _dtSelectedReturnBooks.RemovectIssueBookListRow(_dtSelectedReturnBooks[e.RowIndex]);
                    _dtTemp.RemovectTempRow((BLSSchema.ctTempRow)dt[0]);
                    ClearTexts();
                }
            }
        }

        private void btnReturn_Click(object sender, EventArgs e)
        {
            if (_dtSelectedReturnBooks.Rows.Count > 0)
            {
                frmReturnPreviews frmRtnPrv = new frmReturnPreviews(this);
                frmRtnPrv.txtPreviousAdvance.Text = lblAdvance.Text;
                frmRtnPrv.txtPreviousBalance.Text = lblBalanceAmount.Text;
                frmRtnPrv.txtCustName.Text = lblCustomerName.Text;
                frmRtnPrv.BookCount.Text = lblBookCount.Text;
                frmRtnPrv.txtAmountPayable.Text = lblAmountPayable.Text;
                frmRtnPrv.ShowDialog();
                if (!_blnCancelledFromPreview)
                {
                    ReturnRentalBooks();
                }
             
            }
            else
            {
                MessageBox.Show("Please select atleast one book to return", "Return List empty");
                return;
            }
        }

        private void ReturnRentalBooks()
        {
            BusinessLogic BL = new BusinessLogic();
            
                float fltadvance = 0;
                float fltBalance = 0;
                string strTitle = string.Empty;
                string strAuthor = string.Empty;
                string strEdition = string.Empty;
                string strPublisher = string.Empty;
                float fltPrice = 0;
                string strUID = string.Empty;
                bool blnReturnstatus = false;
                int intRowCount = _dtSelectedReturnBooks.Rows.Count;
                for (int intI = 0; intI < intRowCount; intI++)
                {
                    if (intI == intRowCount - 1)
                    {
                        fltadvance = float.Parse(lblAdvance.Text);
                        fltBalance = float.Parse(lblBalanceAmount.Text);
                    }

                    strTitle = _dtSelectedReturnBooks[intI]["Title"].ToString();
                    strAuthor = _dtSelectedReturnBooks[intI]["Author"].ToString();
                    strEdition = _dtSelectedReturnBooks[intI]["Edition"].ToString();
                    strPublisher = _dtSelectedReturnBooks[intI]["Publisher"].ToString();
                    fltPrice = float.Parse(_dtSelectedReturnBooks[intI]["BookPrice"].ToString());
                    strUID = _dtSelectedReturnBooks[intI]["HistoryUID"].ToString();
                    
                    if (BL.PerformReturnProcessForRental(_strCustomerID, strTitle, strAuthor, strEdition,
                            strPublisher, fltPrice, strUID, 1, fltadvance, fltBalance))
                    {                      
                        blnReturnstatus = true;                         
                    }
                    
                }

                if (blnReturnstatus)
                {
                    _dtSelectedReturnBooks.Rows.Clear();                    
                    
                    Search(); 

                    _frmParentref.Search(_frmParentref._strLastQuery);

                    MessageBox.Show("Return Process Completed", "Success");
                }
                else
                {
                    MessageBox.Show("Error while returning one or more books.\nPlease repeat the return process", "Success");
                }
            
            

        }
        
    }
}
