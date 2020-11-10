using Dapper.Contrib.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


namespace AngularHeroCards.Models
{
    public class HeroActionCard
    {
        public long card_id { get; set; }
        public string CardName { get; set; }  // 25 chars
        public int PlaySpeed { get; set; }
        public string ActionText { get; set; } // 50 chars
        public int ManaCost { get; set; }
        public int HealthCost { get; set; }
        public int TimeCost { get; set; }
        public string Target { get; set; }
        public int PhysAtk { get; set; }
        public bool Slashing { get; set; }
        public int SlashBleed { get; set; }
        public int SlashBleedDuration { get; set; }
        public bool Piercing { get; set; }
        public int PierceArmor { get; set; }
        public bool Bludgeon { get; set; }
        public int BludgeonLower { get; set; }
        public int BludegonLowerDuration { get; set; }
        public bool Shield { get; set; }
        public int ShieldArmor { get; set; }
        public int ShieldResistance { get; set; }
        public int ShieldDuration { get; set; }
        public int MagicAtk { get; set; }
        public bool Fire { get; set; }
        public int FireBurn { get; set; }
        public int FireBurnDuration { get; set; }
        public bool Electric { get; set; }
        public int ElectricSpeed { get; set; }
        public bool Ice { get; set; }
        public int IceSlow { get; set; }
        public int IceSlowDurability { get; set; }
        public bool Earth { get; set; }
        public int EarthAbsorb { get; set; }
        public bool Holy { get; set; }
        public int HolyHeal { get; set; }
        public bool Dark { get; set; }
        public int DarkSteal { get; set; }
        public bool Taunt { get; set; }
        public bool Dispel { get; set; }
        public int MultiCast { get; set; }
        public int Mana { get; set; }
        public string Rarity { get; set; }
        public int card_level { get; set; }
        public int id { get; set; }
        public bool Time { get; set; }
        public int TimeSpeed { get; set; }
        public bool Crush { get; set; }
        public int CrushLower { get; set; }
        public int CrushLowerDuration { get; set; }
        public long CollectionID { get; set; }
        [Write(false)]
        public long ShopCardID { get; set; }

    }
}
