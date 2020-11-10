using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AngularHeroCards.Models
{
    public class Participant
    {
        public HeroDoll ActiveDoll { get; set; }
        public long PlayerID { get; set; }
        public Deck ActiveDeck { get; set; }
        public int Team { get; set; }

    }
}
