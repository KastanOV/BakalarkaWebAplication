using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebAplicationForTeachers.MainMenu;

namespace WebAplicationForTeachers
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadShedule();
        }
        private void LoadShedule()
        {
            using (PupilBookEntities db = new PupilBookEntities())
            {
                int SheduleID = Int32.Parse(Server.UrlDecode(Request.QueryString["SheduleID"]));
                var shedule = (from i in db.SheduleSet
                               where i.Id == SheduleID
                               select i).First();
                //Testing if User using for this Shedule Even/ODD System
                if (shedule.EvenWeek == true)
                {
                     MultiViewSheduleCreator.ActiveViewIndex = 1;
                    CreateDoubleCalendar(SheduleID);
                }
                else
                {
                    MultiViewSheduleCreator.ActiveViewIndex = 0;
                    CreateSimpleCalendar(SheduleID);
                }
            }
        }
        private void CreateDoubleCalendar(int SheduleID)
        {
            using (PupilBookEntities db = new PupilBookEntities())
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

                TableRow rowHeaderEven = new TableRow();
                TableRow rowHeaderOdd = new TableRow();
                TableCell FirstCellEven = new TableCell();
                TableCell FirstCellOdd = new TableCell();
                FirstCellEven.CssClass = "Form-Control";
                FirstCellOdd.CssClass = "Form-Control";
                FirstCellEven.Text = "<b>Rozvrh Hodin<b/>";
                FirstCellOdd.Text = "<b>Rozvrh Hodin<b/>";

                rowHeaderEven.Cells.Add(FirstCellEven);
                rowHeaderOdd.Cells.Add(FirstCellOdd);

                foreach (var i in times)
                {
                    TableCell cellEven = new TableCell();
                    TableCell cellOdd = new TableCell();
                    cellEven.CssClass = "Form-Control";
                    cellEven.Text = String.Format("{0}<br/>{1}", i.BeginTime.ToString(), i.EndTime.ToString());
                    cellOdd.CssClass = "Form-Control";
                    cellOdd.Text = String.Format("{0}<br/>{1}", i.BeginTime.ToString(), i.EndTime.ToString());
                    rowHeaderEven.Cells.Add(cellEven);
                    rowHeaderOdd.Cells.Add(cellOdd);
                    SheduleTableEven.Rows.Add(rowHeaderEven);
                    SheduleTableOdd.Rows.Add(rowHeaderOdd);
                }

                for (int j = 0; j < 5; j++)
                {
                    TableCell DaysEven = new TableCell();
                    TableCell DaysOdd = new TableCell();
                    DaysEven.CssClass = "Form-Control";
                    DaysEven.Text = MainMenu.Days.GetDay(j);
                    DaysOdd.CssClass = "Form-Control";
                    DaysOdd.Text = MainMenu.Days.GetDay(j);
                    TableRow rowEven = new TableRow();
                    TableRow rowOdd = new TableRow();
                    rowEven.Cells.Add(DaysEven);
                    rowOdd.Cells.Add(DaysOdd);

                    foreach (var i in times)
                    {
                        TableCell cellEven = new TableCell();
                        TableCell cellOdd = new TableCell();
                        SheduleButtons buttonEven = new SheduleButtons(YearID, i.Id, j, SheduleID, true);
                        SheduleButtons buttonOdd = new SheduleButtons(YearID, i.Id, j, SheduleID, false);
                        cellEven.Controls.Add(buttonEven);
                        cellOdd.Controls.Add(buttonOdd);
                        rowEven.Cells.Add(cellEven);
                        rowOdd.Cells.Add(cellOdd);
                    }
                    SheduleTableEven.Rows.Add(rowEven);
                    SheduleTableOdd.Rows.Add(rowOdd);
                }
            }
        }
        private void CreateSimpleCalendar(int SheduleID)
        {
            using (PupilBookEntities db = new PupilBookEntities())
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
        }
    }
}