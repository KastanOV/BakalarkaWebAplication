//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebAplicationForTeachers
{
    using System;
    using System.Collections.Generic;
    
    public partial class SubjectSubCategorySet
    {
        public SubjectSubCategorySet()
        {
            this.ResultsSet = new HashSet<ResultsSet>();
            this.SheduleItemSet = new HashSet<SheduleItemSet>();
            this.StudentsNotesSet = new HashSet<StudentsNotesSet>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public int StudySubject_Id { get; set; }
    
        public virtual ICollection<ResultsSet> ResultsSet { get; set; }
        public virtual ICollection<SheduleItemSet> SheduleItemSet { get; set; }
        public virtual ICollection<StudentsNotesSet> StudentsNotesSet { get; set; }
        public virtual StudySubjectSet StudySubjectSet { get; set; }
    }
}