using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SeattleCityVehicles.Controllers
{
    public class DeptSoldPurchValuesController : ApiController
    {
        /// <summary>
        /// Get method to return the sum of fleet sales and the sum of PHEV purchases by department
        /// Returns a decimal array with the sales and purchases
        /// Written by Ken Evans
        /// </summary>

        readonly SeattleCityVehiclesEntities myDB = new SeattleCityVehiclesEntities();

        [HttpGet]
        public IHttpActionResult GetDeptSalesPurch(string deptName)
        {
            decimal[] myValues = new decimal[2];
            decimal deptSellActivity = 0;
            decimal deptBuyActivity = 0;

            try
            {
                deptSellActivity = (from deptSells in myDB.Sold_Fleet_Equipment
                                        where deptSells.DepartmentName.DeptName == deptName
                                        select deptSells.SalePrice).Sum();
            }
            catch (Exception)
            {
                deptSellActivity = 0;
            }

            try
            {
                deptBuyActivity = (from deptBuys in myDB.Active_PHEVs
                                   where deptBuys.DepartmentName.DeptName == deptName
                                   select deptBuys.InServiceCost).Sum();
            }
            catch (Exception)
            {
                deptBuyActivity = 0;
            }

            myValues[0] = deptSellActivity;
            myValues[1] = deptBuyActivity;

            return Ok(myValues);

        }
    }
}
