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
    
    public partial class StudentsNotes
    {
        public int Id { get; set; }
        public string Description { get; set; }
        public string Note { get; set; }
    
        public virtual SubjectSubCategory SubjectSubCategory { get; set; }
        public virtual Student Student { get; set; }
    }
}
