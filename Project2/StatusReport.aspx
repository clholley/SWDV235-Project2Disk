<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
    CodeFile="StatusReport.aspx.cs" Inherits="StatusReport" %>

<asp:Content ID="Content" ContentPlaceHolderID="mainContentPlaceholder" runat="server">   

<!--Status Report Page

    Date         Programmer Name    Description
    11/28/2018   Cindy Holley       Create Status Report page 

--> 

<!--Table of media with edit and delete stored procedures and validation-->
    <div class="col-xs-12">
        <h3>Movies and music that have been checked out: </h3>

        <asp:GridView ID="grdCategories" runat="server" 
            AllowSorting="True" 
            AutoGenerateColumns="False" 
            DataKeyNames="checkout_date,media_id,media_name,borrower_fname,borrower_lname" 
            DataSourceID="SqlDataSource1" 
            CssClass="table table-bordered "
            OnPreRender="grdCategories_PreRender" 
            OnRowDeleted="grdCategories_RowDeleted" 
            OnRowUpdated="grdCategories_RowUpdated"
            AllowPaging="True" 
            BackColor="White" 
            BorderColor="#999999" 
            BorderStyle="None" 
            BorderWidth="1px" 
            CellPadding="3" 
            GridLines="Vertical">

            <AlternatingRowStyle BackColor="#DCDCDC" />

            <Columns>
                <asp:BoundField DataField="media_id" HeaderText="Media ID" ReadOnly="True" SortExpression="media_id" />
                <asp:BoundField DataField="media_name" HeaderText="Media Name" ReadOnly="True" SortExpression="media_name" />
                <asp:BoundField DataField="status_code" HeaderText="Status" ReadOnly="True" SortExpression="status_code" />
                <asp:BoundField DataField="borrower_fname" HeaderText="First Name" ReadOnly="True" SortExpression="borrower_fname" />
                <asp:BoundField DataField="borrower_lname" HeaderText="Last Name" ReadOnly="True" SortExpression="borrower_lname" />
                <asp:BoundField DataField="checkout_date" HeaderText="Checkout Date" ReadOnly="true" SortExpression="checkout_date" />
                <asp:BoundField DataField="return_date" HeaderText="Return Date" SortExpression="return_date" />
            
            </Columns>

            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#3f3fd9" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:disk_inventory_2ConnectionString %>" 
            SelectCommand="SELECT HasBorrower.media_id, media_name, status_code, borrower_fname, borrower_lname, checkout_date, return_date  
                FROM HasBorrower 
                JOIN Media 
                    ON HasBorrower.media_id = Media.media_id
                JOIN Borrower
                    ON HasBorrower.borrower_id = Borrower.borrower_id
                WHERE Media.status_code = 'OUT' 
                ORDER BY HasBorrower.media_id" >
                
        </asp:SqlDataSource>

    </div>
</asp:Content>
