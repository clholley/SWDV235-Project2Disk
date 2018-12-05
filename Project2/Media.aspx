<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
    CodeFile="Media.aspx.cs" Inherits="Media" %>

<asp:Content ID="Content" ContentPlaceHolderID="mainContentPlaceholder" runat="server">   

<!--Media Page

    Date        Programmer Name     Description
    11/9/2018   Cindy Holley        Create website for Cindy's Media inventory
                                    Add borrower, artist, media, contact pages and site.master
    11/13/2018  Cindy Holley        Add modification logs
    11/18/2018  Cindy Holley        Update media pages with stored procedures and validation, connect to db
    11/27/2018  Cindy Holley        Add modification logs to .cs pages

--> 

    <!--Table of media with edit and delete stored procedures and validation-->
    <div class="col-xs-12">
        <h3>These are the movies and music in my inventory.</h3>

        <asp:GridView ID="grdCategories" runat="server" 
            AllowSorting="True" 
            AutoGenerateColumns="False" 
            DataKeyNames="media_id" 
            DataSourceID="SqlDataSource1" 
            CssClass="table table-bordered "
            OnPreRender="grdCategories_PreRender" 
            OnRowDeleted="grdCategories_RowDeleted" 
            OnRowUpdated="grdCategories_RowUpdated"
            AllowPaging="True" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">

            <AlternatingRowStyle BackColor="#DCDCDC" />

            <Columns>
                <asp:BoundField DataField="media_id" HeaderText="Media ID" SortExpression="media_id" ReadOnly="True" InsertVisible="False" />
                
                <asp:TemplateField HeaderText="Media Name" SortExpression="media_name">
                    <EditItemTemplate>
                        <div class="col-xs-11 col-edit">
                            <asp:TextBox ID="txtGridmedia_name" runat="server" 
                                MaxLength="15" 
                                CssClass="form-control"
                                Text='<%# Bind("media_name") %>'></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvGridmedia_name" runat="server" 
                            ControlToValidate="txtGridmedia_name"
                            ValidationGroup="Edit"
                            ErrorMessage="Media name is required." Text="*"
                            CssClass="text-danger" >
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblGridmedia_name" runat="server" 
                            Text='<%# Bind("media_name") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle CssClass="col-xs-4" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Release Date" SortExpression="release_date">
                    <EditItemTemplate>
                        <div class="col-xs-11 col-edit">
                            <asp:TextBox ID="txtGridrelease_date" runat="server" 
                                MaxLength="15"
                                CssClass="form-control"
                                Text='<%# Bind("release_date") %>'></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvGridrelease_date" runat="server" 
                            ControlToValidate="txtGridrelease_date"
                            ValidationGroup="Edit"
                            ErrorMessage="Release date is required." Text="*"
                            CssClass="text-danger" >
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblGridrelease_date" runat="server" 
                            Text='<%# Bind("release_date") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle CssClass="col-xs-4" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Media Type" SortExpression="media_type_id">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlmedia_type_id" runat="server" 
                            DataSourceID="SqlDataSource4" 
                            DataTextField="media_type_id" 
                            DataValueField="media_type_id"
                            SelectedValue='<%# Bind("media_type_id") %>'  >
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:disk_inventory_2ConnectionString %>"                             
                            SelectCommand="SELECT [media_type_id] FROM [MediaType]">
                        </asp:SqlDataSource>
                    </EditItemTemplate> 
                    <ItemTemplate>
                        <asp:Label ID="lblGridmedia_type_id" runat="server" 
                            Text='<%# Bind("media_type_id") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle CssClass="col-xs-4" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Genre" SortExpression="genre_id">
                    <EditItemTemplate>
                        <div class="col-xs-11 col-edit">
                            <asp:DropDownList ID="ddlgenre_id" runat="server" 
                                DataSourceID="SqlDataSource5" 
                                DataTextField="genre_id" 
                                DataValueField="genre_id"
                                SelectedValue='<%# Bind("genre_id") %>'  >
                            </asp:DropDownList>                        
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:disk_inventory_2ConnectionString %>" 
                                SelectCommand="SELECT [genre_id] FROM [Genre]">
                            </asp:SqlDataSource>
                        </div>
                    </EditItemTemplate>   
                    <ItemTemplate>
                        <asp:Label ID="lblGridgenre_id" runat="server" 
                            Text='<%# Bind("genre_id") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle CssClass="col-xs-4" />
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Status" SortExpression="status_code">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlstatus_code" runat="server" 
                            DataSourceID="SqlDataSource6" 
                            DataTextField="status_code" 
                            DataValueField="status_code"
                            SelectedValue='<%# Bind("status_code") %>'  >
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:disk_inventory_2ConnectionString %>" 
                            SelectCommand="SELECT [status_code] FROM [Status]">
                        </asp:SqlDataSource>
                    </EditItemTemplate>   
                    <ItemTemplate>
                        <asp:Label ID="lblGridstatus_code" runat="server" 
                            Text='<%# Bind("status_code") %>'></asp:Label>
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
            DeleteCommand="sp_media_delete" 
            InsertCommand="sp_media_insert" 
            SelectCommand="SELECT * FROM [Media]" 
            UpdateCommand="sp_media_update" DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">

            <DeleteParameters>
                <asp:Parameter Name="media_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="media_name" Type="String" />
                <asp:Parameter Name="release_date" Type="String" />
                <asp:Parameter Name="media_type_id" Type="String" />
                <asp:Parameter Name="genre_id" Type="String" />
                <asp:Parameter Name="status_code" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="media_id" Type="Int32" />
                <asp:Parameter Name="media_name" Type="String" />
                <asp:Parameter Name="release_date" Type="String" />
                <asp:Parameter Name="media_type_id" Type="String" />
                <asp:Parameter Name="genre_id" Type="String" />
                <asp:Parameter Name="status_code" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:ValidationSummary ID="ValidationSummary1" runat="server"
            HeaderText="Please correct the following errors:" 
            ValidationGroup="Edit" 
            CssClass="text-danger" />  
    </div>

    <!--Form to add new media with validation-->
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
            DataKeyNames="media_id" >
            
            <HeaderTemplate>
                <p>To add new media, enter the information and click Insert</p>
            </HeaderTemplate>

            <Fields>
                <asp:TemplateField HeaderText="Media Name" SortExpression="media_name">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtmedia_name" runat="server" Text='<%# Bind("media_name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvmedia_name" runat="server" 
                            ErrorMessage="Media name is required." 
                            ControlToValidate="txtmedia_name" Text="*" 
                            Display="Dynamic" 
                            ValidationGroup="New"
                            CssClass="text-danger">
                        </asp:RequiredFieldValidator>
                    </InsertItemTemplate>   
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Release Date" SortExpression="release_date">
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtrelease_date" runat="server" Text='<%# Bind("release_date") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvrelease_date" runat="server" 
                            ErrorMessage="Release date is required." 
                            ControlToValidate="txtrelease_date" Text="*" 
                            Display="Dynamic" 
                            ValidationGroup="New"
                            CssClass="text-danger">
                        </asp:RequiredFieldValidator>
                    </InsertItemTemplate>   
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Media Type" SortExpression="media_type_id">
                    <InsertItemTemplate>
                        <asp:DropDownList ID="ddlmedia_type_id" runat="server" 
                            DataSourceID="SqlDataSource4" 
                            DataTextField="media_type_id" 
                            DataValueField="media_type_id"
                            SelectedValue='<%# Bind("media_type_id") %>'  >
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:disk_inventory_2ConnectionString %>"                             
                            SelectCommand="SELECT [media_type_id] FROM [MediaType]">
                        </asp:SqlDataSource>
                    </InsertItemTemplate>   
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Genre" SortExpression="genre_id">
                    <InsertItemTemplate>
                        <asp:DropDownList ID="ddlgenre_id" runat="server" 
                            DataSourceID="SqlDataSource5" 
                            DataTextField="genre_id" 
                            DataValueField="genre_id"
                            SelectedValue='<%# Bind("genre_id") %>'  >
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:disk_inventory_2ConnectionString %>" 
                            SelectCommand="SELECT [genre_id] FROM [Genre]">
                        </asp:SqlDataSource>
                    </InsertItemTemplate>   
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Status" SortExpression="status_code">
                    <InsertItemTemplate>
                        <asp:DropDownList ID="ddlstatus_code" runat="server" 
                            DataSourceID="SqlDataSource6" 
                            DataTextField="status_code" 
                            DataValueField="status_code"
                            SelectedValue='<%# Bind("status_code") %>'  >
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:disk_inventory_2ConnectionString %>" 
                            SelectCommand="SELECT [status_code] FROM [Status]">
                        </asp:SqlDataSource>
                    </InsertItemTemplate>   
                </asp:TemplateField>

                <asp:CommandField ShowInsertButton="True" ValidationGroup="New" ButtonType="Button" />
            </Fields>

        </asp:DetailsView>
        <asp:ValidationSummary ID="ValidationSummary2" runat="server"
            HeaderText="Please correct the following errors:" 
            ValidationGroup="New"
            CssClass="text-danger" />  

    </div>
</asp:Content>