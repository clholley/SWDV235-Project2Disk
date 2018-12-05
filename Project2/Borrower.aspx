<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" 
    CodeFile="Borrower.aspx.cs" Inherits="Borrower" %>

<asp:Content ID="Content" ContentPlaceHolderID="mainContentPlaceholder" runat="server">  

<!--Borrower Page
    Date        Programmer Name     Description
    11/9/2018   Cindy Holley        Create website for Cindy's Media inventory
                                    Add borrower, artist, media, contact pages and site.master
    11/13/2018  Cindy Holley        Add modification logs
    11/27/2018  Cindy Holley        Add modification logs to.cs pages

-->    

        <h2>Who wants to borrow my stuff?</h2>
        <p>If you would like to borrow my movies and music, 
            you must sign up first. Please fill out the form and click Submit.
        </p>
        
        <!--error message-->
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            HeaderText="* means that the field is required" 
            CssClass="text-danger" />

        <div>
            <!--First Name-->
            <div class="form-group">
                <label class="col-sm-3 control-label">First Name&nbsp; </label>
                <div class="col-sm-6">
                    <asp:TextBox ID="txtborrower_fName" runat="server" 
                        CssClass="form-control" Width="640px" >
                    </asp:TextBox>
                </div>
                <!--Validation-->
                <div class="col-sm-3" style="left: 650px; top: -25px">
                    <asp:RequiredFieldValidator ID="rfvborrower_fName" runat="server" 
                        ControlToValidate="txtborrower_fName" 
                        text="*" 
                        CssClass="text-danger" 
                        Display="Dynamic">
                    </asp:RequiredFieldValidator> 
                </div>
            </div><!--end first name-->     

            <!--Last Name-->
            <div class="form-group">
                <label class="col-sm-3 control-label">Last Name</label>
                <div class="col-sm-6">
                    <asp:TextBox ID="txtborrower_lName" runat="server" 
                        CssClass="form-control" Width="640px"> 
                    </asp:TextBox>
                </div>
                <!--Validation-->
                <div class="col-sm-3 control-label" style="left: 650px; top: -25px">
                    <asp:RequiredFieldValidator ID="rfvborrower_lName" runat="server" 
                        ControlToValidate="txtborrower_lName" 
                        text="*" 
                        CssClass="text-danger" 
                        Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </div>             
            </div><!--end last name-->

            <!--Phone-->
            <div class="form-group">
                <label class="col-sm-3 control-label">Phone Number</label>
                <div class="col-sm-6">
                    <asp:TextBox ID="txtborrower_phone" runat="server" 
                        TextMode="Phone" 
                        CssClass="form-control" Width="440px" ></asp:TextBox>
                </div>
                <!--Validation-->
                <div class="col-sm-4 control-label" style="left: 450px; top: -25px">
                    <asp:RequiredFieldValidator ID="rfvborrower_phone" runat="server" 
                        ControlToValidate="txtborrower_phone" 
                        text="*" 
                        CssClass="text-danger" 
                        Display="Dynamic">
                    </asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator ID="revborrower_phone" runat="server" 
                        ControlToValidate="txtborrower_phone" 
                        Text="Use this format: 999-999-9999"
                        Display="Dynamic" 
                        CssClass="text-danger" 
                        ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">
                    </asp:RegularExpressionValidator>    
                </div>
            </div><!--end phone-->

            <!-- Submit and Clear buttons -->
            <div class="form-group">
                <div class="col-sm-offset-3 col-sm-9">
                    <asp:Button ID="btnSubmit" runat="server" 
                        Text="Submit"
                        CssClass="btn btn-primary" 
                        OnClick="btnSubmit_Click"  />


                    <asp:Button ID="btnClear" runat="server" 
                        Text="  Clear  "
                        CssClass="btn btn-primary" 
                        OnClick="btnClear_Click" 
                        CausesValidation="false"  />
                </div>
            </div><!--end submit and clear buttons -->
        </div>

        <%-- message label --%>
        <div class="form-group">
            <div class="col-sm-offset-1 col-sm-11">
                <asp:Label ID="lblMessage" runat="server" 
                    CssClass="text-info" 
                    ValidateRequestMode="Disabled"></asp:Label>
            </div>
        </div>

</asp:Content>
