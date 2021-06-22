using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace SeattleCityVehicles.Controllers
{
    public class GetTypeOfFuelController : ApiController
    {
        //Written by Dylan York

        //Vehicles Database entitiy
        SeattleCityVehiclesEntities vehicleDB = new SeattleCityVehiclesEntities();

        // returns list of Cars by type
        [HttpGet]
        public IEnumerable<string> GetTypeOfFuel()
        {
            // selects each car
            var typeOfFuel = (from car in vehicleDB.FuelTypes
                              select car.FuelType1).Distinct().AsEnumerable();

            // returns list of cars
            return typeOfFuel;
        }
    }
}
