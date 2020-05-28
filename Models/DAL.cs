using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using NUnit.Framework.Internal.Execution;

namespace PlantFinderDevBuildFinal.Models
{
    public class DAL
    {
        private SqlConnection conn;

        public DAL(string connectionString)
        {
            conn = new SqlConnection(connectionString);
        }

        //Queries the database for all plants
        public IEnumerable<Plant> GetAllPlants()
        {
            string queryString = "EXEC GetPlants";
            IEnumerable<Plant> plants = conn.Query<Plant>(queryString);
            return plants;
        }

        //Queries the database for a plant based off of its ID
        public Plant GetPlantByID(int id)
        {
            string queryString = "EXEC GetPlantByID @id";
            Plant singlePlant = conn.QueryFirst<Plant>(queryString, new { id = id });
            return singlePlant;
        }

        //Adds a Plant object to the database
        public int AddPlant(Plant singlePlant)
        {
            string addString = "INSERT INTO Plants (ID, Title, Image, Description) ";
            addString += "VALUES(@ID, @Title, @Image, @Description)";
            return conn.Execute(addString, singlePlant);
        }

        //Deletes a Plant object from the database
        public int DeletePlantByID(int id)
        {
            string deleteString = "EXEC DeletePlantByID @id";
            return conn.Execute(deleteString, new { id = id });
        }

        public IEnumerable<JoinedPlant> GetJoined(int id)
        {
            //string command = "EXEC GetJoined @id";
            string command = "SELECT w.ID, w.UserID, w.PlantID, p.ID, p.Title, p.Image, p.Description ";
            command += "FROM My_Plants w INNER JOIN Plants p ON w.PlantID = p.ID WHERE w.UserID=@id";
            IEnumerable<JoinedPlant> result = conn.Query<JoinedPlant>(command, new { id = id });
            return result;
        }

        public IEnumerable<JoinedPlant> GetWishlist(int id)
        {
            //string command = "SELECT w.ID, w.UserID, w.PlantID, p.ID, p.Title, p.Image, p.Description ";
            //command += "FROM Wish_List w INNER JOIN Plants p ON w.PlantID = p.ID WHERE w.UserID=@id";
            string command = "EXEC GetWishlist @id";


            IEnumerable<JoinedPlant> result = conn.Query<JoinedPlant>(command, new { id = id });
            return result;
        }

        //Add to favorites
        public int AddToWishlist(Wishlist w)
        {
            string command = "EXEC AddToWishlist @UserID, @PlantID";




            int result = conn.Execute(command, new
            {
                UserID = w.UserID,
                PlantID = w.PlantID
            });
            return result;
        }
        //Delete from favorites
        public int DeleteWishlistByID(int id)
        {
            string deleteString = "EXEC DeleteWishlistByID @id";
            return conn.Execute(deleteString, new { id = id});
        }

        public int AddToMyPlants(MyPlants m)
        {
            string command = "INSERT INTO My_Plants (Water_Completed, UserID, PlantID) ";
            command += "VALUES (@Water_Completed, @UserID, @PlantID)";


            int result = conn.Execute(command, new
            {
                water_Completed = m.WaterCompleted,
                userID = m.UserID,
                plantID = m.PlantID,
            });
            return result;
        }

        public IEnumerable<JoinedPlant> GetMyPlants(int id)
        {

            string command = "SELECT w.ID, w.UserID, w.PlantID, p.ID, p.Title, p.Image, p.Description ";
            command += "FROM My_Plants w INNER JOIN Plants p ON w.PlantID = p.ID WHERE w.UserID=@id";


            IEnumerable<JoinedPlant> result = conn.Query<JoinedPlant>(command, new { id = id });
            return result;
        }

        public int DeleteFromMyPlants(int id)
        {
            string deleteString = "EXEC DeleteFromMyPlants @id";
            return conn.Execute(deleteString, new { id = id });
        }


    }
}