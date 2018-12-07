/* Status Report Page

    Date         Programmer Name    Description
    11/28/2018   Cindy Holley       Create Status Report page

*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StatusReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }//end fn

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

}//end class