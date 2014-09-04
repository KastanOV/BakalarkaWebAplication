using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace WebAplicationForTeachers
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed4_Click(object sender, EventArgs e)
        {
            PupilBookEntities db = new PupilBookEntities();
            YearSet year = new YearSet() 
            {
                Name = SchoolYear.Text,
                ActualYear = true,
                User_Id = User.Identity.GetUserId()
            };
            db.YearSet.Add(year);
            db.SaveChanges();
            
            Response.Redirect("~/FirstRun/CreateClassRoom.aspx?SchoolYear=" + year.Id);
        }

        
    }
}