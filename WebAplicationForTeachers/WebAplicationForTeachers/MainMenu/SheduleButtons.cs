using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;

namespace WebAplicationForTeachers.MainMenu
{
    public class SheduleButtons : HyperLink
    {
        public SheduleButtons(int YearID, int TimeID, int Day, int SheduleID, bool? Even)
        {
            int? SheduleItemID = null;
            
            using (PupilBookEntities db = new PupilBookEntities())
            {
                 
                try
                {
                    var SheduleItem = (from SI in db.SheduleItemSet
                                       join SubcatItemSI in db.SubjectSubCategorySet on SI.SubjectSubCategory_Id equals SubcatItemSI.Id
                                       join Subject in db.StudySubjectSet on SubcatItemSI.StudySubject_Id equals Subject.Id
                                       join StudyGroupSI in db.StudyGroupSet on SI.StudyGroup_Id equals StudyGroupSI.Id
                                       where SI.Shedule_Id == SheduleID && SI.Day == Day && SI.SheduleHoursSet_ID == TimeID && SI.Even == Even
                                       select new { SubjectName = Subject.Name, SheduleItemID = SI.Id, SheduleID = SI.Shedule_Id, SubjectID = SI.SubjectSubCategory_Id, StudyGroupID = SI.StudyGroup_Id, SubSubjectName = SubcatItemSI.Name, StudyGroupName = StudyGroupSI.GroupNameShort }).First();
                    
                    if (SheduleItem.SubjectID == -1 || SheduleItem.StudyGroupID == -1)
                    {
                        this.BackColor = Color.LightGreen;
                        this.Text = "Volná <br /> hodina";
                    }
                    else
                    {
                        SheduleItemID = SheduleItem.SheduleItemID;
                        this.BackColor = Color.MistyRose;
                        this.Text = SheduleItem.StudyGroupName + " <br /> " + SheduleItem.SubjectName + " <br /> " + SheduleItem.SubSubjectName;
                    }
                }

                catch
                {
                    this.BackColor = Color.LightGreen;
                    this.Text = "Volná <br /> hodina";
                }
            }
            
            StringBuilder url = new StringBuilder();
            url.Append("~/MainMenu/SheduleItemEditor.aspx?Year=").Append(YearID);
            url.Append("&SheduleHoursSet_ID=").Append(TimeID);
            url.Append("&Day=").Append(Day);
            url.Append("&SheduleID=").Append(SheduleID);
            if (SheduleItemID != null)
            {
                url.Append("&SheduleItemID=").Append(SheduleItemID);
            }
            this.NavigateUrl = url.ToString();
            this.CssClass = "btn btn-default";
        }
    }
}