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
    
    public partial class StudySubject
    {
        public StudySubject()
        {
            this.SubjectSubCategory = new HashSet<SubjectSubCategory>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
    
        public virtual SchoolYear SchoolYear { get; set; }
        public virtual ICollection<SubjectSubCategory> SubjectSubCategory { get; set; }
    }
}