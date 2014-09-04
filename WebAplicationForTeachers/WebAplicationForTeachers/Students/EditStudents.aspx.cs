using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAplicationForTeachers
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            using (var db = new PupilBookEntities()) {
                try
                {
                    YearID = Int32.Parse(Server.UrlDecode(Request.QueryString["SchoolYear"]));
                    StudyGroupID = Int32.Parse(Server.UrlDecode(Request.QueryString["StudyGroupID"]));
                }
                catch
                {
                    Response.Redirect("~/");
                }
                
            LabelYear.Text = (from i in db.YearSet
                              where i.Id == YearID
                              select i.Name).First();
            LabelStudyGroupName.Text = (from i in db.StudyGroupSet
                                        where i.Id == StudyGroupID
                                        select i.GroupNameShort).First();
            }
        }

        protected void Add_Click(object sender, EventArgs e)
        {
            bool formFalse = false;
            if (FirstName.Text == "") { FirstName.BackColor = Color.MistyRose; FirstName.ToolTip = "This is Required filed"; formFalse = true; }
            if (LastName.Text == "") { LastName.BackColor = Color.MistyRose; LastName.ToolTip = "This is Required filed"; formFalse = true; }
            if (formFalse) return;
            
            using (var db = new PupilBookEntities())
            {
                db.CreateStudent(FirstName.Text, LastName.Text, StudyGroupID);
                GridViewStudents.DataBind();
                FirstName.Text = "";
                LastName.Text = "";
            }
            
        }

        private int YearID { get; set; }

        private int StudyGroupID { get; set; }
        protected void GoToStudyGroups_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/FirstRun/CreateClassRoom.aspx?SchoolYear=" + YearID);
        }
        protected void GridViewStudents_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}