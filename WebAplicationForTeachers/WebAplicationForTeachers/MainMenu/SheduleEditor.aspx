<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SheduleEditor.aspx.cs" Inherits="WebAplicationForTeachers.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:MultiView runat="server" ID="MultiViewSheduleCreator">
        <asp:View ID="SheduleAdvanced" runat="server">
            <asp:Table ID="SheduleTable" runat="server" Width="100%" CssClass="table" >
            </asp:Table>
        </asp:View>
        <asp:View ID="SheduleAdvancedDouble" runat="server">
            <h2>Kalendář pro sudý týden</h2>
            <asp:Table ID="SheduleTableEven" runat="server" Width="100%" CssClass="table" >
            </asp:Table>
            <h2>Kalendář pro lichý týden</h2>
            <asp:Table ID="SheduleTableOdd" runat="server" Width="100%" CssClass="table" >
            </asp:Table>
        </asp:View>
    </asp:MultiView>
</asp:Content>
