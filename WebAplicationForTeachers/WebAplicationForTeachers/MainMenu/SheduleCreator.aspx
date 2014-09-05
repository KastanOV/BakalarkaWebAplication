<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SheduleCreator.aspx.cs" Inherits="WebAplicationForTeachers.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="ViewSetSheduleTimes" runat="server">
            <br />
            <asp:DropDownList ID="ddlChangeShedule" runat="server" DataTextField="Period" DataValueField="Id" CssClass="form-control" Width="30%" AutoPostBack="True"></asp:DropDownList>
            <hr />
            <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">Start Time</asp:TableCell>
                    <asp:TableCell ColumnSpan="2">End Time</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:DropDownList ID="ddlStartHour" runat="server" CssClass="form-control">
                            <asp:ListItem>06</asp:ListItem>
                            <asp:ListItem>07</asp:ListItem>
                            <asp:ListItem>08</asp:ListItem>
                            <asp:ListItem>09</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                            <asp:ListItem>13</asp:ListItem>
                            <asp:ListItem>14</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem>
                            <asp:ListItem>16</asp:ListItem>
                            <asp:ListItem>17</asp:ListItem>
                            <asp:ListItem>18</asp:ListItem>
                            <asp:ListItem>19</asp:ListItem>
                            <asp:ListItem>20</asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="ddlStartMinute" runat="server" CssClass="form-control">
                            <asp:ListItem>00</asp:ListItem>
                            <asp:ListItem>05</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem>
                            <asp:ListItem>20</asp:ListItem>
                            <asp:ListItem>25</asp:ListItem>
                            <asp:ListItem>30</asp:ListItem>
                            <asp:ListItem>35</asp:ListItem>
                            <asp:ListItem>40</asp:ListItem>
                            <asp:ListItem>45</asp:ListItem>
                            <asp:ListItem>50</asp:ListItem>
                            <asp:ListItem>55</asp:ListItem>
                        </asp:DropDownList>

                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="ddlEndHour" runat="server" CssClass="form-control">
                            <asp:ListItem>06</asp:ListItem>
                            <asp:ListItem>07</asp:ListItem>
                            <asp:ListItem>08</asp:ListItem>
                            <asp:ListItem>09</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                            <asp:ListItem>13</asp:ListItem>
                            <asp:ListItem>14</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem>
                            <asp:ListItem>16</asp:ListItem>
                            <asp:ListItem>17</asp:ListItem>
                            <asp:ListItem>18</asp:ListItem>
                            <asp:ListItem>19</asp:ListItem>
                            <asp:ListItem>20</asp:ListItem>
                        </asp:DropDownList>

                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="ddlEndMinute" runat="server" CssClass="form-control">
                            <asp:ListItem>00</asp:ListItem>
                            <asp:ListItem>05</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem>
                            <asp:ListItem>20</asp:ListItem>
                            <asp:ListItem>25</asp:ListItem>
                            <asp:ListItem>30</asp:ListItem>
                            <asp:ListItem>35</asp:ListItem>
                            <asp:ListItem>40</asp:ListItem>
                            <asp:ListItem>45</asp:ListItem>
                            <asp:ListItem>50</asp:ListItem>
                            <asp:ListItem>55</asp:ListItem>
                        </asp:DropDownList>

                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="4"><asp:Button runat="server" OnClick="AddTimeSpan_Click" Text="Add Timespan to shedule" CssClass="form-control"/></asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <hr />
            <asp:GridView ID="gvSheduleTimes" runat="server" DataSourceID="sdsSheduleTimes"></asp:GridView>
            <asp:SqlDataSource ID="sdsSheduleTimes" runat="server"></asp:SqlDataSource>
        </asp:View>
        <asp:View ID="ViewCreateSheduleForActualYear" runat="server">
            <h1>Shedule builder for year
                <asp:Label ID="lYear" runat="server"></asp:Label></h1>
            <hr />
            <h3>Do you want use odd/even weeks system?</h3>
            <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="Button1" runat="server" Text="Yes" OnClick="oddEvenYes_Click" CssClass="form-control" BackColor="LightGreen" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="Button2" runat="server" Text="No" OnClick="oddEvenNo_Click" CssClass="form-control" BackColor="MistyRose" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </asp:View>
    </asp:MultiView>
</asp:Content>
