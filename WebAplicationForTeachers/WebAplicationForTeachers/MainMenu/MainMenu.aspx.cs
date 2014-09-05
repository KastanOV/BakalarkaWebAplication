using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using System.Drawing;


namespace WebAplicationForTeachers
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        PupilBookEntities db = new PupilBookEntities();

        //public delegate void SomethingChange();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated) Response.Redirect("~/");
            string UserID = User.Identity.GetUserId();
            if (!IsPostBack)
            {
                //Loading First View

                MultiViewMainPage.ActiveViewIndex = 0;
                var items = new ListItem();
                var FirstItem = (from i in db.YearSet
                                 where i.User_Id == UserID && i.ActualYear == true
                                 select i).First();
                if (FirstItem == null) LabelYearHeader.Text = "You must create new Year";

                else
                {
                    LabelYearHeader.Text = "Actual Year is " + FirstItem.Name;
                    LabelYear.Text = FirstItem.Name;
                    DropDownListYears.Items.Insert(0, new ListItem(FirstItem.Name, FirstItem.Id.ToString()));
                    var AnotherItem = from i in db.YearSet
                                      where i.User_Id == UserID && i.ActualYear == false
                                      select new { i.Name, i.Id };
                    foreach (var i in AnotherItem)
                    {
                        DropDownListYears.Items.Add(new ListItem(FirstItem.Name, FirstItem.Id.ToString()));
                    }
                }

                //Loading Fourth View Study subjects
                //var subjectsItems = from i in db.StudySubjectSet
                //                    where i.SchoolYear_Id == Int32.Parse(DropDownListYears.SelectedValue)
                //                    select new { SubjectID = i.Id, SubjectName = i.Name };


            }

        }
        protected void AddYear_Click(object sender, EventArgs e)
        {
            if (TextBoxAddYear.Text != "")
            {
                YearSet year = new YearSet()
                {
                    Name = TextBoxAddYear.Text,
                    ActualYear = true,
                    User_Id = User.Identity.GetUserId()
                };
                db.YearSet.Add(year);
                db.SaveChanges();
                DropDownListYears.Items.Add(new ListItem(year.Name, year.Id.ToString()));
            }
        }
        protected void Add_Click(object sender, EventArgs e)
        {
            using (var db = new PupilBookEntities())
            {
                db.StudyGroupSet.Add(new StudyGroupSet()
                {
                    GroupDescription = ClassDesription.Text,
                    GroupName = ClassRoom.Text,
                    GroupNameShort = ClassRoomShort.Text,
                    SchoolYear_Id = Int32.Parse(DropDownListYears.SelectedValue)
                });
                db.SaveChanges();
            }
            GridViewClassRooms.DataBind();
        }
        protected void DropDownListYears_SelectedIndexChanged(object sender, EventArgs e)
        {
            LabelYear.Text = DropDownListYears.SelectedItem.Text;
            GridViewClassRooms.DataBind();
        }
        protected void GoToView2_Click(object sender, EventArgs e)
        {
            MultiViewMainPage.ActiveViewIndex = 1;
        }
        protected void ChangeShoolYear_Click(object sender, EventArgs e)
        {
            MultiViewMainPage.ActiveViewIndex = 0;
        }
        protected void Add_Student_Click(object sender, EventArgs e)
        {
            bool formFalse = false;
            if (FirstName.Text == "") { FirstName.BackColor = Color.MistyRose; FirstName.ToolTip = "This is Required filed"; formFalse = true; }
            if (LastName.Text == "") { LastName.BackColor = Color.MistyRose; LastName.ToolTip = "This is Required filed"; formFalse = true; }
            if (formFalse) return;

            db.CreateStudent(FirstName.Text, LastName.Text, Int32.Parse(GridViewClassRooms.SelectedValue.ToString()));
            GridViewStudents.DataBind();
            FirstName.Text = "";
            LastName.Text = "";

        }

        protected void GoToStudyGroups_Click(object sender, EventArgs e)
        {
            MultiViewMainPage.ActiveViewIndex = 1;
        }

        protected void GridViewClassRooms_SelectedIndexChanged(object sender, EventArgs e)
        {
            MultiViewMainPage.ActiveViewIndex = 2;
        }

        protected void bInsertNewStudyCategory_Click(object sender, EventArgs e)
        {
            if (tbNewStudyCategory.Text == "") { tbNewStudyCategory.BackColor = Color.MistyRose; tbNewStudyCategory.ToolTip = "This is Required field"; return; }
            else
            {
                StudySubjectSet item = new StudySubjectSet() 
                {
                    Name = tbNewStudyCategory.Text,
                    SchoolYear_Id = Int32.Parse(DropDownListYears.Text)
                };
                db.StudySubjectSet.Add(item);
                db.SaveChanges();
                ddlStudyCategory.Items.Add(new ListItem(item.Name,item.Id.ToString()));
            }
            tbNewStudyCategory.Text = "";
            gvStudyCategory.DataBind();
        }

        protected void bInserNnewStudySubCategory_Click(object sender, EventArgs e)
        {
            if (tbNewStudySubCategory.Text == "") { tbNewStudySubCategory.BackColor = Color.MistyRose; tbNewStudySubCategory.ToolTip = "This is Required field"; return; }
            else
            {
                SubjectSubCategorySet item = new SubjectSubCategorySet()
                {
                    Name = tbNewStudySubCategory.Text,
                    StudySubject_Id = Int32.Parse(ddlStudyCategory.SelectedValue)
                };
                db.SubjectSubCategorySet.Add(item);
                db.SaveChanges();
                ddlStudySubCategory.Items.Add(new ListItem(item.Name, item.Id.ToString()));
                tbNewStudySubCategory.Text = "";
                gvStudyCategory.DataBind();
            }
        }

        protected void GotoSubjectGroups1_Click(object sender, EventArgs e)
        {
            MultiViewMainPage.ActiveViewIndex = 3;
        }

        protected void GoToSheduleCreator_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MainMenu/SheduleCreator.aspx?YearID=" + DropDownListYears.SelectedValue);
        }
    }
}