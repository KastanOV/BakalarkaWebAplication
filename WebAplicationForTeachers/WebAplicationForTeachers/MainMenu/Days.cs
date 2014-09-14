using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAplicationForTeachers.MainMenu
{
    public static class Days
    {
        public static string GetDay(int? day)
        {

            switch (day)
            {
                case 0: return "Pondělí";
                    
                case 1: return "Úterý";
                    
                case 2: return "Středa";
                    
                case 3: return "Čtvrtek";
                    
                case 4: return "Pátek";
                    
                case 5: return "Sobota";
                    
                case 6: return "Neděle";
                    
                default: return "ERROR";
                    
            }
        }
    }
}