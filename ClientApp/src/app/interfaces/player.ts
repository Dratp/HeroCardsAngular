import { HeroDoll } from "./hero-doll";
import { Deck } from "./deck";
import { HeroActionCard } from "./hero-action-card";

export interface Player {
  PlayerID: string;
  Name: string;
  Currency: number;
  Dolls: HeroDoll[];
  Deck: Deck[];
  Collection: HeroActionCard[];

}

export interface CreatedPlayer {
  userID?: number;
  Name: string;
}



     //public static Player AssemblePlayer(long playerID, IGameData data)
//{
//  Player activePlayer = data.GetPlayer(playerID);
//  activePlayer.Decks = data.GetDecks(activePlayer.PlayerID);
//  activePlayer.Dolls = data.GetDolls(activePlayer.PlayerID);
//  activePlayer.Collection = data.GetCollection(activePlayer.PlayerID);

//  return activePlayer;
//}
