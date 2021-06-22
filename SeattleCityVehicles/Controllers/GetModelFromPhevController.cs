using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SeattleCityVehicles.Controllers
{
    public class GetModelFromPhevController : ApiController
    {
        //Written by Dylan York

        SeattleCityVehiclesEntities vehicleDB = new SeattleCityVehiclesEntities();
        [HttpGet]
        public IEnumerable<object> GetModelFromMaker(string id)
        {

            var ModelCollection = (from model in vehicleDB.Active_PHEVs
                                  where model.VehicleMake.VehicleMake1 == id
                                  select new { model.Model }).Distinct();

            return ModelCollection;
        }
    }
}
