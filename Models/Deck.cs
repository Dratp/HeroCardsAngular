using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AngularHeroCards.Models
{
    public class Deck
    {
        public long DeckCardID { get; set; }
        public string Name { get; set; }
        public List<HeroActionCard> Cards { get; set; }
        public long DeckNumber { get; set; }
        public long CollectionID { get; set; }

    }
}
