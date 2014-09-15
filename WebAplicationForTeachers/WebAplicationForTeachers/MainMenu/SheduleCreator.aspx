<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SheduleCreator.aspx.cs" Inherits="WebAplicationForTeachers.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="ViewSetSheduleTimes" runat="server">
            <br />
            <asp:DropDownList ID="ddlChangeShedule" runat="server" DataTextField="Period" DataValueField="Id" CssClass="form-control" Width="30%" AutoPostBack="True"></asp:DropDownList>
            <hr />
            <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2">Začátek vyučovací hodiny</asp:TableCell>
                    <asp:TableCell ColumnSpan="2">Konec vyučovací hodiny</asp:TableCell>
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
                    <asp:TableCell ColumnSpan="4"><asp:Button runat="server" OnClick="AddTimeSpan_Click" Text="Přidat vyučovací hodinu" CssClass="form-control"/></asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <hr />
            <asp:Button runat="server" CssClass="form-control" Width="20%" ID="GoToSheduleCreator" Text="Přejít na generátor rozvrhů" OnClick="GoToSheduleCreator_Click" />
            <hr />
            <asp:GridView ID="gvSheduleTimes" runat="server" DataSourceID="sdsSheduleTimes" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="BeginTime" HeaderText="Začátek vyučovací hodiny" SortExpression="BeginTime" />
                    <asp:BoundField DataField="EndTime" HeaderText="Konec vyučovací hodiny" SortExpression="EndTime" />
                    <asp:BoundField DataField="Shedule_Id" HeaderText="Shedule_Id" SortExpression="Shedule_Id" Visible="False" />
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
            <asp:SqlDataSource ID="sdsSheduleTimes" runat="server" ConnectionString="<%$ ConnectionStrings:PupilBookConnectionString %>" DeleteCommand="DELETE FROM [SheduleHoursSet] WHERE [Id] = @Id" InsertCommand="INSERT INTO [SheduleHoursSet] ([BeginTime], [EndTime], [Shedule_Id]) VALUES (@BeginTime, @EndTime, @Shedule_Id)" SelectCommand="SELECT [BeginTime], [EndTime], [Shedule_Id], [Id] FROM [SheduleHoursSet] WHERE ([Shedule_Id] = @Shedule_Id) ORDER BY [BeginTime]" UpdateCommand="UPDATE [SheduleHoursSet] SET [BeginTime] = @BeginTime, [EndTime] = @EndTime, [Shedule_Id] = @Shedule_Id WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter DbType="Time" Name="BeginTime" />
                    <asp:Parameter DbType="Time" Name="EndTime" />
                    <asp:Parameter Name="Shedule_Id" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlChangeShedule" Name="Shedule_Id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter DbType="Time" Name="BeginTime" />
                    <asp:Parameter DbType="Time" Name="EndTime" />
                    <asp:Parameter Name="Shedule_Id" Type="Int32" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="ViewCreateSheduleForActualYear" runat="server">
            <h1>Shedule builder for year
                <asp:Label ID="lYear" runat="server"></asp:Label></h1>
            <hr />
            <h3>Budete používat rozvrh hodin využívající rozdělení na sudé a liché týdny?</h3>
            <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="Button1" runat="server" Text="Ano" OnClick="oddEvenYes_Click" CssClass="form-control" BackColor="LightGreen" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="Button2" runat="server" Text="Ne" OnClick="oddEvenNo_Click" CssClass="form-control" BackColor="MistyRose" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </asp:View>
        
    </asp:MultiView>
</asp:Content>
