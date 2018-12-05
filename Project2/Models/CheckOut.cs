/* Class for CheckOut.aspx.cs and Confirm.aspx.cs Page

   Date         Programmer Name     Description
   11/28/2018   Cindy Holley        Create CheckOut/Confirm page

    
*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class CheckOut
{
    public int media_id { get; set; }
    public int borrower_id { get; set; }
    public DateTime checkout_date { get; set; }
    public DateTime return_date { get; set; }
    public string status_code { get; set; }
}
