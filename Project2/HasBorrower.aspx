<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
    CodeFile="HasBorrower.aspx.cs"  Inherits="HasBorrower" %>

<asp:Content ID="Content" ContentPlaceHolderID="mainContentPlaceholder" runat="server">   

<!--HasBorrower Page

    Date        Programmer Name     Description
    11/28/2018   Cindy Holley       Create HasBorrower page 
    12/6/2018    Cindy Holley       Update HasBorrower page 
     
--> 

<!--Table of media with edit and delete stored procedures and validation-->
    <div class="col-xs-12">

        <h2>Would you like to borrow my stuff?</h2>
        <br />
        
        <p>This is the list of movies and music that are currently available to check out: </p>

        <asp:GridView ID="grdCategories" runat="server" 
            AllowSorting="True" 
            AutoGenerateColumns="False" 
            DataKeyNames="media_id,media_name,media_type_id,status_code" 
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
                <asp:BoundField DataField="media_type_id" HeaderText="Media Type" ReadOnly="True" 
                    SortExpression="media_type_id" />
                <asp:BoundField DataField="status_code" HeaderText="Status" ReadOnly="True" SortExpression="status_code" />
         
                <%--<asp:TemplateField HeaderText="Select Item" >
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked="True" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>--%>
                                              
            </Columns>
            
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#3f3fd9" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" /> <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />   <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />  <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView> 
    </div>


    <!--Form to borrow media-->
    <div class="col-xs-10">
        <p><asp:Label ID="lblError" runat="server" 
                EnableViewState="false" 
                CssClass="text-danger"></asp:Label></p>

            <asp:DetailsView ID="DetailsView1" runat="server" 
                    DefaultMode="Insert"
                    CssClass="table table-bordered table-condensed" 
                    AutoGenerateRows="False" 
                    DataSourceID="SqlDataSource1"
                    OnItemInserted="DetailsView1_ItemInserted1" 
                    DataKeyNames="media_id" 
                    OnPageIndexChanging="DetailsView1_PageIndexChanging" >     
    
            <Fields>        
                
                <asp:TemplateField HeaderText="Select your borrower id">                    
                    <InsertItemTemplate>
                        <asp:DropDownList ID="ddlborrower_id" runat="server" AutoPostBack="True" 
                            Text='<%# Bind("borrower_id") %>'
                            DataSourceID="SqlDataSource2" 
                            DataTextField="borrower_id"
                            DataValueField="borrower_id" 
                            CssClass="form-control">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString='<%$ ConnectionStrings:disk_inventory_2ConnectionString %>' 
                            SelectCommand="SELECT [borrower_id]
                                FROM [Borrower] 
                                ORDER BY [borrower_id]" >
                        </asp:SqlDataSource>
                    </InsertItemTemplate>  
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Enter one Media ID number">                    
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtmedia_id" runat="server" width="400px" 
                            Text='<%# Bind("media_id") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvmedia_id" runat="server" 
                            ErrorMessage="Must enter media ID number." 
                            ClientValidationFunction="Validate" 
                            ControlToValidate="txtmedia_id"  
                            ValidateEmptyText="true" 
                            ValidationGroup="New" 
                            Display="Dynamic" 
                            CssClass="text-danger" >
                        </asp:RequiredFieldValidator>
                    </InsertItemTemplate>   
                </asp:TemplateField>   
             
                <asp:TemplateField HeaderText="Checkout Date">   
                    <InsertItemTemplate> 
                        <asp:TextBox ID="txtcheckout_date" runat="server" 
                            Text='<%# Bind("checkout_date") %>'
                            TextMode="Date" >
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvcheckout_date" runat="server" 
                            ControlToValidate="txtcheckout_date"
                            ErrorMessage="Must enter a valid date." 
                            ClientValidationFunction="Validate"                              
                            ValidateEmptyText="true" 
                            ValidationGroup="New" 
                            CssClass="text-danger"
                            Display="Dynamic"   >
                        </asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvcheckout_date" runat="server" 
                            Text="Must be a valid date" 
                            CssClass="text-danger"
                            Display="Dynamic" 
                            ControlToValidate="txtcheckout_date" 
                            Type="Date" 
                            Operator="DataTypeCheck">
                        </asp:CompareValidator>

                    </InsertItemTemplate>   
                </asp:TemplateField>   
            
<%--                <asp:TemplateField HeaderText="Return Date">   
                    <InsertItemTemplate> 
                        <asp:TextBox ID="txtreturn_date" runat="server" 
                            Text='<%# Bind("return_date") %>'
                            TextMode="DateTime">
                        </asp:TextBox>
                        <asp:CompareValidator ID="cvreturn_date" runat="server" 
                            ControlToValidate="txtreturn_date" 
                            ControlToCompare="txtcheckout_date" 
                            Type="Date" 
                            text="Must be after checkout date" 
                            Operator="GreaterThan" 
                            Display="Dynamic"  
                            CssClass="text-danger">
                        </asp:CompareValidator>
                    </InsertItemTemplate>   
                </asp:TemplateField>   --%>
            
                <asp:CommandField ShowInsertButton="True" 
                    ValidationGroup="New" 
                    ButtonType="Button" />
            </Fields>
        </asp:DetailsView>


        <%-- message label --%>
        <div class="form-group">
            <div class="col-sm-offset-1 col-sm-11">
                <asp:Label ID="lblMessage" runat="server" 
                    CssClass="text-info" 
                    ValidateRequestMode="Disabled"></asp:Label>
            </div>
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:disk_inventory_2ConnectionString %>" 
            SelectCommand="SELECT media_id, media_name, media_type_id, status_code  
                FROM Media
                WHERE status_code = 'IN' 
                ORDER BY media_id" 
            InsertCommand="INSERT INTO HasBorrower(borrower_id, media_id, checkout_date, return_date) 
                VALUES (@borrower_id, @media_id, @checkout_date, @return_date)"             
            UpdateCommand="UPDATE [Media] 
                SET status_code = 'OUT' 
                WHERE [media_id] = @media_id" >   
            <InsertParameters>
                <asp:Parameter Name="borrower_id" Type="String"></asp:Parameter>
                <asp:Parameter Name="media_id" Type="String"></asp:Parameter>
                <asp:Parameter Name="checkout_date" Type="String"></asp:Parameter>
                <asp:Parameter Name="return_date" Type="String"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="status_code" Type="String"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>
