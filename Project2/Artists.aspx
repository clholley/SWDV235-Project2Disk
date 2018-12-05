<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
    CodeFile="Artists.aspx.cs" Inherits="Artists" %>

<asp:Content ID="Content" ContentPlaceHolderID="mainContentPlaceholder" runat="server">  

<!--Artists Page

    Date        Programmer Name     Description
    11/9/2018   Cindy Holley        Create website for Cindy's Media inventory
                                    Add borrower, artist, media, contact pages and site.master
    11/13/2018  Cindy Holley        Add modification logs
    11/18/2018  Cindy Holley        Update artist page and connect to database

--> 

    <!--Table to view artists with edit and delete stored procedures with validation-->
    <div class="col-xs-12">
        <h3>These are the artists available.</h3>

        <asp:GridView ID="grdCategories" runat="server" 
            AllowSorting="True" 
            AutoGenerateColumns="False" 
            DataKeyNames="artist_id" 
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
                <asp:BoundField DataField="artist_id" HeaderText="Artist ID" SortExpression="artist_id" ReadOnly="True" InsertVisible="False" />
                
                <asp:TemplateField HeaderText="Artist Type" SortExpression="artist_type">
                    <EditItemTemplate>
                        <div class="col-xs-10 col-edit">
                            <asp:TextBox ID="txtGridartist_type" runat="server" 
                                MaxLength="15"
                                CssClass="form-control"
                                Text='<%# Bind("artist_type") %>'></asp:TextBox>
                        </div>
                        <div class="col-xs-2 col-edit">
                            <asp:RequiredFieldValidator ID="rfvartist_type" runat="server" 
                                ControlToValidate="txtGridartist_type"
                                ValidationGroup="Edit"
                                ErrorMessage="Artist type is required." Text="*"
                                CssClass="text-danger" >
                            </asp:RequiredFieldValidator>   
                        </div>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblGridartist_type" runat="server" 
                            Text='<%# Bind("artist_type") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle CssClass="col-xs-4" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Artist's First Name" SortExpression="artist_fname">
                    <EditItemTemplate>
                        <div class="col-xs-11 col-edit">
                            <asp:TextBox ID="txtGridartist_fname" runat="server" 
                                MaxLength="15"
                                CssClass="form-control"
                                Text='<%# Bind("artist_fname") %>'></asp:TextBox>
                        </div>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblGridartist_fname" runat="server" 
                            Text='<%# Bind("artist_fname") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle CssClass="col-xs-4" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Artist's Last Name" SortExpression="artist_lname">
                    <EditItemTemplate>
                        <div class="col-xs-11 col-edit">
                            <asp:TextBox ID="txtGridartist_lname" runat="server" 
                                MaxLength="15"
                                CssClass="form-control"
                                Text='<%# Bind("artist_lname") %>'></asp:TextBox>
                        </div>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblGridartist_lname" runat="server" 
                            Text='<%# Bind("artist_lname") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle CssClass="col-xs-4" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Artist's Group Name" SortExpression="group_name">
                    <EditItemTemplate>
                        <div class="col-xs-11 col-edit">
                            <asp:TextBox ID="txtGridgroup_name" runat="server" 
                                MaxLength="15"
                                CssClass="form-control"
                                Text='<%# Bind("group_name") %>'></asp:TextBox>
                        </div>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblGridgroup_name" runat="server" 
                            Text='<%# Bind("group_name") %>'></asp:Label>
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
            DeleteCommand="sp_artist_delete" 
            InsertCommand="sp_artist_insert" 
            SelectCommand="SELECT * FROM [Artist]" 
            UpdateCommand="sp_artist_update" DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">

            <DeleteParameters>
                <asp:Parameter Name="artist_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="artist_type" Type="String" />
                <asp:Parameter Name="artist_fname" Type="String" />
                <asp:Parameter Name="artist_lname" Type="String" />
                 <asp:Parameter Name="group_name" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="artist_id" Type="Int32" />
                <asp:Parameter Name="artist_type" Type="String" />
                <asp:Parameter Name="artist_fname" Type="String" />
                <asp:Parameter Name="artist_lname" Type="String" />
                <asp:Parameter Name="group_name" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:ValidationSummary ID="ValidationSummary1" runat="server"
            HeaderText="Please correct the following errors:" 
            ValidationGroup="Edit" 
            CssClass="text-danger" />  
    </div>

    <!--Form to add new artists with validation-->
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
            DataKeyNames="artist_id" 
            OnPageIndexChanging="DetailsView1_PageIndexChanging1" >
            
            <HeaderTemplate>
                <p>To add a new artist or group, enter the information and click Insert.
                You must enter a first name or a group name. Press the space bar twice 
                to leave a required field blank.</p>
            </HeaderTemplate>

            <Fields>
                <asp:TemplateField HeaderText="Artist Type" SortExpression="artist_type">
                    <InsertItemTemplate>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" SelectedValue='<%# Bind("artist_type") %>'>
                            <asp:ListItem Value="actor" Text="&nbsp  Actor" />                         
                            <asp:ListItem Value="singer" Text="&nbsp  Singer" /> 
                            <asp:ListItem Value="musician" Text="&nbsp  Musican" />                        
                            <asp:ListItem Value="group" Text="&nbsp  Band or Group" /> 
                        </asp:RadioButtonList>
                    </InsertItemTemplate> 
                </asp:TemplateField>            

                <asp:TemplateField HeaderText="Artist First Name" SortExpression="artist_fname">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtartist_fname" runat="server" width="400px" 
                            Text='<%# Bind("artist_fname") %>'></asp:TextBox>
                        <asp:CustomValidator ID="cvartist_fname" runat="server" 
                            ErrorMessage="Must enter first name or group name." 
                            ClientValidationFunction="Validate" 
                            ControlToValidate="txtartist_fname"  
                            ValidateEmptyText="true" 
                            ValidationGroup="New" 
                            Display="Dynamic" 
                            CssClass="text-danger" >
                        </asp:CustomValidator>  
                    </InsertItemTemplate>   
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Artist Last Name" SortExpression="artist_lname">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtartist_lname" runat="server" width="400px"
                            Text='<%# Bind("artist_lname") %>'></asp:TextBox>
                    </InsertItemTemplate>   
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Artist Group Name" SortExpression="group_name">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtgroup_name" runat="server" width="400px"
                            Text='<%# Bind("group_name") %>' ></asp:TextBox>
                        <asp:CustomValidator ID="cvgroup_name" runat="server" 
                            ErrorMessage="Must enter first name or group name." 
                            ClientValidationFunction="Validate" 
                            ControlToValidate="txtgroup_name"  
                            ValidateEmptyText="true" 
                            ValidationGroup="New" 
                            Display="Dynamic" 
                            CssClass="text-danger"></asp:CustomValidator>  
                    </InsertItemTemplate>                      
                </asp:TemplateField>

                <asp:CommandField ShowInsertButton="True" 
                    ValidationGroup="New" 
                    ButtonType="Button" />
            </Fields>

        </asp:DetailsView>
    </div>
</asp:Content>