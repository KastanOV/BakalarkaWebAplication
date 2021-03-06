﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MainMenu.aspx.cs" Inherits="WebAplicationForTeachers.WebForm4" %>

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
                        <asp:Button ID="ButtonAddYear" runat="server" Text="Přidat školní rok" OnClick="AddYear_Click" CssClass="form-control" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <hr />
            <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button runat="server" Text="Upravit rozvrh hodin" CssClass="form-control" OnClick="GoToSheduleCreator_Click" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button runat="server" Text="Upravit seznam studentů a tříd" OnClick="GoToView2_Click" CssClass="form-control"/>
                    </asp:TableCell>
                    
                    <asp:TableCell>
                        <asp:Button runat="server" Text="Upravit předměty" CssClass="form-control" OnClick="GotoSubjectGroups1_Click" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

        </asp:View>

        <asp:View ID="ViewStudyGroups" runat="server">
            <h2>Školní rok
        <asp:Label ID="LabelYear" runat="server" Text=""></asp:Label>
            </h2>
            
            <hr />
            <p class="text-danger">
                <asp:Literal runat="server" ID="ErrorMessage" />
            </p>
            <div class="form-horizontal">
                <h4>Nyní můžete editovat seznam tříd</h4>
                <hr />
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="ClassRoomShort" CssClass="col-md-2 control-label" ToolTip="Zkrácený název třídy např: 5.B">Název třídy zkratka</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="ClassRoomShort" CssClass="form-control" TextMode="SingleLine" ToolTip="Zkrácený název třídy např: 5.B" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="ClassRoom" CssClass="col-md-2 control-label" ToolTip="Celý název třídy. Tento údaj není povinný">Název třídy</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="ClassRoom" CssClass="form-control" TextMode="SingleLine" ToolTip="Celý název třídy. Tento údaj není povinný" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="ClassDesription" CssClass="col-md-2 control-label" ToolTip="Zde si můžete zapsat libovolné poznámky.">Poznámky</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="ClassDesription" CssClass="form-control" TextMode="MultiLine" ToolTip="Zde si můžete zapsat libovolné poznámky." />

                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-2 col-md-10">
                        <asp:Button runat="server" Text="Přidat třídu" CssClass="btn btn-default" OnClick="Add_Click" />
                    </div>
                </div>
            </div>
            <hr />
            <h3>Pro editaci studentů vyberte třídu</h3>
            <asp:GridView ID="GridViewClassRooms" runat="server" DataSourceID="SqlDataSourceClassRooms" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="GridViewClassRooms_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" InsertVisible="False" Visible="False" />
                    <asp:BoundField DataField="GroupNameShort" HeaderText="Zkrácený název" SortExpression="GroupNameShort" />
                    <asp:BoundField DataField="GroupName" HeaderText="Název" SortExpression="GroupName" />
                    <asp:BoundField DataField="GroupDescription" HeaderText="Poznámky" SortExpression="GroupDescription" />
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

            <hr />
            <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button runat="server" Text="Změnit školní rok" CssClass="form-control" OnClick="ChangeShoolYear_Click" />
                    </asp:TableCell>
                    <%--<asp:TableCell>
                        <asp:Button runat="server" Text="Go to Study groups menu" OnClick="GoToView2_Click" CssClass="form-control"/>
                    </asp:TableCell>--%>
                    <%--<asp:TableCell>
                        <asp:Button runat="server" Text="Go to ClassRooms" CssClass="form-control" OnClick="GoToStudyGroups_Click" />
                    </asp:TableCell>--%>
                    <asp:TableCell>
                        <asp:Button runat="server" Text="Upravit předměty" CssClass="form-control" OnClick="GotoSubjectGroups1_Click" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

        </asp:View>

        <asp:View ID="ViewStudyGroup" runat="server">
            <div class="form-horizontal">
                <h4>Přidat studenta do skupiny 
            <asp:Label ID="LabelStudyGroupName" runat="server" Text=""></asp:Label>
                    ve školním roce 
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </h4>

                <hr />
                <asp:ValidationSummary runat="server" CssClass="text-danger" />
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="FirstName" CssClass="col-md-2 control-label" ToolTip="K tomuhle zřejmě nepotřebujete nápovědu">First Name</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="FirstName" CssClass="form-control" TextMode="SingleLine" ToolTip="K tomuhle zřejmě nepotřebujete nápovědu" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="LastName" CssClass="col-md-2 control-label" ToolTip="K tomuhle zřejmě nepotřebujete nápovědu">Last Name</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="LastName" CssClass="form-control" TextMode="SingleLine" ToolTip="K tomuhle zřejmě nepotřebujete nápovědu" />

                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-2 col-md-10">
                        <asp:Button runat="server" Text="Přidat studenta" CssClass="btn btn-default" OnClick="Add_Student_Click" />
                    </div>
                </div>
            </div>

            <hr />

            <asp:GridView ID="GridViewStudents" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSourceStudyGroups" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
                    <asp:BoundField DataField="LastName" HeaderText="Příjmení" SortExpression="LastName" />
                    <asp:BoundField DataField="FirstName" HeaderText="Jméno" SortExpression="FirstName" />
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
            <asp:SqlDataSource ID="SqlDataSourceStudyGroups" runat="server" ConnectionString="<%$ ConnectionStrings:PupilBookConnectionString %>" SelectCommand="SELECT [Id], [FirstName], [LastName], [StudyGroup_Id] FROM [StudentSet] WHERE ([StudyGroup_Id] = @StudyGroup_Id) ORDER BY [LastName]" DeleteCommand="DELETE FROM [StudentSet] WHERE [Id] = @original_Id" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [StudentSet] SET [FirstName] = @FirstName, [LastName] = @LastName WHERE [Id] = @original_Id">
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

            <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button runat="server" Text="Změnit školní rok" CssClass="form-control" OnClick="ChangeShoolYear_Click" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button runat="server" Text="Upravit třídu" OnClick="GoToView2_Click" CssClass="form-control"/>
                    </asp:TableCell>
                    
                    <asp:TableCell>
                        <asp:Button runat="server" Text="Upravit předměty" CssClass="form-control" OnClick="GotoSubjectGroups1_Click" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </asp:View>

        <asp:View ID="ViewStudySubjects" runat="server">
            <asp:Table runat="server">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>Vyberty předmět</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Nový předmět</asp:TableHeaderCell>
                    <asp:TableHeaderCell></asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:DropDownList ID="ddlStudyCategory" runat="server" AutoPostBack="True" DataSourceID="sdsStudySubject"  CssClass="form-control" DataTextField="Name" DataValueField="Id"></asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="tbNewStudyCategory" runat="server" CssClass="form-control"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="bInsertNewStudyCategory" Text="Crete new Category" runat="server" OnClick="bInsertNewStudyCategory_Click" CssClass="form-control" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell>Vyberte podkategorii předmětu</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Nová podkategorie předmětu</asp:TableHeaderCell>
                    <asp:TableHeaderCell></asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableHeaderRow>
                    <asp:TableCell>
                        <asp:DropDownList ID="ddlStudySubCategory" AutoPostBack="true" runat="server"  CssClass="form-control" DataSourceID="sdsSubjectSubCategory" DataTextField="Name" DataValueField="Id"></asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="tbNewStudySubCategory" runat="server" CssClass="form-control"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="bInserNnewStudySubCategory" Text="Creta new SubCategory" runat="server" OnClick="bInserNnewStudySubCategory_Click" CssClass="form-control" />
                    </asp:TableCell>
                </asp:TableHeaderRow>
            </asp:Table>
            <asp:GridView ID="gvStudyCategory" runat="server" DataSourceID="sdsStudyCategory" AutoGenerateColumns="False" DataKeyNames="Id,Expr1" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
                    <asp:BoundField DataField="StudySubject_Id" HeaderText="StudySubject_Id" SortExpression="StudySubject_Id" Visible="False" />
                    <asp:BoundField DataField="Expr1" HeaderText="StudySubject_id_PrimaryKey" InsertVisible="False" ReadOnly="True" SortExpression="Expr1" Visible="False" />
                    <asp:BoundField DataField="Expr2" HeaderText="Název předmětu" SortExpression="Expr2" />
                    <asp:BoundField DataField="Name" HeaderText="Název podkategorie předmětu" SortExpression="Name" />
                    <asp:BoundField DataField="SchoolYear_Id" HeaderText="SchoolYear_Id" SortExpression="SchoolYear_Id" Visible="False" />
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
            <asp:SqlDataSource ID="sdsStudyCategory" runat="server" ConnectionString="<%$ ConnectionStrings:PupilBookConnectionString %>" SelectCommand="SELECT SubjectSubCategorySet.Id, SubjectSubCategorySet.Name, SubjectSubCategorySet.StudySubject_Id, StudySubjectSet.Id AS Expr1, StudySubjectSet.Name AS Expr2, StudySubjectSet.SchoolYear_Id FROM StudySubjectSet INNER JOIN SubjectSubCategorySet ON StudySubjectSet.Id = SubjectSubCategorySet.StudySubject_Id WHERE (StudySubjectSet.SchoolYear_Id = @SchoolYear_Id) Order by Expr2">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListYears" Name="SchoolYear_Id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsStudySubject" runat="server" ConnectionString="<%$ ConnectionStrings:PupilBookConnectionString %>" SelectCommand="SELECT * FROM [StudySubjectSet] WHERE ([SchoolYear_Id] = @SchoolYear_Id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownListYears" Name="SchoolYear_Id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsSubjectSubCategory" runat="server" ConnectionString="<%$ ConnectionStrings:PupilBookConnectionString %>" SelectCommand="SELECT * FROM [SubjectSubCategorySet] WHERE ([StudySubject_Id] = @StudySubject_Id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlStudyCategory" Name="StudySubject_Id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <hr />

            <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button runat="server" Text="Změnit školní rok" CssClass="form-control" OnClick="ChangeShoolYear_Click" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button runat="server" Text="Upravit třídy" OnClick="GoToView2_Click" CssClass="form-control"/>
                    </asp:TableCell>
                    <%--<asp:TableCell>
                        <asp:Button runat="server" Text="Go to ClassRooms" CssClass="form-control" OnClick="GoToStudyGroups_Click" />
                    </asp:TableCell>--%>
                    <%--<asp:TableCell>
                        <asp:Button runat="server" Text="Go to Subjects menu" CssClass="form-control" OnClick="GotoSubjectGroups1_Click" />
                    </asp:TableCell>--%>
                </asp:TableRow>
            </asp:Table>
        </asp:View>
    </asp:MultiView>
</asp:Content>
