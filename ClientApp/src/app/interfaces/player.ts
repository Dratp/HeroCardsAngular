import { HeroDoll } from "./hero-doll";
import { Deck } from "./deck";
import { HeroActionCard } from "./hero-action-card";

export interface Player {
  playerID: number;
  name?: string;
  currency: number;
  dolls?: HeroDoll[];
  decks?: Deck[];
  collection?: HeroActionCard[];

}

export interface PlayerInfo {
  playerID?: number;
  name?: string;
  password?: string;
  response?: boolean;
  reason?: string;
}



     //public static Player AssemblePlayer(long playerID, IGameData data)
//{
//  Player activePlayer = data.GetPlayer(playerID);
//  activePlayer.Decks = data.GetDecks(activePlayer.PlayerID);
//  activePlayer.Dolls = data.GetDolls(activePlayer.PlayerID);
//  activePlayer.Collection = data.GetCollection(activePlayer.PlayerID);

//  return activePlayer;
//}
