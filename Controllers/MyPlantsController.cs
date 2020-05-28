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
    [Route("api/myplants")]
    [ApiController]
    public class MyPlantsController : ControllerBase
    {
        private DAL dal;

        public MyPlantsController(IConfiguration config)
        {
            dal = new DAL(config.GetConnectionString("default"));
        }

        [HttpGet("{id}")]
        public IEnumerable<JoinedPlant> GetMyPlants(int id)
        {
            IEnumerable<JoinedPlant> result = dal.GetJoined(id);
            return result;
        }

        [HttpPost]
        public Object AddToMyPlants(MyPlants w)
        {
            IEnumerable<JoinedPlant> m = dal.GetMyPlants(w.UserID);
            int plantID = w.PlantID;
            int result = 0;

            foreach (JoinedPlant plant in m)
            {
                if (plant.ID == (int)w.PlantID)
                {
                    return new
                    {
                        result = result,
                        success = result == 1 ? true : false
                    };
                }
            }
            result = dal.AddToMyPlants(w);
            return new
            {
                result = result,
                success = result == 1 ? true : false
            };
        }

        [HttpDelete("{id}")]
        public int DeleteFromMyPlants (int id)
        {
            int result = dal.DeleteFromMyPlants(id);
            return result;
        }
    }
}
