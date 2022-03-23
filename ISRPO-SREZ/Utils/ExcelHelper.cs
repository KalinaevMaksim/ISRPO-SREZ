using System;
using System.Data;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Threading.Tasks;
using System.Windows;
using Excel = Microsoft.Office.Interop.Excel;

namespace ISRPO_SREZ.Utils
{
    public class ExcelHelper
    {
        Excel.Application application;
        Task CreateNewApp;
        Excel.Workbook workbook;
        Excel.Worksheet sheets;
        DataTable ReadDataTable = new DataTable();

        public ExcelHelper()
        {
            CreateNewApp = Task.Run(() =>
            {
                application = new Excel.Application();
            });
        }

        public void CloseExcelFile()
        {
            application.Quit();
            Marshal.ReleaseComObject(sheets);
            Marshal.ReleaseComObject(workbook);
            Marshal.ReleaseComObject(application);
        }

        public async Task Write(DataTable dataTable, string[] columns, string path, DateTime start, DateTime end, double summ)
        {
            try
            {
                Stopwatch stopwatch = new Stopwatch();
                stopwatch.Start();

                CreateNewApp.Wait();
                workbook = application.Workbooks.Add();
                sheets = workbook.ActiveSheet;

                sheets.Cells[1, 1] = $"Отчет по продажам за период от {start.ToShortDateString()} до {end.ToShortDateString()}";


                Parallel.Invoke(() =>
                {
                    Parallel.For(1, dataTable.Columns.Count + 1, (int j) =>
                    {
                        sheets.Cells[3, j] = columns[j - 1];
                    });
                },
                () =>
                {
                    Parallel.For(4, dataTable.Rows.Count + 2, (int i) =>
                    {
                        Parallel.For(1, dataTable.Columns.Count + 1, (int j) =>
                        {
                            sheets.Cells[i, j] = dataTable.Rows[i - 2].ItemArray[j - 1].ToString();
                        });
                    });
                });

                sheets.Cells[dataTable.Rows.Count + 2, dataTable.Columns.Count] = $"Итого {summ}";

                sheets.Columns.AutoFit();

                stopwatch.Stop();

                workbook.SaveAs(path);

                workbook.Close(false);
                CloseExcelFile();

                MessageBox.Show($"Файл успешно сохранён!", "Результат");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка");
            }
        }
    }
}
