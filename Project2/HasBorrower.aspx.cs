/* HasBorrower Page

   Date         Programmer Name     Description
   11/28/2018   Cindy Holley        Create HasBorrower page
   12/6/2018    Cindy Holley        Update HasBorrower page 
*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HasBorrower : System.Web.UI.Page
{
    public int media_id { get; set; }
    public int borrower_id { get; set; }
    public string borrower_fname { get; set; }
    public string borrower_lname { get; set; }
    public DateTime checkout_date { get; set; }
    public DateTime return_date { get; set; }
    public string status_code { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void grdCategories_PreRender(object sender, EventArgs e)
    {
        grdCategories.HeaderRow.TableSection = TableRowSection.TableHeader;
    }

    protected void grdCategories_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        
    }

    protected void grdCategories_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
    }


    protected void DetailsView1_ItemInserted1(object sender, DetailsViewInsertedEventArgs e)
    {       
        if (e.Exception != null)
        {
            lblMessage.Text = DatabaseErrorMessage(e.Exception.Message);
            e.ExceptionHandled = true;
        }
        else 
        {
            lblMessage.Text = "Thank you. Your request to borrow my media has been submitted.";

            //status_code = "OUT";

        }

            
    }//end 

    private string DatabaseErrorMessage(string errorMsg)
    {
        return $"<b>A database error has occurred:</b> {errorMsg}";
    }//end

    protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {

    }
}//end class