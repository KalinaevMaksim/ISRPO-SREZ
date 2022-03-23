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

        public async Task Write(DataTable dataTable, string[] columns, string path)
        {
            try
            {
                Stopwatch stopwatch = new Stopwatch();
                stopwatch.Start();

                CreateNewApp.Wait();
                workbook = application.Workbooks.Add();
                sheets = workbook.ActiveSheet;

                Parallel.Invoke(() =>
                {
                    Parallel.For(1, dataTable.Columns.Count + 1, (int j) =>
                    {
                        sheets.Cells[1, j] = columns[j - 1];
                    });
                },
                () =>
                {
                    Parallel.For(2, dataTable.Rows.Count + 2, (int i) =>
                    {
                        Parallel.For(1, dataTable.Columns.Count + 1, (int j) =>
                        {
                            sheets.Cells[i, j] = dataTable.Rows[i - 2].ItemArray[j - 1].ToString();
                        });
                    });
                });

                Excel.Range Range = sheets.UsedRange;
                Range.Borders.LineStyle = Excel.XlLineStyle.xlContinuous;
                Range.Cells.HorizontalAlignment = Excel.XlHAlign.xlHAlignLeft;

                Excel.ChartObjects chartObjs = (Excel.ChartObjects)sheets.ChartObjects();
                Excel.ChartObject chartObj = chartObjs.Add(1500, 10, 300, 200);
                Excel.Chart xlChart = chartObj.Chart;
                //Range = sheets.Range[$"M1:N{dataTable.Rows.Count + 1}"];

                Excel.SeriesCollection seriesCollection = (Excel.SeriesCollection)xlChart.SeriesCollection(Type.Missing);
                Excel.Series series = seriesCollection.NewSeries();
                series.XValues = sheets.get_Range("B2", $"B{dataTable.Columns.Count}");
                series.Values = sheets.get_Range("N2", $"N{dataTable.Rows.Count + 1}");

                xlChart.ChartType = Excel.XlChartType.xlLine;
                series.Name = "Зарплата";
                //xlChart.SetSourceData(Range);
                xlChart.HasLegend = true;

                sheets.Columns.AutoFit();

                stopwatch.Stop();

                workbook.SaveAs(path);

                workbook.Close(false);
                CloseExcelFile();

                MessageBox.Show($"Файл успешно сохранён!\nВремя затраченное на выполнение алгоритма - {stopwatch.Elapsed.TotalSeconds}", "Результат");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка");
            }
        }
    }
}
