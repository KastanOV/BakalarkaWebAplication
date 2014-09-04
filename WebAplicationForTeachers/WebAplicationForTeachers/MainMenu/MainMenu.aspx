<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MainMenu.aspx.cs" Inherits="WebAplicationForTeachers.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:MultiView ID="MultiViewMainPage" runat="server">
        <asp:View ID="ViewYear" runat="server" ViewStateMode="Enabled">
            <h3>
                <asp:Label ID="LabelYearHeader" runat="server" Text=""></asp:Label></h3>
            <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:DropDownList ID="DropDownListYears" runat="server" CssClass="form-control" OnSelectedIndexChanged="DropDownListYears_SelectedIndexChanged"></asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="TextBoxAddYear" runat="server" CssClass="form-control"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="ButtonAddYear" runat="server" Text="Add School Year" OnClick="AddYear_Click" CssClass="form-control" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="3">
                        <asp:Button runat="server" Text="Go to Study groups menu" OnClick="GoToView2_Click" CssClass="form-control"/>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

        </asp:View>
        <asp:View ID="ViewStudyGroups" runat="server">
            <h2>School Year
        <asp:Label ID="LabelYear" runat="server" Text="Label"></asp:Label>
            </h2>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <asp:Button runat="server" Text="Change School Year" CssClass="btn btn-default" OnClick="ChangeShoolYear_Click" />
                </div>
            </div>
            <p class="text-danger">
                <asp:Literal runat="server" ID="ErrorMessage" />
            </p>
            <div class="form-horizontal">
                <h4>Now we create list of your class rooms</h4>
                <hr />
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="ClassRoomShort" CssClass="col-md-2 control-label" ToolTip="Its unique name of class. Like 5.B">Classroom short name for Shedule</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="ClassRoomShort" CssClass="form-control" TextMode="SingleLine" ToolTip="Its unique name of class. Like 5.B" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="ClassRoom" CssClass="col-md-2 control-label" ToolTip="Here you can place what you want">Classroom name</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="ClassRoom" CssClass="form-control" TextMode="SingleLine" ToolTip="Here you can place what you want" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="ClassDesription" CssClass="col-md-2 control-label" ToolTip="Its unique name of class. Like 5.B">Classroom description</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="ClassDesription" CssClass="form-control" TextMode="MultiLine" ToolTip="Its unique name of class. Like 5.B" />

                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-2 col-md-10">
                        <asp:Button runat="server" Text="Add Class" CssClass="btn btn-default" OnClick="Add_Click" />
                    </div>
                </div>
            </div>

            <asp:GridView ID="GridViewClassRooms" runat="server" DataSourceID="SqlDataSourceClassRooms" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="GridViewClassRooms_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" InsertVisible="False" Visible="False" />
                    <asp:BoundField DataField="GroupNameShort" HeaderText="Group Name Short" SortExpression="GroupNameShort" />
                    <asp:BoundField DataField="GroupName" HeaderText="Group Name" SortExpression="GroupName" />
                    <asp:BoundField DataField="GroupDescription" HeaderText="Group Description" SortExpression="GroupDescription" />
                    <asp:BoundField DataField="SchoolYear_Id" HeaderText="SchoolYear_Id" SortExpression="SchoolYear_Id" Visible="False" />
                    <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
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
            <asp:SqlDataSource ID="SqlDataSourceClassRooms" runat="server" ConnectionString="<%$ ConnectionStrings:PupilBookConnectionString %>"
                SelectCommand="SELECT * FROM [StudyGroupSet] WHERE ([SchoolYear_Id] = @SchoolYear_Id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListYears" Name="SchoolYear_Id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="ViewStudyGroup" runat="server">
            <div class="form-horizontal">
                <h4>Add Student to
            <asp:Label ID="LabelStudyGroupName" runat="server" Text="Label"></asp:Label>
                    in year
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </h4>

                <hr />
                <asp:ValidationSummary runat="server" CssClass="text-danger" />
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="FirstName" CssClass="col-md-2 control-label" ToolTip="Dont need tooltip :)">First Name</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="FirstName" CssClass="form-control" TextMode="SingleLine" ToolTip="Dont need tooltip :)" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="LastName" CssClass="col-md-2 control-label" ToolTip="Dont need tooltip :)">Last Name</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="LastName" CssClass="form-control" TextMode="SingleLine" ToolTip="Dont need tooltip :)" />

                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-2 col-md-10">
                        <asp:Button runat="server" Text="Add Student" CssClass="btn btn-default" OnClick="Add_Student_Click" />
                    </div>
                </div>
            </div>

            <hr />

            <asp:GridView ID="GridViewStudents" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSourceStudyGroups" ForeColor="Black" GridLines="Vertical" >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                    <asp:BoundField DataField="StudyGroup_Id" HeaderText="StudyGroup_Id" SortExpression="StudyGroup_Id" Visible="False" />
                    <asp:CommandField ButtonType="Button" ShowEditButton="True" />
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
            <asp:SqlDataSource ID="SqlDataSourceStudyGroups" runat="server" ConnectionString="<%$ ConnectionStrings:PupilBookConnectionString %>" SelectCommand="SELECT [Id], [FirstName], [LastName], [StudyGroup_Id] FROM [StudentSet] WHERE ([StudyGroup_Id] = @StudyGroup_Id) ORDER BY [LastName]" DeleteCommand="DELETE FROM [StudentSet] WHERE [Id] = @original_Id" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [StudentSet] SET [FirstName] = @FirstName, [LastName] = @LastName WHERE [Id] = @original_Id" >
                <DeleteParameters>
                    <asp:Parameter Name="original_Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="StudyGroup_Id" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewClassRooms" Name="StudyGroup_Id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="StudyGroup_Id" Type="Int32" />
                    <asp:Parameter Name="original_Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <hr />

            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" Text="Go Back to ClassRooms" CssClass="btn btn-default" OnClick="GoToStudyGroups_Click" />
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
