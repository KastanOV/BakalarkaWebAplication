<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateClassRoom.aspx.cs" Inherits="WebAplicationForTeachers.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>School Year
        <asp:Label ID="LabelYear" runat="server" Text="Label"></asp:Label></h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    <div class="form-horizontal">
        <h4>Now we create list of your class rooms</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ClassRoomShort" CssClass="col-md-2 control-label" ToolTip="Its unique name of class. Like 5.B">Classroom short name for Shedule</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ClassRoomShort" CssClass="form-control" TextMode="SingleLine" ToolTip="Its unique name of class. Like 5.B" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ClassRoomShort"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
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
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" InsertVisible="False" Visible="False" />
            <asp:BoundField DataField="GroupNameShort" HeaderText="Study group short name" SortExpression="GroupNameShort" />
            <asp:BoundField DataField="GroupName" HeaderText="Group name" SortExpression="GroupName" />
            <asp:BoundField DataField="SchoolYear_Id" HeaderText="SchoolYear_Id" SortExpression="SchoolYear_Id" Visible="False" />
            <asp:BoundField DataField="GroupDescription" HeaderText="Description of group" SortExpression="GroupDescription" />
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
            <asp:QueryStringParameter Name="SchoolYear_Id" QueryStringField="SchoolYear" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
