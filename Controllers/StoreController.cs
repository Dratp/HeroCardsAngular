using AngularHeroCards.Models;
using AngularHeroCards.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;

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
        [Route("cards/ClearCardShop")]
        public object ClearShop()
        {
            // Clears all cards out of the shop
            gameData.ClearShop();

            return new { response = true, result = "Card Shop is now empty" };
        }

        [HttpGet]
        [Route("cards/CardShop")]
        public List<HeroActionCard> GetCurrentShopCards()
        {
            return gameData.AllShopCards();
        }

        [HttpGet]
        [Route("cards/CardShop/{playerID}")]
        public List<HeroActionCard> GetPlayersCurrentShopCards(long playerID)
        {
            return gameData.PlayersShopCards(playerID);
        }

        [HttpGet]
        [Route("cards/ClearCardShop/{playerID}")]
        public object ClearPlayerCardShop(long playerID)
        {
            // Clears all cards out of the shop
            gameData.ClearPlayerCardShop(playerID);

            return new { response = true, result = "Card Shop is now empty" };
        }

    }
}
