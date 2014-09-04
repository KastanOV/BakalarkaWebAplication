<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Init.aspx.cs" Inherits="WebAplicationForTeachers.WebForm1" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Welcome to the world of tomorow.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    <div class="form-horizontal">
        <h4>Before begin using an aplication, you must initialize an aplication.</h4>
        <h5>Now insert your first school year with our aplication</h5>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="SchoolYear" CssClass="col-md-2 control-label" ToolTip="Something like 2014/2015, if you teaching on more schools you can use something like 2014/2015 MIT and 2014/2015 Harward">School Year</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="SchoolYear" CssClass="form-control" TextMode="SingleLine" ToolTip="Something like 2014/2015, if you teaching on more schools you can use something like 2014/2015 MIT and 2014/2015 Harward" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="SchoolYear"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" Text="Save school year " CssClass="btn btn-default" OnClick="Unnamed4_Click" />
            </div>
        </div>
    </div>
</asp:Content>
