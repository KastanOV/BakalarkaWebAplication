<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditStudents.aspx.cs" Inherits="WebAplicationForTeachers.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
        <div class="form-horizontal">
            <h4>Add Student to
            <asp:Label ID="LabelStudyGroupName" runat="server" Text="Label"></asp:Label>
                in year
            <asp:Label ID="LabelYear" runat="server" Text="Label"></asp:Label>
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
                    <asp:Button runat="server" Text="Add Student" CssClass="btn btn-default" OnClick="Add_Click" />
                </div>
            </div>
        </div>
    
    <hr />

    <asp:GridView ID="GridViewStudents" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSourceStudyGroups" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="GridViewStudents_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
            <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
            <asp:BoundField DataField="StudyGroup_Id" HeaderText="StudyGroup_Id" SortExpression="StudyGroup_Id" Visible="False" />
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
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
    <asp:SqlDataSource ID="SqlDataSourceStudyGroups" runat="server" ConnectionString="<%$ ConnectionStrings:PupilBookConnectionString %>" SelectCommand="SELECT [Id], [FirstName], [LastName], [StudyGroup_Id] FROM [StudentSet] WHERE ([StudyGroup_Id] = @StudyGroup_Id) ORDER BY [LastName]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [StudentSet] WHERE [Id] = @original_Id " OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [StudentSet] SET [FirstName] = @FirstName, [LastName] = @LastName WHERE [Id] = @original_Id ">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="StudyGroup_Id" QueryStringField="StudyGroupID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="StudyGroup_Id" Type="Int32" />
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_FirstName" Type="String" />
            <asp:Parameter Name="original_LastName" Type="String" />
            <asp:Parameter Name="original_StudyGroup_Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <hr />

    <div class="col-md-offset-2 col-md-10">
        <asp:Button runat="server" Text="Go Back to ClassRooms" CssClass="btn btn-default" OnClick="GoToStudyGroups_Click" />
    </div>

</asp:Content>
