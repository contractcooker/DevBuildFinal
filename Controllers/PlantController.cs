using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using PlantFinderDevBuildFinal.Models;

namespace PlantFinderDevBuildFinal.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PlantController : ControllerBase
    {
        private DAL dal;

        public PlantController(IConfiguration config)
        {
            dal = new DAL(config.GetConnectionString("default"));
        }

        [HttpGet]
        public IEnumerable<Plant> GetPlants()
        {

            IEnumerable<Plant> result = dal.GetAllPlants();
            return result;

        }

        [HttpGet("{id}")]
        public Plant GetPlantsByID(int id)
        {
            Plant result = dal.GetPlantByID(id);
            return result;
        }

        [HttpPost]
        public int AddPlant(Plant addplant)
        {
            int result = dal.AddPlant(addplant);
            return result;
        }

        [HttpDelete("{id}")]
        public int DeletePlant(int id)
        {
            int result = dal.DeletePlantByID(id);
            return result;
        }
    }
}