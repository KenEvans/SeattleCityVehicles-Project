using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SeattleCityVehicles.Controllers
{
    public class GetModelFromMakerController : ApiController
    {
        SeattleCityVehiclesEntities vehicleDB = new SeattleCityVehiclesEntities();
        [HttpGet]
        public IEnumerable<object> GetModelFromMaker(string id)
        {

            var ModelCollection = from model in vehicleDB.Sold_Fleet_Equipment
                                  where model.VehicleMake.VehicleMake1 == id
                                  select new { model.Model };
            
            return ModelCollection;
        }
        
    }
}
