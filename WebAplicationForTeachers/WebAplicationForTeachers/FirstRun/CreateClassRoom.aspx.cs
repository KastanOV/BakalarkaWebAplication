using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace WebAplicationForTeachers
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        PupilBookEntities db = new PupilBookEntities();
        int YearID;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            try
            {
                YearID = Int32.Parse(Server.UrlDecode(Request.QueryString["SchoolYear"]));
                LabelYear.Text = (from i in db.YearSet
                                  where i.Id == YearID
                                  select i.Name).First();
            }
            catch (ArgumentNullException)
            {
                Response.Redirect("~/");
            }
            
        }

        protected void Add_Student_Click(object sender, EventArgs e)
        {
            int ClassRoomID = 0;
            try
            {
               ClassRoomID =Int32.Parse(GridViewClassRooms.SelectedValue.ToString());
               Response.Redirect("~/Students/AddStudent.aspx?ClassRoomID=" + ClassRoomID + "&SchoolYear=" + YearID);
            }
            catch
            {
                //Error mesage
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
                    SchoolYear_Id = YearID
                });
                db.SaveChanges();
            }
            GridViewClassRooms.DataBind();
        }

        protected void GridViewClassRooms_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("~/Students/EditStudents.aspx?StudyGroupID=" + GridViewClassRooms.SelectedValue.ToString() + "&SchoolYear=" + YearID);
        }
    }
}