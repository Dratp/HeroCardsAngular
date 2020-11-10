using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using AngularHeroCards.Models;
using AngularHeroCards.Services;

namespace AngularHeroCards.Controllers
{
    [Route("api/Store")]
    [ApiController]
    public class StoreController : ControllerBase
    {

        IGameData gameData;

        public StoreController(IGameData _db)
        {
            gameData = _db;
        }

        [HttpGet]
        [Route("cards/{numberOfCards}")]
        public List<HeroActionCard> StockCardStore(int numberOfCards)
        {
            Random rand = new Random();

            // Pulls all possbile cards
            List<HeroActionCard> fullLibrary = gameData.GetLibrary();

            // Selects X random cards and adds them to the datbase that holds the cards in the shop
            for (int i = 0; i < numberOfCards; i++)
            {
                gameData.AddCardToShop(fullLibrary[rand.Next(0, fullLibrary.Count)]);
            }

            // Returns all the cards in the database that the store currently has.
            return gameData.AllShopCards();
        }


        [HttpGet]
        [Route("cards/ClearShop")]
        public object ClearShop()
        {
            // Clears all cards out of the shop
            gameData.ClearShop();

            return new { response = true,  result = "Card Shop is now empty"};
        }

        [HttpGet]
        [Route("cards/CardShop")]
        public List<HeroActionCard> GetCurrentShopCards()
        {
            return gameData.AllShopCards();
        }




    }
}
