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
            int StartHour = Int32.Parse(ddlStartHour.Text);
            int StartMinute = Int32.Parse(ddlStartMinute.Text);
            int EndHour = Int32.Parse(ddlEndHour.Text);
            int EndMinute = Int32.Parse(ddlEndMinute.Text);
            int Shedule_id = Int32.Parse(ddlChangeShedule.SelectedValue);

            TimeSpan start = new TimeSpan(StartHour, StartMinute, 0);
            TimeSpan end = new TimeSpan(EndHour, EndMinute, 0);
            if (start >= end)
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Really you night work?');", true);
                return;
            }

            var item = from i in db.SheduleHoursSet
                       where i.Shedule_Id == Shedule_id
                       select i;
            foreach (var i in item)
            {
                if ((start >= i.BeginTime && start <= i.EndTime) || (end >= i.BeginTime && end <= i.EndTime)
                    || (i.BeginTime >= start && i.BeginTime <= end) || (i.EndTime >= start && i.EndTime <= end))
                {
                    Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Shedule times conflict');", true);
                    return;
                }
            }

            SheduleHoursSet newHourSet = new SheduleHoursSet()
            {
                BeginTime = start,
                EndTime = end,
                Shedule_Id = Shedule_id
            };

            db.SheduleHoursSet.Add(newHourSet);
            db.SaveChanges();

            gvSheduleTimes.DataBind();

        }
        protected void LoadShedule_Click(object sender, EventArgs e)
        {
            int SheduleID = Int32.Parse(ddlChangeShedule.SelectedValue);
            var shedule = (from i in db.SheduleSet
                           where i.Id == SheduleID
                           select i).First();
            //Testing if User using for this Shedule Even/ODD System
            if (shedule.EvenWeek == true)
            {
                // Tady se bude generovat dvojitý kalendar pro sudé a liché týdny
            }
            else
            {
                CreateSimpleCalendar(SheduleID);
            }
        }
        private void CreateSimpleCalendar(int SheduleID)
        {
            var times = from i in db.SheduleHoursSet
                        where i.Shedule_Id == SheduleID
                        select i;
            int YearID = Int32.Parse(Server.UrlDecode(Request.QueryString["YearID"]));
            var Subjects = from i in db.SubjectSubCategorySet
                           join j in db.StudySubjectSet on i.StudySubject_Id equals j.Id
                           where j.SchoolYear_Id == YearID
                           select i;

            var StudyGroup = from i in db.StudyGroupSet
                             where i.SchoolYear_Id == YearID
                             select i;


            
            foreach (var i in times)
            {
                TableRow rowHeader = new TableRow();
                TableCell cell = new TableCell();
                Label label1 = new Label();
                Label label2 = new Label();
                label1.Text = String.Format("{0}:{1}", i.BeginTime.Hours, i.BeginTime.Minutes);
                label2.Text = String.Format("{0}:{1}", i.EndTime.Hours, i.EndTime.Minutes);
                cell.Controls.Add(label1);
                cell.Controls.Add(label2);
                rowHeader.Cells.Add(cell);
                //table.Add(rowHeader);
                SheduleTable.Rows.Add(rowHeader);
            }
            for (int j = 0; j < 5; j++)
            {
                TableRow row = new TableRow();
                foreach (var i in times)
                {
                    
                    DropDownList ddlStudyGroups = new DropDownList();
                    DropDownList ddlSubjects = new DropDownList();
                    foreach (var k in StudyGroup)
                    {
                        ddlStudyGroups.Items.Add(new ListItem(String.Format("{0}", k.GroupNameShort), k.Id.ToString()));
                    }
                    foreach (var k in Subjects)
                    {
                        ddlSubjects.Items.Add(new ListItem(String.Format("{0}", k.Name), k.Id.ToString()));
                    }
                    TableCell cell1 = new TableCell();
                    cell1.Controls.Add(ddlStudyGroups);
                    cell1.Controls.Add(ddlSubjects);
                    row.Cells.Add(cell1);
                }
                //table.Add(row);
                SheduleTable.Rows.Add(row);
            }
            
        }

        protected void GoToSheduleCreator_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }
    }
}