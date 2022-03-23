using ISRPO_SREZ.Models;
using ISRPO_SREZ.Utils;
using MailXamarin.Utils;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Http;
using System.Text.Json;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Forms.DataVisualization.Charting;

namespace ISRPO_SREZ
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class wMain : Window
    {
        public DateTime DateBegin { get; set; } = DateTime.Now;
        public DateTime DateEnd { get; set; } = DateTime.Now;
        public List<Sales> Sales { get; set; }
        public List<string> SourceDiagram { get; set; } = new List<string>
        {
            "Фирмы", "Продажи"
        };

        public wMain()
        {
            InitializeComponent();
            RefreshView();
        }

        private async void BtnGetData_Click(object sender, RoutedEventArgs e)
        {
            if (DateBegin.Date == null || DateEnd.Date == null)
            {
                throw new Exception("Заполните даты начала и окончания");
            }

            string resultJson = await ServerRequestManager.Send("api/Sale", HttpMethod.Post, DateBegin.Date, DateEnd.Date);
            Sales = JsonSerializer.Deserialize<List<Sales>>(resultJson);
            RefreshView();
        }

        private void RefreshView()
        {
            DataContext = null;
            DataContext = this;
        }

        private void CmbSourceDiagramm_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (CmbSourceDiagramm.SelectedIndex <= 0 || Sales == null)
            {
                return;
            }

            Dictionary<int, Action> sourceDiagramTypes = new Dictionary<int, Action>
            {
                [0] = () => CreateLineDiagram(),
                [1] = () => CreateCircleDiagram(),
            };

            ChartArea chartArea = new ChartArea("Sales");

            ChrtSales.Series.Clear();
            ChrtSales.ChartAreas.Clear();

            ChrtSales.ChartAreas.Add(chartArea);

            sourceDiagramTypes[CmbSourceDiagramm.SelectedIndex]?.Invoke();
        }

        private void CreateLineDiagram()
        {
            Series series = new Series()
            {
                IsValueShownAsLabel = true,
            };
            series.ChartType = SeriesChartType.Line;

            foreach (var sale in Sales.GroupBy(s => s.dateSale))
            {
                series.Points.AddXY(sale.Key, sale.Sum(s => s.telephones.Sum(tel => tel.cost * tel.count)));
            }

            ChrtSales.Series.Add(series);
        }

        private void CreateCircleDiagram()
        {
            Series series = new Series()
            {
                IsValueShownAsLabel = true,
            };
            series.ChartType = SeriesChartType.Pie;

            foreach (var sale in Sales.SelectMany(s => s.telephones).GroupBy(s => s.manufacturer))
            {
                series.Points.AddXY(sale.Key, sale.Sum(s => s.cost * s.count));
            }

            ChrtSales.Series.Add(series);
        }

        private void BtnWordCheck_Click(object sender, RoutedEventArgs e)
        {
            if (LstVSales.SelectedItem == null)
            {
                return;
            }

            WordOutput wordOutput = new WordOutput();

            Sales sales = LstVSales.SelectedItem as Sales;

            SaveFileDialog savedialog = new SaveFileDialog();
            savedialog.Title = "Сохранить файл как...";
            savedialog.Filter = "Документ Word (*.docx)|*.docx|" +
                "Документ Word 97-2003 (*.doc)|*.doc|" +
                "PDF (*.pdf)|*.pdf|";

            if (savedialog.ShowDialog().Value == false)
            {
                return;
            }


            wordOutput.SaveCheck(savedialog.FileName);
        }

        private void BtnExcelCheck_Click(object sender, RoutedEventArgs e)
        {

        }

        private async void BtnExcelReport_Click(object sender, RoutedEventArgs e)
        {
            if (LstVSales.SelectedItem == null)
            {
                return;
            }

            SaveFileDialog savedialog = new SaveFileDialog();
            savedialog.Title = "Сохранить файл как..";
            savedialog.OverwritePrompt = false;
            savedialog.Filter = "Книга Excel (*.xlsx)|*.xlsx";

            if (savedialog.ShowDialog().Value == false)
            {
                return;
            }

            ExcelHelper excelHelper = new ExcelHelper();

            await excelHelper.Write();
        }

        private System.Data.DataTable GetDataTable()
        {
            System.Data.DataTable dataTable = new System.Data.DataTable();
            DataRow dataRow;

            dataTable.Columns.AddRange(new DataColumn[5]);

            foreach (var sale in Sales)
            {
                foreach (var tel in sale.telephones)
                {
                    dataRow = dataTable.NewRow();
                    dataRow.ItemArray = new string[5]
                    {
                        sale.dateSale.ToString(),
                        sale.client.Initials.ToString(),
                        tel.count.ToString(),
                        tel.cost.ToString(),
                        (tel.cost * tel.count).ToString(),
                    };
                    dataTable.Rows.Add(dataRow);
                }
            }

            return dataTable;
        }
    }
}