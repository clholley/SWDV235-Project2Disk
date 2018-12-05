<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
        CodeFile="BorrowerMaintenance.aspx.cs" Inherits="BorrowerMaintenance" %>

<asp:Content ID="Content" ContentPlaceHolderID="mainContentPlaceholder" runat="server">  

<!--Borrower Maintenance Page

    Date        Programmer Name     Description
    11/18/2018  Cindy Holley        Add borrower maintenance page with validation, connect to db
    11/27/2018  Cindy Holley        Add modification logs to.cs pages
--> 
    
    <!--View Borrower Table with edit and delete stored procedures and validation-->
    <div class="col-xs-12">
        <h3>These are all the current borrowers.</h3>
     
        <asp:GridView ID="grdCategories" runat="server" 
            AllowSorting="True" 
            AutoGenerateColumns="False" 
            DataKeyNames="borrower_id" 
            DataSourceID="SqlDataSource1" 
            CssClass="table table-bordered "
            OnPreRender="grdCategories_PreRender" 
            OnRowDeleted="grdCategories_RowDeleted" 
            OnRowUpdated="grdCategories_RowUpdated"
            AllowPaging="True" 
            BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                CellPadding="3" GridLines="Vertical">

            <AlternatingRowStyle BackColor="#DCDCDC" />

            <Columns>
                <asp:BoundField DataField="borrower_id" HeaderText="Borrower ID" SortExpression="borrower_id" 
                    ReadOnly="True" InsertVisible="False" />
               
                <asp:TemplateField HeaderText="Borrower's First Name" SortExpression="borrower_fname">
                    <EditItemTemplate>
                        <div class="col-xs-11 col-edit">
                            <asp:TextBox ID="txtGridborrower_fname" runat="server" 
                                MaxLength="15"
                                CssClass="form-control"
                                Text='<%# Bind("borrower_fname") %>'>
                            </asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvGridborrower_fname" runat="server" 
                            ControlToValidate="txtGridborrower_fname"
                            ValidationGroup="Edit"
                            ErrorMessage="Borrower's first name is required." Text="*"
                            CssClass="text-danger" >
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblGridborrower_fname" runat="server" 
                            Text='<%# Bind("borrower_fname") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle CssClass="col-xs-4" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Borrower's Last Name" SortExpression="borrower_lname">
                    <EditItemTemplate>
                        <div class="col-xs-11 col-edit">
                            <asp:TextBox ID="txtGridborrower_lname" runat="server" 
                                MaxLength="15"
                                CssClass="form-control"
                                Text='<%# Bind("borrower_lname") %>'> 
                            </asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvGridborrower_lname" runat="server" 
                            ControlToValidate="txtGridborrower_lname"
                            ValidationGroup="Edit"
                            ErrorMessage="Borrower's last name is required." Text="*"
                            CssClass="text-danger" >
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblGridborrower_lname" runat="server" 
                            Text='<%# Bind("borrower_lname") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle CssClass="col-xs-4" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Borrower's Phone Number" SortExpression="borrower_phone">
                    <EditItemTemplate>
                        <div class="col-xs-11 col-edit">
                            <asp:TextBox ID="txtGridborrower_phone" runat="server" 
                                MaxLength="15"
                                CssClass="form-control"
                                Text='<%# Bind("borrower_phone") %>'> 
                            </asp:TextBox>
                        </div>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblGridborrower_phone" runat="server" 
                            Text='<%# Bind("borrower_phone") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle CssClass="col-xs-4" />
                </asp:TemplateField> 

                <asp:CommandField CausesValidation="true"
                    ShowEditButton="true" 
                    ValidationGroup="Edit" >
                    <ItemStyle CssClass="col-xs-1" />
                </asp:CommandField>
                <asp:CommandField ShowDeleteButton="True" >
                    <ItemStyle CssClass="col-xs-1" />
                </asp:CommandField>
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
            DeleteCommand="DELETE FROM [Borrower] WHERE [borrower_id] = @borrower_id" 
            InsertCommand="INSERT INTO [Borrower] ([borrower_fname], [borrower_lname], [borrower_phone]) 
                VALUES (@borrower_fname, @borrower_lname, @borrower_phone)" 
            SelectCommand="SELECT * FROM [Borrower]" 
            UpdateCommand="UPDATE [Borrower] 
                SET [borrower_fname] = @borrower_fname, [borrower_lname] = @borrower_lname, [borrower_phone] = @borrower_phone            
                WHERE [borrower_id] = @borrower_id">

            <DeleteParameters>
                <asp:Parameter Name="borrower_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="borrower_fname" Type="String" />
                <asp:Parameter Name="borrower_lname" Type="String" />
                <asp:Parameter Name="borrower_phone" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="borrower_fname" Type="String" />
                <asp:Parameter Name="borrower_lname" Type="String" />
                <asp:Parameter Name="borrower_phone" Type="String" />
                <asp:Parameter Name="borrower_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:ValidationSummary ID="ValidationSummary1" runat="server"
            HeaderText="Please correct the following errors:" 
            ValidationGroup="Edit" 
            CssClass="text-danger" />  
    </div>

    <!--Form to add a new borrower with insert stored procedure and validation-->
    <div class="col-xs-9">
        <p><asp:Label ID="lblError" runat="server" 
                EnableViewState="false" 
                CssClass="text-danger"></asp:Label></p>

        <asp:DetailsView ID="DetailsView1" runat="server" 
            DefaultMode="Insert"
            CssClass="table table-bordered table-condensed" 
            AutoGenerateRows="False" 
            DataSourceID="SqlDataSource1"
            OnItemInserted="DetailsView1_ItemInserted1" 
            DataKeyNames="borrower_id" >
            
            <HeaderTemplate>
                <p>To add a new borrower, enter the information and click Insert</p>
            </HeaderTemplate>

            <Fields>
                <asp:TemplateField HeaderText="First Name" 
                    SortExpression="borrower_fname" >
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtborrower_fname" runat="server" width="400px"
                            Text='<%# Bind("borrower_fname") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvborrower_fname" runat="server" 
                            ControlToValidate="txtborrower_fname" 
                            ErrorMessage="First name is required."                            
                            Display="Dynamic" 
                            ValidationGroup="New"
                            CssClass="text-danger">
                        </asp:RequiredFieldValidator>
                    </InsertItemTemplate>   
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Last Name" SortExpression="borrower_lname">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtborrower_lname" runat="server" width="400px"
                            Text='<%# Bind("borrower_lname") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvborrower_lname" runat="server"                            
                            ControlToValidate="txtborrower_lname"  
                            ErrorMessage="Last name is required." 
                            Display="Dynamic" 
                            ValidationGroup="New"
                            CssClass="text-danger">
                        </asp:RequiredFieldValidator>
                    </InsertItemTemplate>   
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Phone Number" SortExpression="borrower_phone">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtborrower_phone" runat="server" width="400px"
                            Text='<%# Bind("borrower_phone") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvborrower_phone" runat="server"                            
                            ControlToValidate="txtborrower_phone" 
                            ErrorMessage="Phone number is required." 
                            Display="Dynamic"
                            ValidationGroup="New"
                            CssClass="text-danger">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revborrower_phone" runat="server" 
                            ControlToValidate="txtborrower_phone"
                            ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"
                            ErrorMessage="Must be a 10-digit phone number." 
                            Display="Dynamic" 
                            ValidationGroup="New"
                            CssClass="text-danger" >
                        </asp:RegularExpressionValidator>
                    </InsertItemTemplate>   
                </asp:TemplateField>

                <asp:CommandField ShowInsertButton="True" 
                    ValidationGroup="New" ButtonType="Button" />
            </Fields>
        </asp:DetailsView>
    </div>
</asp:Content>        
