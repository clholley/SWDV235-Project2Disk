/* Borrower Maintenance Page

    Date        Programmer Name     Description
    11/18/2018  Cindy Holley        Add borrower maintenance page with validation, connect to db
    11/27/2018  Cindy Holley        Add modification logs to.cs pages

*/ 

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class BorrowerMaintenance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }//end

    private string DatabaseErrorMessage(string errorMsg)
    {
        return $"<b>A database error has occurred:</b> {errorMsg}";
    }//end

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }//end

    protected void grdCategories_PreRender(object sender, EventArgs e)
    {
        grdCategories.HeaderRow.TableSection = TableRowSection.TableHeader;
    }//end

    protected void grdCategories_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = DatabaseErrorMessage(e.Exception.Message);
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
    }//end

    protected void grdCategories_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = DatabaseErrorMessage(e.Exception.Message);
            e.ExceptionHandled = true;
        }
    }//end

    protected void DetailsView1_ItemInserted1(object sender, DetailsViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = DatabaseErrorMessage(e.Exception.Message);
            e.ExceptionHandled = true;
        }
    }//end 
}//end class BorrowerMaintenance
