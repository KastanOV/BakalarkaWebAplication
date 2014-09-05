using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace WebAplicationForTeachers
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        PupilBookEntities db = new PupilBookEntities();
        int YearID = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                try
                {
                    YearID = Int32.Parse(Server.UrlDecode(Request.QueryString["YearID"]));
                    string id = User.Identity.GetUserId();
                    bool validation = (from i in db.UserSet
                                       join j in db.YearSet on i.Id equals j.User_Id
                                       where i.Id == id && j.Id == YearID
                                       select i).Any();
                    if (!validation) Response.Redirect("~/");
                }
                catch
                {
                    Response.Redirect("~/");
                }
                bool existShedule = (from i in db.SheduleSet
                                     where i.SchoolYear_Id == YearID
                                     select i).Any();
                if (!existShedule)
                {
                    MultiView1.ActiveViewIndex = 1;
                    
                    lYear.Text = (from i in db.YearSet
                                  where i.Id == YearID
                                  select i.Name).First();
                }
                else
                {
                    var Years = from i in db.SheduleSet
                                where i.SchoolYear_Id == YearID
                                select new { i.Id, i.Period };
                    foreach (var i in Years)
                    {
                        if (i.Period == "S")
                        {
                            ddlChangeShedule.Items.Add(new ListItem("Summer semester", i.Id.ToString()));
                        }
                        else
                        {
                            ddlChangeShedule.Items.Add(new ListItem("Winter semester", i.Id.ToString()));
                        }
                    }
                    MultiView1.ActiveViewIndex = 0;
                }
            }
        }
        protected void oddEvenYes_Click(object sender, EventArgs e)
        {
            YearID = Int32.Parse(Server.UrlDecode(Request.QueryString["YearID"]));
            SheduleSet item1 = new SheduleSet()
            {
                Period = "S",
                EvenWeek = true,
                SchoolYear_Id = YearID
            };
            SheduleSet item2 = new SheduleSet()
            {
                Period = "W",
                EvenWeek = true,
                SchoolYear_Id = YearID
            };
            db.SheduleSet.Add(item1);
            db.SheduleSet.Add(item2);
            db.SaveChanges();
            MultiView1.ActiveViewIndex = 0;
        }
        protected void oddEvenNo_Click(object sender, EventArgs e)
        {
            YearID = Int32.Parse(Server.UrlDecode(Request.QueryString["YearID"]));
            SheduleSet item1 = new SheduleSet()
            {
                Period = "S",
                EvenWeek = false,
                SchoolYear_Id = YearID
            };
            SheduleSet item2 = new SheduleSet()
            {
                Period = "W",
                EvenWeek = false,
                SchoolYear_Id = YearID
            };
            db.SheduleSet.Add(item1);
            db.SheduleSet.Add(item2);
            db.SaveChanges();
            MultiView1.ActiveViewIndex = 0;
        }

        protected void AddTimeSpan_Click(object sender, EventArgs e)
        {

        }
    }
}