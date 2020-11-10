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
    [Route("api/Player")]
    [ApiController]
    public class PlayerController : ControllerBase
    {
        IGameData gameData;

        public PlayerController(IGameData _db)
        {
            gameData = _db;
        }

        [HttpGet]
        [Route("{playerID}")]
        public Player GetPlayer (long playerID)
        {
            Player currentPlayer = Player.AssemblePlayer(playerID, gameData);
            return currentPlayer;
        }

        [HttpGet]
        [Route("login/{playerName}")]
        public object GetPlayerID (string playerName)
        {
            long id = gameData.GetPlayerID(playerName);
            
            if (id < 0)
            {
                //Login fail object response false reason string.
                return new { response = false, reason = "User does not exist." };
            }
            else
            {
                 //Login success object userID returned.
                return new { response = true, playerID = id, reason = "Success" };
            }
        }



    }
}
