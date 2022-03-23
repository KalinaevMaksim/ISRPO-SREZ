using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using word = Microsoft.Office.Interop.Word;
using Microsoft.Office.Interop.Word;
using System.IO;

namespace ISRPO_SREZ.Utils
{

    internal class WordOutput
    {
        word.Application app;
        word.Document doc;
        System.Threading.Tasks.Task TaskCreateNewApp;

        public WordOutput()
        {
            TaskCreateNewApp = System.Threading.Tasks.Task.Run(() =>
            {
                app = new word.Application();
            });
        }

        public void SaveCheck(string path)
        {
            word.Bookmarks bookmarks = null;

            string source = $@"{Directory.GetCurrentDirectory()}/Шаблон отчёта.docx";
            doc = app.Documents.Open(source);
            doc.Activate();
            bookmarks = doc.Bookmarks;

            doc.Close(false);
            doc = null;
            app.Quit();
        }
    }
}
