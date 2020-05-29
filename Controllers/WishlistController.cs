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
    [Route("api/wishlist")]
    [ApiController]
    public class WishlistController : ControllerBase
    {
        private DAL dal;

        public WishlistController(IConfiguration config)
        {
            dal = new DAL(config.GetConnectionString("DefaultConnection"));
        }

        [HttpGet("{id}")]
        public IEnumerable<JoinedPlant> GetWishlist(string id)
        {
            IEnumerable<JoinedPlant> result = dal.GetWishlist(id);
            return result;
        }

        [HttpPost]
        public Object AddToWishlist(Wishlist w)
        {
            IEnumerable<JoinedPlant> wishlist = dal.GetWishlist(w.UserID);
            int plantID = w.PlantID;
            int result = 0;

            foreach (JoinedPlant plant in wishlist)
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
            result = dal.AddToWishlist(w);
            return new
            {
                result = result,
                success = result == 1 ? true : false
            };
        }

        [HttpDelete("{id}")]
        public Object DeleteWishlist(int id)
        {
            return dal.DeleteWishlistByID(id);
           
        }
    }
}