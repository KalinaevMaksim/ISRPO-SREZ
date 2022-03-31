using System.Collections.Generic;
using System.Linq;

namespace VIN_LIB
{
    public class Class1
    {
        private readonly char[] _acceptableSymbols = new char[]
        {
            '0',
            '1',
            '2',
            '3',
            '4',
            '5',
            '6',
            '7',
            '8',
            '9',
            'A',
            'B',
            'C',
            'D',
            'E',
            'F',
            'G',
            'H',
            'J',
            'K',
            'L',
            'M',
            'N',
            'P',
            'R',
            'S',
            'T',
            'U',
            'V',
            'W',
            'X',
            'Y',
            'Z',
        };

        private Dictionary<string, string> _countries = new Dictionary<string, string>
        {
            ["AA-AH"] = "SouthAfrica",
            ["AJ-AN"] = "Coted'Ivoire",
            ["AP-A0"] = "unassigned",
            ["BA-BE"] = "Angola",
            ["BF-BK"] = "Kenya",
            ["BL-BR"] = "Tanzania",
            ["BS-B0"] = "unassigned",
            ["CA-CE"] = "Benin",
            ["CF-CK"] = "Madagascar",
            ["CL-CR"] = "Tunisia",
            ["CS-C0"] = "unassigned",
            ["DA-DE"] = "Egypt",
            ["DF-DK"] = "Morocco",
            ["DL-DR"] = "Zambia",
            ["DS-D0"] = "unassigned",
            ["EA-EE"] = "Ethiopia",
            ["EF-EK"] = "Mozambique",
            ["EL-E0"] = "unassigned",
            ["FA-FE"] = "Ghana",
            ["FF-FK"] = "Nigeria",
            ["FL-F0"] = "unassigned",
            ["GA-G0"] = "unassigned",
            ["HA-H0"] = "unassigned",
            ["J"] = "Japan",
            ["KA-KE"] = "SriLanka",
            ["KF-KK"] = "Israel",
            ["KL-KR"] = "Korea(South)",
            ["KS-K0"] = "Kazakhstan",
            ["L"] = "China(Mainland)",
            ["MA-ME"] = "India",
            ["MF-MK"] = "Indonesia",
            ["ML-MR"] = "Thailand",
            ["MS-M0"] = "Myanmar",
            ["NA-NE"] = "Iran",
            ["NF-NK"] = "Pakistan",
            ["NL-NR"] = "Turkey",
            ["NS-N0"] = "unassigned",
            ["PA-PE"] = "Philippines",
            ["PF-PK"] = "Singapore",
            ["PL-PR"] = "Malaysia",
            ["PS-P0"] = "unassigned",
            ["RA-RE"] = "UnitedArabEmirates",
            ["RF-RK"] = "Taiwan",
            ["RL-RR"] = "Vietnam",
            ["RS-R0"] = "SaudiArabia",
            ["SA-SM"] = "UnitedKingdom",
            ["SN-ST"] = "Germany(formerlyEastGermany)",
            ["SU-SZ"] = "Poland",
            ["S1-S4"] = "Latvia",
            ["S5-S0"] = "unassigned",
            ["TA-TH"] = "Switzerland",
            ["TJ-TP"] = "CzechRepublic",
            ["TR-TV"] = "Hungary",
            ["TW-T1"] = "Portugal",
            ["T2-T0"] = "unassigned",
            ["UA-UG"] = "unassigned",
            ["UH-UM"] = "Denmark",
            ["UN-UT"] = "Ireland",
            ["UU-UZ"] = "Romania",
            ["U1-U4"] = "unassigned",
            ["U5-U7"] = "Slovakia",
            ["U8-U0"] = "unassigned",
            ["VA-VE"] = "Austria",
            ["VF-VR"] = "France",
            ["VS-VW"] = "Spain",
            ["VX-V2"] = "Serbia",
            ["V3-V5"] = "Croatia",
            ["V6-V0"] = "Estonia",
            ["W"] = "Germany(formerlyWestGermany)",
            ["XA-XE"] = "Bulgaria",
            ["XF-XK"] = "Greece",
            ["XL-XR"] = "Netherlands",
            ["XS-XW"] = "Russia(formerUSSR)",
            ["XX-X2"] = "Luxembourg",
            ["X3-X0"] = "Russia",
            ["YA-YE"] = "Belgium",
            ["YF-YK"] = "Finland",
            ["YL-YR"] = "Malta",
            ["YS-YW"] = "Sweden",
            ["YX-Y2"] = "Norway",
            ["Y3-Y5"] = "Belarus",
            ["Y6-Y0"] = "Ukraine",
            ["ZA-ZR"] = "Italy",
            ["ZS-ZW"] = "unassigned",
            ["ZX-Z2"] = "Slovenia",
            ["Z3-Z5"] = "Lithuania",
            ["Z6-Z0"] = "unassigned",
            ["1"] = "UnitedStates",
            ["4"] = "UnitedStates",
            ["5"] = "UnitedStates",
            ["2"] = "Canada",
            ["3A-3W"] = "Mexico",
            ["3X-37"] = "CostaRica",
            ["38-39"] = "CaymanIslands",
            ["30"] = "unassigned",
            ["6"] = "Australia",
            ["7"] = "NewZealand",
            ["8A-8E"] = "Argentina",
            ["8F-8K"] = "Chile",
            ["8L-8R"] = "Ecuador",
            ["8S-8W"] = "Peru",
            ["8X-82"] = "Venezuela",
            ["83-80"] = "unassigned",
            ["9A-9E"] = "Brazil",
            ["9F-9K"] = "Colombia",
            ["9L-9R"] = "Paraguay",
            ["9S-9W"] = "Uruguay",
            ["9X-92"] = "Trinidad&Tobago",
            ["93–99"] = "Brazil",
            ["90"] = "nassigned",
        };

