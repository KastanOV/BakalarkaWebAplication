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
    
    public partial class SchoolShedule
    {
        public SchoolShedule()
        {
            this.SheduleItem = new HashSet<SheduleItem>();
            this.SheduleHours = new HashSet<SheduleHours>();
        }
    
        public int Id { get; set; }
        public string Period { get; set; }
        public Nullable<bool> EvenWeek { get; set; }
    
        public virtual SchoolYear SchoolYear { get; set; }
        public virtual ICollection<SheduleItem> SheduleItem { get; set; }
        public virtual ICollection<SheduleHours> SheduleHours { get; set; }
    }
}
