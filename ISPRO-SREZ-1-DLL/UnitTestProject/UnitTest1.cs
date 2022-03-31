using Microsoft.VisualStudio.TestTools.UnitTesting;
using REG_MARK_LIB;
using System;

namespace UnitTestProject
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestCheckMark()
        {
            string data = "c999yx078";
            string v = new Class1().GetNextMarkAfter(data);
            Console.WriteLine(v);
        }
    }
}
