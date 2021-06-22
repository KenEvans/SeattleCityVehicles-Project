using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SeattleCityVehicles.Controllers
{
    public class GetManufacturerController : ApiController
    {
        //Written by Dylan York

        //Vehicles Database entitiy
        SeattleCityVehiclesEntities vehicleDB = new SeattleCityVehiclesEntities();
        // returns list of Manufacturers

        [HttpGet]
        public IEnumerable<string> GetTypeOfCar()
        {
            // selects each car
            var typeofMan = (from cars in vehicleDB.VehicleMakes
                             select cars.VehicleMake1).Distinct().AsEnumerable();

            // returns list of cars
            return typeofMan;
        }
    }
}