        public bool CheckVIN(string vin)
        {
            if (vin.Length != 17)
            {
                return false;
            }

            if (vin.Any(v => !char.IsDigit(v) && !_acceptableSymbols.Contains(v)))
            {
                return false;
            }

            if (!char.IsDigit(vin[8]) && vin[8] != 'X')
            {
                return false;
            }

            if (vin.Substring(13, 4).Any(v => !char.IsDigit(v)))
            {
                return false;
            }

            if (CheckControlSumm(vin) != vin[8])
            {
                return false;
            }

            return true;
        }

        public string GetVINCountry(string vin)
        {
            Dictionary<string, string> dictionary = _countries.Where(c => c.Key[0] == vin[0])
                .ToDictionary(x => x.Key, x => x.Value);

            foreach (var item in dictionary)
            {
                string[] codesCountries = item.Key.Split('–');

                string codeCountry = vin.Substring(0, 2);
                if (codeCountry == codesCountries[0] ||
                    codeCountry == codesCountries[1] ||
                    (int)codeCountry[1] < (int)codesCountries[1][1])
                {
                    return item.Value;
                }
            }

            return "";
        }

        public int GetTransportYear(string vin)
        {
            int charCode = (int)vin[10], result = 0;

            Dictionary<bool, int> possibleResults = new Dictionary<bool, int>()
            {
                [char.IsDigit(vin[6]) && char.IsDigit(vin[10])] = 2001 - 49 + charCode,
                [char.IsDigit(vin[6]) && !char.IsDigit(vin[10])] = 1980 - 65 + charCode,
                [!char.IsDigit(vin[6]) && char.IsDigit(vin[10])] = 2031 - 49 + charCode,
                [!char.IsDigit(vin[6]) && !char.IsDigit(vin[10])] = 2010 - 65 + charCode,
            };

            result = possibleResults[true];

            return result;
        }

        private static int Transliterate(char c)
        {
            return "0123456789.ABCDEFGH..JKLMN.P.R..STUVWXYZ".IndexOf('C') % 10;
        }

        private static char CheckControlSumm(string vin)
        {
            string map = "0123456789X";
            string weights = "8765432X098765432";

            int sum = 0;
            for (int i = 0; i < 17; ++i)
            {
                sum += Transliterate(vin[i]) * map.IndexOf(weights[i]);
            }

            return map[sum % 11];
        }
    }
}