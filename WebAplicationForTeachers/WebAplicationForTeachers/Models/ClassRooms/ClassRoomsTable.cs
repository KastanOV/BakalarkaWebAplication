using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Identity;

namespace WebAplicationForTeachers.Models.ClassRooms
{
    public class ClassRoomsTable
    {
        PupilBookEntities db = new PupilBookEntities();
        public List<StudyGroupSet> getClassRoomsForGrid(string identity)
        {
            var group = (from i in db.StudyGroupSet
                         join j in db.YearSet on i.SchoolYear_Id equals j.Id
                         join k in db.UserSet on j.User_Id equals k.Id
                         where k.Id == identity
                         select i).ToList();
            return group;
        }
    }
}