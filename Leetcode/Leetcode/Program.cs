using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Leetcode
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.ReadLine();
        }
    }

    public class Solution
    {
        public bool HasGroupsSizeX(int[] deck)
        {
            Dictionary<int, int> dic = new Dictionary<int, int>();
            bool[] visit = new bool[10001];
            for (int i=0; i< deck.Length; i++)
            {
                if (!dic.ContainsKey(deck[i]))
                {
                    dic.Add(deck[i],1);
                }
                else
                {
                    dic[deck[i]]++;
                }
            }
            int min = dic.Values.FirstOrDefault();
            foreach (var value in dic.Values)
            {
                if (value < min)
                {
                    min = value;
                }
            }
            for (int i=2;i<= min; i++)
            {
                if (!visit[i])
                {
                    bool find = true;
                    foreach (int value in dic.Values)
                    {
                        if (value % i != 0)
                        {
                            find = false;
                            for (int j = 1;j<=min/i;j++)
                            {
                                visit[j * i] = true;
                            }
                        }

                    }
                    if (find)
                    {
                        return true;
                    }
                }
                
            }
            return false;
        }
    }
}
