using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuizInterview2
{
    internal class Program
    {
        static void Main(string[] args)
        {
            
            int[] arr = new int[] { 5, 3, 8, 1, 2 }; 

            for (int i = 0; i < arr.Length; i++)
            {
                for (int j = 0; j < arr.Length - i - 1; j++)
                {
                    if (arr[j] > arr[j + 1])
                    {
                        int temp = arr[j];
                        arr[j] = arr[j + 1];
                        arr[j + 1] = temp;
                    }
                }
            }

            
            Console.WriteLine("Sorted Array: " + string.Join(", ", arr));
        }
    }
}
