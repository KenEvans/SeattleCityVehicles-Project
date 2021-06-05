using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SeattleCityVehicles.Controllers
{
    public class DepartmentNamesController : ApiController
    {
        /// <summary>
        /// Get method to return all the department names for the dropdown (select) menu
        /// Returns the department names
        /// Written by Ken Evans
        /// </summary>

        SeattleCityVehiclesEntities myDB = new SeattleCityVehiclesEntities();

        [HttpGet]
        public IEnumerable<string> GetDepartmentNames()
        {
            var allDepartments = (from deptNames in myDB.DepartmentNames
                                  select deptNames.DeptName).Distinct().AsEnumerable();
            return allDepartments;
        }
    }
}
