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
    
    public partial class SheduleItemSet
    {
        public int Id { get; set; }
        public Nullable<System.TimeSpan> BeginTime { get; set; }
        public Nullable<System.TimeSpan> EndTime { get; set; }
        public byte Day { get; set; }
        public int Shedule_Id { get; set; }
        public int SubjectSubCategory_Id { get; set; }
    
        public virtual SubjectSubCategorySet SubjectSubCategorySet { get; set; }
        public virtual SheduleSet SheduleSet { get; set; }
    }
}