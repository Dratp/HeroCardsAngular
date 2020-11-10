using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Dapper.Contrib.Extensions;

namespace AngularHeroCards.Models
{
    public class HeroDoll
    {
        [Key]
        public long StuffyID { get; set; }
        public long PlayerID { get; set; }
        public string Name { get; set; }
        public string Class { get; set; }
        public string Type { get; set; }
        public string Affinity { get; set; }
        public string SecondaryAffinity { get; set; }
        public int Health { get; set; }
        public int Mana { get; set; }
        public int Time { get; set; }
        public double Armor { get; set; }
        public double Resistance { get; set; }
        public int AbsorbPhys { get; set; }
        public int AbsorbMgk { get; set; }
        public int Speed { get; set; }
        public int Initiative { get; set; }
        public int Strength { get; set; }
        public int Intellect { get; set; }
    }
}
