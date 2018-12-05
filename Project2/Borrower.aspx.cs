/* 
 *  Borrower Page
    Date        Programmer Name     Description
    11/9/2018   Cindy Holley        Create website for Cindy's Media inventory
                                    Add borrower, artist, media, contact pages and site.master
    11/13/2018  Cindy Holley        Add modification logs
    11/27/2018  Cindy Holley        Add modification logs to.cs pages

*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Borrower : System.Web.UI.Page
{
    public string borrower_fName { get; set; }
    public string borrower_lName { get; set; }
    public string borrower_phone { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtborrower_fName.Text = "";
            txtborrower_lName.Text = "";
            txtborrower_phone.Text = "";
            lblMessage.Text = "";
        }
    }//end Page_Load

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            Borrower borrower = new Borrower();

            borrower.borrower_fName = txtborrower_fName.Text;
            borrower.borrower_lName = txtborrower_lName.Text;
            borrower.borrower_phone = txtborrower_phone.Text;

            lblMessage.Text = "Thank you. Your name and phone number have been submitted.";

        }
    }//end btnSubmit_Click

    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtborrower_fName.Text = "";
        txtborrower_lName.Text = "";
        txtborrower_phone.Text = "";
        lblMessage.Text = "";

    }//end btnClear_Click

}//end class Borrow

