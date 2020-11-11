using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Dapper.Contrib.Extensions;
using Dapper;
using Microsoft.Extensions.Configuration;
using AngularHeroCards.Models;

namespace AngularHeroCards.Services
{
    public class DBGameData : IGameData
    {
        // const string server = "7RP7Q13\\SQLEXPRESS;Database=HeroCards;user id=csharp;password=abc123";

        IDbConnection db;

        public DBGameData(IConfiguration config)
        {
            db = new SqlConnection(config.GetConnectionString("kathryn"));
        }

        public void CreateDeck(Deck deck, long playerID)
        {
            // IDbConnection db = new SqlConnection(server);
            foreach (HeroActionCard card in deck.Cards)
            {
                db.Query($"insert into Deck (PlayerID, CollectionID, DeckNumber, Name) Values ('{playerID}','{card.CollectionID}', '{deck.DeckNumber}', '{deck.Name}')");
            }
        }

        public void CreateDoll(HeroDoll doll, long playerID)
        {
            // IDbConnection db = new SqlConnection(server);
            db.Insert(doll);
        }

        public long CreatePlayer(Player newplayer)
        {
            // IDbConnection db = new SqlConnection(server);
            long playerID = db.Insert(newplayer);
            return (playerID);
        }

        public void DeleteDeck(long deckNumber)
        {
            // IDbConnection db = new SqlConnection(server);
            db.Query($"Delete from Deck where DeckNumber = {deckNumber}");
        }

        public long GetPlayerID(string userName)
        {
            // IDbConnection db = new SqlConnection(server);
            long playerID;
            try
            {
                playerID = db.QuerySingle<long>($"select PlayerID from Player where Name = '{userName}'");
            }
            catch
            {
                playerID = -1;
            }
            return playerID;
        }

        public void DeleteDoll(long dollID)
        {
            // IDbConnection db = new SqlConnection(server);
            db.Query($"Delete from HeroDoll where id = {dollID}");
        }

        public List<HeroActionCard> GetCollection(long playerID)
        {
            List<HeroActionCard> playerCollection = new List<HeroActionCard>();
            // IDbConnection db = new SqlConnection(server);
            playerCollection = db.Query<HeroActionCard>($"select * from CardCollection join HeroActionCard on CardCollection.cardID = HeroActionCard.card_id where playerID = {playerID}").AsList<HeroActionCard>();
            return playerCollection;
        }

        //This method relies on GetCardbyCollectionID
        public Deck GetDeck(long DeckID)
        {
            Deck thisDeck = new Deck();
            List<long> collectionIDs = new List<long>();
            long playerID;

            //Get Deck Name
            thisDeck.Name = db.Query($"select distinct Name from Deck where DeckNumber = {DeckID}").ToString();
            // Get Player ID
            playerID = db.QuerySingle($"select distinct PlayerID from Deck where DeckNumber = {DeckID}");
            //Get collection ID's
            collectionIDs = db.Query<long>($"select CollectionID from Deck where DeckNumber = {DeckID}").AsList<long>();
            //Get Cards from player collection
            foreach (long collectionID in collectionIDs)
            {
                thisDeck.Cards.Add(GetCardByCollectionID(playerID, collectionID));
            }
            //thisDeck.Cards = db.Query


            return thisDeck;
        }

        //This method relies on GetDeck and GetDeckID's by extension GetDeck relies on GetCardbyCollectionID
        public List<Deck> GetDecks(long playerID)
        {
            List<long> deckids = GetDeckIDs(playerID);
            List<Deck> playerdecks = new List<Deck>();
            foreach (long deckid in deckids)
            {
                playerdecks.Add(GetDeck(deckid));
            }
            return playerdecks;
        }

        public List<long> GetDeckIDs(long playerID)
        {
            List<long> playerDecks = new List<long>();
            // IDbConnection db = new SqlConnection(server);
            playerDecks = db.Query<long>($"Select DeckNumber from Deck where PlayerID ={playerID}").AsList<long>();
            return playerDecks;
        }

        public HeroDoll GetDoll(long dollID)
        {
            // IDbConnection db = new SqlConnection(server);
            HeroDoll doll = db.QuerySingle<HeroDoll>($"select * from HeroDoll where id = {dollID}");
            return doll;
        }

        public List<HeroDoll> GetDolls(long playerID)
        {
            List<HeroDoll> dolls = db.Query<HeroDoll>($"select * from HeroDoll where PlayerID = {playerID}").AsList<HeroDoll>();
            return dolls;
        }

        public List<HeroActionCard> GetLibrary()
        {
            List<HeroActionCard> library = db.Query<HeroActionCard>($"select * from HeroActionCard").AsList<HeroActionCard>();
            return library;
        }

        public Player GetPlayer(long playerID)
        {
            Player thisplayer = db.Get<Player>(playerID);
            return thisplayer;
        }

        public HeroActionCard GetCardByCollectionID(long playerID, long collectionID)
        {
            List<HeroActionCard> playerCollection = GetCollection(playerID);
            foreach (HeroActionCard card in playerCollection)
            {
                if (collectionID == card.CollectionID)
                {
                    return card;
                }
            }
            return new HeroActionCard() { CardName = "Error" };
        }

        public void AddCardToCollection(long playerID, HeroActionCard card)
        {
            db.Query($"insert into CardCollection (playerID, cardID, card_level) Values ('{playerID}', '{card.card_id}', 1)");
        }

        public HeroActionCard GetCardFromLibrary(long cardID)
        {
            List<HeroActionCard> cards = GetLibrary();
            HeroActionCard theCard = new HeroActionCard();
            foreach (HeroActionCard card in cards)
            {
                if (card.card_id == cardID)
                {
                    theCard = card;
                }
            }
            return theCard;
        }

        public void AddCardToShop(HeroActionCard card)
        {
            db.Query($"insert into ShopCards (card_id) Values ({card.card_id})");
        }

        public void DeleteCardFromShop(HeroActionCard card)
        {
            db.Query($"Delete from ShopCards where ShopCardID = {card.ShopCardID}");
        }

        public void ClearShop()
        {
            db.Query($"Truncate Table ShopCards");
        }

        public List<HeroActionCard> AllShopCards()
        {
            List<HeroActionCard> ShopCards = new List<HeroActionCard>();
            ShopCards = db.Query<HeroActionCard>($"select * from ShopCards join HeroActionCard on ShopCards.card_id = HeroActionCard.Card_id").AsList<HeroActionCard>();
            return ShopCards;
        }


    }
}
