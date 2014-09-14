<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SheduleItemEditor.aspx.cs" Inherits="WebAplicationForTeachers.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <hr />
    <asp:Label ID="LabelInfo" runat="server" Text="Label" Font-Size="Large"></asp:Label><br />
    <asp:Label ID="Label1" runat="server" Text="Label" Font-Size="Large"></asp:Label><br />
    <asp:Label ID="Label2" runat="server" Text="Label" Font-Size="Large"></asp:Label><br />
    <asp:DropDownList ID="ddlStudyGroup" runat="server" CssClass="form-control" Width="30%"></asp:DropDownList>
    <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control" Width="30%"></asp:DropDownList>
    <asp:Button ID="ButtonSubmit" runat="server" Text="Uložit" OnClick="ButtonSubmit_Click" CssClass="form-control" Width="30%" />
    
</asp:Content>
