using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace employeesM.Models
{
    public class Employees
    {
        public int id { get; set; }
        public string name { get; set; }
        public string picture { get; set; }
        public string phoneNumber { get; set; }
        public string email { get; set; }
        public string hireDate { get; set; }
        public int timeWorked { get; set; }
        public int status { get; set; }
        public int managerId { get; set; }
    }
}
