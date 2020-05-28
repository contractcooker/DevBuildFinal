using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PlantFinderDevBuildFinal.Models
{
    public class JoinedPlant
    {
        public int ID { get; set; }
        public int UserID { get; set; }
        public Boolean WaterCompleted { get; set; }
        public string Title { get; set; }
        public string Image { get; set; }
        public string Description { get; set; }

    }
}
