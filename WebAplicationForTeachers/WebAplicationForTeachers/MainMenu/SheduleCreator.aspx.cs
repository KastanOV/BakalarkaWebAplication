using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using System.Drawing;
using WebAplicationForTeachers.MainMenu;

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
                    SelectView(1);

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
                            ddlChangeShedule.Items.Add(new ListItem("Letní semestr", i.Id.ToString()));
                        }
                        else
                        {
                            ddlChangeShedule.Items.Add(new ListItem("Zimní semestr", i.Id.ToString()));
                        }
                    }

                }
                SelectView(null);
            }
        }
        private void SelectView(int? View)
        {
            
            if (View != null)
            {
                switch (View)
                {
                    case 0: MultiView1.ActiveViewIndex = 0;
                        break;
                    case 1: MultiView1.ActiveViewIndex = 1;
                        break;
                    case 2: MultiView1.ActiveViewIndex = 2;
                        LoadShedule();
                        break;
                }
            }
            else
            {
                MultiView1.ActiveViewIndex = 0;
            }
            try
            {
                string tmp = Server.UrlDecode(Request.QueryString["SheduleItemEdit"]);
                if (tmp == "true")
                {
                    LoadShedule();
                }
            }
            catch
            {
                
            }

        }
        private void LoadShedule()
        {
            int SheduleID = Int32.Parse(ddlChangeShedule.SelectedValue);
            var shedule = (from i in db.SheduleSet
                           where i.Id == SheduleID
                           select i).First();
            //Testing if User using for this Shedule Even/ODD System
            if (shedule.EvenWeek == true)
            {
                MultiView1.ActiveViewIndex = 3;
                CreateDoubleCalendar(SheduleID);
            }
            else
            {
                MultiView1.ActiveViewIndex = 2;
                CreateSimpleCalendar(SheduleID);
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
            SelectView(0);
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
            SelectView(0);
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
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Opravdu budete mít noční vyučování?');", true);
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
                    Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Vysktl se konflikt ve vyučování, zřejmě tato vyučovací hodina zasahuje do jiné vyučovací hodiny');", true);
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
        private void CreateDoubleCalendar(int SheduleID)
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

            TableRow rowHeader = new TableRow();
            TableCell FirstCell = new TableCell();
            FirstCell.CssClass = "Form-Control";
            FirstCell.Text = "<b>Rozvrh Hodin<b/>";

            rowHeader.Cells.Add(FirstCell);

            foreach (var i in times)
            {
                TableCell cell = new TableCell();
                cell.CssClass = "Form-Control";
                cell.Text = String.Format("{0}<br/>{1}", i.BeginTime.ToString(), i.EndTime.ToString());
                rowHeader.Cells.Add(cell);
                SheduleTableEven.Rows.Add(rowHeader);
                SheduleTableOdd.Rows.Add(rowHeader);
            }

            for (int j = 0; j < 5; j++)
            {
                TableCell Days = new TableCell();
                Days.CssClass = "Form-Control";
                Days.Text = MainMenu.Days.GetDay(j);
                TableRow rowEven = new TableRow();
                TableRow rowOdd = new TableRow();
                rowEven.Cells.Add(Days);
                rowOdd.Cells.Add(Days);

                foreach (var i in times)
                {
                    TableCell cellEven = new TableCell();
                    TableCell cellOdd = new TableCell();
                    SheduleButtons buttonEven = new SheduleButtons(YearID, i.Id, j, SheduleID, true);
                    SheduleButtons buttonOdd = new SheduleButtons(YearID, i.Id, j, SheduleID, false);
                    cellEven.Controls.Add(buttonEven);
                    cellOdd.Controls.Add(buttonOdd);
                }
                SheduleTableEven.Rows.Add(rowEven);
                SheduleTableOdd.Rows.Add(rowOdd);
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

            TableRow rowHeader = new TableRow();
            TableCell FirstCell = new TableCell();
            FirstCell.CssClass = "Form-Control";
            FirstCell.Text = "<b>Rozvrh Hodin<b/>";

            rowHeader.Cells.Add(FirstCell);

            foreach (var i in times)
            {
                TableCell cell = new TableCell();
                cell.CssClass = "Form-Control";
                cell.Text = String.Format("{0}<br/>{1}", i.BeginTime.ToString(), i.EndTime.ToString());
                rowHeader.Cells.Add(cell);
                SheduleTable.Rows.Add(rowHeader);
            }
            for (int j = 0; j < 5; j++)
            {
                TableCell Days = new TableCell();
                Days.CssClass = "Form-Control";
                Days.Text = MainMenu.Days.GetDay(j);
                TableRow row = new TableRow();
                row.Cells.Add(Days);

                foreach (var i in times)
                {

                    TableCell cell1 = new TableCell();
                    SheduleButtons button = new SheduleButtons(YearID, i.Id, j, SheduleID, null);
                    cell1.Controls.Add(button);
                    row.Cells.Add(cell1);
                }

                SheduleTable.Rows.Add(row);
            }
        }
        protected void GoToSheduleCreator_Click(object sender, EventArgs e)
        {
            SelectView(2);
        }
    }
}