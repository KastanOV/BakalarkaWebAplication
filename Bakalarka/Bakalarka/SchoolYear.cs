//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Bakalarka
{
    using System;
    using System.Collections.Generic;
    
    public partial class SchoolYear
    {
        public SchoolYear()
        {
            this.StudyGroup = new HashSet<StudyGroup>();
            this.StudySubject = new HashSet<StudySubject>();
            this.SchoolShedule = new HashSet<SchoolShedule>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public bool ActualYear { get; set; }
    
        public virtual User User { get; set; }
        public virtual ICollection<StudyGroup> StudyGroup { get; set; }
        public virtual ICollection<StudySubject> StudySubject { get; set; }
        public virtual ICollection<SchoolShedule> SchoolShedule { get; set; }
    }
}
