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
    
    public partial class SheduleHours
    {
        public int Id { get; set; }
        public System.TimeSpan BeginTime { get; set; }
        public System.TimeSpan EndTime { get; set; }
    
        public virtual SchoolShedule SchoolShedule { get; set; }
        public virtual SheduleItem SheduleItem { get; set; }
    }
}