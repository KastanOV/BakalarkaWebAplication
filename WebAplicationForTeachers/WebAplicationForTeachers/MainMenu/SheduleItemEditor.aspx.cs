using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAplicationForTeachers
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private int? _YearID = null, _SheduleHoursSet_ID = null, _Day = null, _SheduleID = null, _SheduleItemID = null;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    _YearID = Int32.Parse(Server.UrlDecode(Request.QueryString["Year"]));
                    _SheduleHoursSet_ID = Int32.Parse(Server.UrlDecode(Request.QueryString["SheduleHoursSet_ID"]));
                    _Day = Int32.Parse(Server.UrlDecode(Request.QueryString["Day"]));
                    _SheduleID = Int32.Parse(Server.UrlDecode(Request.QueryString["SheduleID"]));
                }
                catch { Response.Redirect("~/"); }
                try
                {
                    _SheduleItemID = Int32.Parse(Server.UrlDecode(Request.QueryString["SheduleItemID"]));
                }
                catch
                {
                    //TODO
                }
                //security();

                fillForm();
            }

        }
        private void security()
        {
            //TODO
            throw new NotImplementedException();
        }
        private void fillForm()
        {
            if (_SheduleItemID == null)
            {
                fillUnusedForm();
            }
            else
            {
                fillUsedForm();
            }
        }
        private void fillUnusedForm()
        {
            using (PupilBookEntities db = new PupilBookEntities())
            {
                var item = (from i in db.SheduleHoursSet
                            where i.Id == _SheduleHoursSet_ID
                            select new { start = i.BeginTime, end = i.EndTime }).First();
                LabelInfo.Text = "Zvolte předmět a studíjní skupinu";
                Label1.Text = "Začátek - " + item.start + " Konec - " + item.end;
                Label2.Text = "Den v týdnu " + MainMenu.Days.GetDay(_Day);
                var StudyGroups = from i in db.StudyGroupSet
                                  where i.SchoolYear_Id == _YearID
                                  select new { StudyGroupID = i.Id, StudyGroupName = i.GroupNameShort };
                ddlStudyGroup.Items.Add(new ListItem("Vybert studíjní skupinu", "-1"));
                ddlSubject.Items.Add(new ListItem("Vyberte předmět", "-1"));
                foreach (var i in StudyGroups)
                {
                    ddlStudyGroup.Items.Add(new ListItem(i.StudyGroupName, i.StudyGroupID.ToString()));
                }

                var Subjects = from i in db.StudySubjectSet
                               join j in db.SubjectSubCategorySet on i.Id equals j.StudySubject_Id
                               where i.SchoolYear_Id == _YearID
                               select new { j.Name, j.Id };
                foreach (var i in Subjects)
                {
                    ddlSubject.Items.Add(new ListItem(i.Name, i.Id.ToString()));
                }
            }
        }
        private void fillUsedForm()
        {
            using (PupilBookEntities db = new PupilBookEntities())
            {
                var SelectedItem = (from i in db.SheduleItemSet
                                    where i.Id == _SheduleItemID
                                    select i).First();
                var item = (from i in db.SheduleHoursSet
                            where i.Id == _SheduleHoursSet_ID
                            select new { start = i.BeginTime, end = i.EndTime }).First();

                LabelInfo.Text = "Zvolte předmět a studíjní skupinu";
                Label1.Text = "Začátek - " + item.start + " Konec - " + item.end;
                Label2.Text = "Den v týdnu " + MainMenu.Days.GetDay(_Day);
                var StudyGroups = from i in db.StudyGroupSet
                                  where i.SchoolYear_Id == _YearID
                                  select new { StudyGroupID = i.Id, StudyGroupName = i.GroupNameShort };
                ddlStudyGroup.Items.Add(new ListItem("Vybert studíjní skupinu", "-1"));
                ddlSubject.Items.Add(new ListItem("Vyberte předmět", "-1"));
                foreach (var i in StudyGroups)
                {
                    ddlStudyGroup.Items.Add(new ListItem(i.StudyGroupName, i.StudyGroupID.ToString()));
                }

                var Subjects = from i in db.StudySubjectSet
                               join j in db.SubjectSubCategorySet on i.Id equals j.StudySubject_Id
                               where i.SchoolYear_Id == _YearID
                               select new { j.Name, j.Id };

                foreach (var i in Subjects)
                {
                    ddlSubject.Items.Add(new ListItem(i.Name, i.Id.ToString()));
                }
                ddlStudyGroup.SelectedValue = SelectedItem.StudyGroup_Id.ToString();
                ddlSubject.SelectedValue = SelectedItem.SubjectSubCategory_Id.ToString();
            }
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            int SubjectID, StudyGroupID;
            SubjectID = Int32.Parse(ddlSubject.SelectedValue);
            StudyGroupID = Int32.Parse(ddlStudyGroup.SelectedValue);
            if ((SubjectID == -1 && StudyGroupID != -1) || (SubjectID != -1 && StudyGroupID == -1))
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Musíte vybrat obě pole nebo žádné');", true);
                return;
            }
            else
            {
                SaveDataUnused(SubjectID, StudyGroupID);
            }
        }
        private void SaveDataUnused(int SubjectId, int StudyGroupID)
        {
            _SheduleHoursSet_ID = Int32.Parse(Server.UrlDecode(Request.QueryString["SheduleHoursSet_ID"]));
            _Day = Int32.Parse(Server.UrlDecode(Request.QueryString["Day"]));
            _SheduleID = Int32.Parse(Server.UrlDecode(Request.QueryString["SheduleID"]));

            try
            {
                _SheduleItemID = Int32.Parse(Server.UrlDecode(Request.QueryString["SheduleItemID"]));
            }
            catch
            {
                _SheduleItemID = null;
            }
            if (_SheduleItemID == null)
            {
                //TODO Security
                SheduleItemSet item = new SheduleItemSet()
                {
                    Day = (byte)_Day,
                    Even = null,
                    Shedule_Id = (int)_SheduleID,
                    SheduleHoursSet_ID = (int)_SheduleHoursSet_ID,
                    StudyGroup_Id = StudyGroupID,
                    SubjectSubCategory_Id = SubjectId
                };
                using (PupilBookEntities db = new PupilBookEntities())
                {
                    db.SheduleItemSet.Add(item);
                    db.SaveChanges();
                }
                Response.Redirect("~/MainMenu/SheduleCreator?YearID=" + Server.UrlDecode(Request.QueryString["Year"]) + "&SheduleItemEdit=true");
            }
            else
            {
                using (PupilBookEntities db = new PupilBookEntities())
                {

                    SheduleItemSet SheduleItem = (from i in db.SheduleItemSet
                                                  where i.Id == _SheduleItemID
                                                  select i).First();
                    SheduleItem.StudyGroup_Id = Int32.Parse(ddlStudyGroup.SelectedValue);
                    SheduleItem.SubjectSubCategory_Id = Int32.Parse(ddlSubject.SelectedValue);
                    db.SaveChanges();
                }
                Response.Redirect("~/MainMenu/SheduleCreator?YearID=" + Server.UrlDecode(Request.QueryString["Year"]) + "&SheduleItemEdit=true");

            }

        }
    }
}