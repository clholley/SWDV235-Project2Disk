﻿/*  Media Page

    Date        Programmer Name     Description
    11/9/2018   Cindy Holley        Create website for Cindy's Media inventory
                                    Add borrower, artist, media, contact pages and site.master
    11/13/2018  Cindy Holley        Add modification logs
    11/18/2018  Cindy Holley        Update media pages with stored procedures and validation, connect to db
    11/27/2018  Cindy Holley        Add modification logs to .cs pages

*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Media : System.Web.UI.Page 
{
    private string DatabaseErrorMessage(string errorMsg)
    {
        return $"<b>A database error has occurred:</b> {errorMsg}";
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
        if (e.Exception != null)
        {
            lblError.Text = DatabaseErrorMessage(e.Exception.Message);
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
    }

    protected void grdCategories_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = DatabaseErrorMessage(e.Exception.Message);
            e.ExceptionHandled = true;
        }

    }

    protected void DetailsView1_ItemInserted1(object sender, DetailsViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblError.Text = DatabaseErrorMessage(e.Exception.Message);
            e.ExceptionHandled = true;
        }
    }//end 

}//end class Media

