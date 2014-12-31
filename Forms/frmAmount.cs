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
    public partial class frmAmount : Form
    {
        frmIssuePreview _frmParentref = null;
        frmReturnPreviews _frmReturnref = null;
        frmReturnPreviewOther _frmReturnOtherref = null;

        public frmAmount()
        {
            InitializeComponent();
        }

        public frmAmount(Form frmParentref,string strType)
        {
            InitializeComponent();
            if (strType == "Issue")
            {
                _frmParentref = (frmIssuePreview)frmParentref;
            }
            else if (strType == "Return")
            {
                _frmReturnref = (frmReturnPreviews)frmParentref;

            }
            else
            {
                _frmReturnOtherref = (frmReturnPreviewOther)frmParentref;
            }

        } 
        
        private void btnOK_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(txtAmount.Text))
                {
                    MessageBox.Show("Please enter the amount first", "Error");
                }
                else
                {
                    decimal value;
                    if (!Decimal.TryParse(txtAmount.Text, out value))
                    {
                        MessageBox.Show("Please enter valid amount", "Error");
                        return;
                    }
                    else
                    {
                        if (_frmReturnref != null)
                        {
                            _frmReturnref.fltCustomerPaidAmount = float.Parse(txtAmount.Text);
                            Close();
                        }
                        else if (_frmParentref != null)
                        {
                            _frmParentref.fltCustomerPaidAmount = float.Parse(txtAmount.Text);
                            Close();
                        }
                        else
                        {
                            _frmReturnOtherref.fltCustomerPaidAmount = float.Parse(txtAmount.Text);
                            Close();
                        }

                    }
                }
            }
            catch (Exception ex)
            {
                //log exception
                Utility.WriteToFile(ex);

                MessageBox.Show(ex.ToString());
            }
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            if (_frmReturnref != null)
            {
                _frmReturnref.blnCustomerCanceled = true;
            }
            else if(_frmParentref != null)
            {
                _frmParentref.blnCustomerCanceled = true;
            }
            else
            {
                _frmReturnOtherref.blnCustomerCanceled = true;
            }
            Close();
        }

        private void frmAmount_Load(object sender, EventArgs e)
        {
            if (_frmReturnref != null)
            {
                _frmReturnref.blnCustomerCanceled = false;
            }
            else if (_frmParentref != null)
            {
                _frmParentref.blnCustomerCanceled = false;
            }
            else
            {
                _frmReturnOtherref.blnCustomerCanceled = false;
            }
        }
    }
}
