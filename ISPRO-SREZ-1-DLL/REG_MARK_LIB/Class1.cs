using System;
using System.Linq;

namespace REG_MARK_LIB
{
    public class Class1
    {
        private readonly string[] _acceptableSymbols = new string[]
        {
            "a",
            "b",
            "e",
            "k",
            "m",
            "h",
            "o",
            "p",
            "c",
            "t",
            "y",
            "x",
        };

        private readonly string[] _numbersCodesRegions = new string[]
        {
            "1",
            "4",
            "2","102",
            "3",
            "5",
            "6",
            "7",
            "8",
            "9",
            "10",
            "11","111",
            "82",
            "12",
            "13","113",
            "14",
            "15",
            "16","116",
            "17",
            "18",
            "19",
            "95",
            "21","121",
            "22",
            "75","80",
            "41",
            "23","93","123",
            "24","124","84","88",
            "59","81","159",
            "25","125",
            "26","126",
            "27",
            "28",
            "29",
            "30",
            "31",
            "32",
            "33",
            "34","134",
            "35",
            "36","136",
            "37",
            "38","138","85",
            "39","91",
            "40",
            "42","142",
            "43",
            "44",
            "45",
            "46",
            "47",
            "48",
            "49",
            "50","90","150","190","750",
            "51",
            "52","152",
            "53",
            "54","154",
            "55",
            "56",
            "57",
            "58",
            "60",
            "61","161",
            "62",
            "63","163",
            "64","164",
            "65",
            "66","96","196",
            "67",
            "68",
            "69",
            "70",
            "71",
            "72",
            "73","173",
            "74","174",
            "76",
            "77","97","99","177","197","199","777",
            "78","98","178",
            "92",
            "79",
            "83",
            "86","186",
            "87",
            "89",
            "94",
        };


        public bool CheckMark(string mark)
        {
            if (mark.Length != 9)
            {
                return false;
            }

            if (mark.Any(v => !char.IsDigit(v) && !_acceptableSymbols.Contains(v.ToString().ToLower())))
            {
                return false;
            }

            if (!_acceptableSymbols.Contains(mark[0].ToString().ToLower()) ||
                mark.Substring(1, 3).Any(m => !char.IsDigit(m)) ||
                mark.Substring(4, 2).Any(m => !_acceptableSymbols.Contains(m.ToString().ToLower())) ||
                mark.Substring(6, 3).Any(m => !char.IsDigit(m)))
            {
                return false;
            }

            int lengthCodeRegion = mark.Substring(6, 3).Count(cr => char.IsDigit(cr));
            string codeRegion = mark.ToCharArray().Reverse().ToString().Substring(0, mark[6] == '0' ? 2 : 3);

            if (!_numbersCodesRegions.Contains(codeRegion))
            {
                return false;
            }

            return true;
        }

        public string GetNextMarkAfter(string mark)
        {
            string regNumber = mark.Substring(1, 3).ToUpper(),
            secondPartSerie = mark.Substring(4, 2).ToUpper(),
            firstPartSerie = mark[0].ToString().ToUpper();

            try
            {
                if (regNumber != "999")
                {
                    int newNum = (int.Parse(regNumber) + 1);
                    regNumber = newNum < 100 ? $"0{newNum}" : newNum.ToString();
                }
                else
                {
                    regNumber = "001";
                    if (secondPartSerie[1] != 'X')
                    {
                        int indexNum = Array.IndexOf(_acceptableSymbols, secondPartSerie[1].ToString().ToLower());
                        secondPartSerie = secondPartSerie[0] + _acceptableSymbols[indexNum + 1].ToUpper();

                        if (secondPartSerie[1] == 'X')
                        {
                            secondPartSerie = SetSecondPartNotXX(secondPartSerie);
                        }
                    }
                    else
                    {
                        secondPartSerie = SetSecondPartNotXX(secondPartSerie);

                        if (secondPartSerie == "XX")
                        {
                            secondPartSerie = "AA";

                            int indexNum = Array.IndexOf(_acceptableSymbols, firstPartSerie.ToLower());
                            firstPartSerie = _acceptableSymbols[indexNum + 1].ToUpper();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                return ex.Message;
            }

            return firstPartSerie + regNumber + secondPartSerie + mark.Substring(6, 3);
        }

        private string SetSecondPartNotXX(string secondPartSerie)
        {
            int indexFirstNum = Array.IndexOf(_acceptableSymbols, secondPartSerie[0].ToString().ToLower());
            secondPartSerie = _acceptableSymbols[indexFirstNum + 1].ToUpper() + secondPartSerie[1].ToString().ToUpper();

            return secondPartSerie;
        }

        public string GetNextMarkAfterInRange(string prevMark, string rangeStart, string rangeEnd)
        {
            return "";
        }

        public int GetCombinationsCountInRange(string mark1, string mark2)
        {
            return 0;
        }
    }
}