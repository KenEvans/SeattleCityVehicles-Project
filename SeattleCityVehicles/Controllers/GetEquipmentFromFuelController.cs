using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SeattleCityVehicles.Controllers
{
    public class GetEquipmentFromFuelController : ApiController
    {
        //Written by Dylan York

        SeattleCityVehiclesEntities vehicleDB = new SeattleCityVehiclesEntities();
        [HttpGet]
        public IEnumerable<object> GetEquipmentType(string id)
        {

            var EquipmentCollection = (from model in vehicleDB.Sold_Fleet_Equipment
                                      where model.FuelType1.FuelType1 == id
                                      select new { model.EquipmentType }).Distinct();

            return EquipmentCollection;
        }
    }
}
