﻿using DentalClinic.Models;
using DentalClinic.Services;
using OfficeOpenXml;
using OfficeOpenXml.Style;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web.Http;
using System.Web.Http.Results;

namespace DentalClinic.Areas.Admin.ApiControllers
{
    public class AdminReportController : ApiAdminBaseController
    {
        [HttpGet]
        public JsonResult GetAllReportMonthYear()
        {
            try
            {
                AdminReportService adminReportService = new AdminReportService();

                DateTime now = DateTime.Now;
                DateTime prevmonth = now.AddMonths(-1);
                DateTime prevyear = now.AddYears(-1);

                // Báo cáo doanh thu tháng này, tháng trước
                object ListReportThisMonth = adminReportService.GetListReportDaily(now.Month, now.Year);
                object ListReportPrevMonth = adminReportService.GetListReportDaily(prevmonth.Month, prevmonth.Year);

                // Báo cáo doanh thu năm này, năm trước
                object ListReportThisYear = adminReportService.GetListReportMonth(now.Year);
                object ListReportPrevYear = adminReportService.GetListReportMonth(prevyear.Year);

                return Success(new { ListReportThisMonth, ListReportPrevMonth, ListReportThisYear, ListReportPrevYear });

            }
            catch (Exception ex)
            {
                return Error(ex.Message);
            }
        }

        [HttpGet]
        public JsonResult GetReportByAboutTime(long from, long to)
        {
            try
            {
                AdminReportService adminReportService = new AdminReportService();
                return Success(adminReportService.GetReportByAboutTime(from, to));
            }
            catch (Exception ex)
            {
                return Error(ex.Message);
            }
        }

        private void BindingFormatForExcelReportRevenue(ExcelWorksheet worksheet, ReportModel model)
        {
            worksheet.DefaultColWidth = 10;
            worksheet.Cells.Style.WrapText = true;
            worksheet.Cells[2, 1].Value = "Số TT";
            worksheet.Cells[2, 2].Value = "Thời gian";
            worksheet.Cells[2, 3].Value = "Doanh thu";
            worksheet.Row(2).Height = 30;

            //worksheet.Row(1).Merged = true;

            worksheet.Cells["A1:C1"].Merge = true;
            worksheet.Cells["A1:C1"].Value = "Báo cáo thống kê doanh thu " + model.TypeReport;
            worksheet.Row(1).Height = 30;
            using (var range = worksheet.Cells["A1:C1"])
            {
                /* range.Style.Fill.PatternType = ExcelFillStyle.Solid;
                 range.Style.Fill.BackgroundColor.SetColor(Color.FromArgb(255, 221, 177));*/
                range.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                range.Style.Font.SetFromFont("Arial", 10);
                range.Style.Border.Bottom.Style = ExcelBorderStyle.Thick;
                range.Style.Border.Bottom.Color.SetColor(Color.WhiteSmoke);
                range.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                range.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                range.Style.Font.Bold = true;
            }

            using (var range = worksheet.Cells["A2:C2"])
            {
                range.Style.Fill.PatternType = ExcelFillStyle.Solid;
                range.Style.Fill.BackgroundColor.SetColor(Color.FromArgb(255, 221, 177));
                range.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                range.Style.Font.SetFromFont("Arial", 10);
                range.Style.Border.Bottom.Style = ExcelBorderStyle.Thick;
                range.Style.Border.Bottom.Color.SetColor(Color.WhiteSmoke);
                range.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                range.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                range.Style.Font.Bold = true;
            }
            /* using (var range = worksheet.Cells["A2:C2"])
             {
                 range.Style.Font.Bold = true;
                 range.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                 range.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
             }*/
            for (int i = 0; i < model.ListReportData.Count; i++)
            {
                worksheet.Cells[i + 3, 1].Value = i + 1;
            }

            for (int i = 0; i < model.ListReportData.Count; i++)
            {
                var item = model.ListReportData[i];
                worksheet.Cells[i + 3, 2].Value = item.Time;
                worksheet.Cells[i + 3, 3].Value = item.Price;
                using (var range = worksheet.Cells["A" + (i + 3) + ":C" + i + 3])
                {
                    range.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                    range.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                }
                worksheet.Row(i + 3).Height = 30;
            }
            using (var range = worksheet.Cells["A" + (model.ListReportData.Count + 2) + ":C" + model.ListReportData.Count + 2])
            {
                range.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
                range.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                worksheet.Row(model.ListReportData.Count + 2).Height = 30;
            }
            for (int i = 1; i <= worksheet.Dimension.End.Column; i++) { worksheet.Column(i).AutoFit(); }
            //worksheet.Cells[2, 2, model.ListReportData.Count + 10, 9].AutoFitColumns(20);
            worksheet.Cells["A3:A" + model.ListReportData.Count + 2].AutoFitColumns(10);
            worksheet.Cells["B3:B" + model.ListReportData.Count + 2].AutoFitColumns(20);
            worksheet.Cells["C3:C" + model.ListReportData.Count + 2].AutoFitColumns(40);
            worksheet.Cells["C2:C2"].AutoFilter = true;

            worksheet.Cells["A" + (model.ListReportData.Count + 3) + ":C" + (model.ListReportData.Count + 3)].Merge = true;
            worksheet.Cells["A" + (model.ListReportData.Count + 3) + ":C" + (model.ListReportData.Count + 3)].Value = "Tổng tiền: " + model.Revenue;
            worksheet.Row(model.ListReportData.Count + 3).Height = 30;
            using (var range = worksheet.Cells["A" + (model.ListReportData.Count + 3) + ":C" + (model.ListReportData.Count + 3)])
            {
                range.Style.HorizontalAlignment = ExcelHorizontalAlignment.Right;
                range.Style.VerticalAlignment = ExcelVerticalAlignment.Center;
                range.Style.Font.Bold = true;
            }
        }

        private Stream CreateExcelFileReport(ReportModel model, Stream stream = null)
        {
            ExcelPackage.LicenseContext = OfficeOpenXml.LicenseContext.NonCommercial;
            using (var excelPackage = new ExcelPackage(stream ?? new MemoryStream()))
            {
                excelPackage.Workbook.Properties.Author = "NhaKhoaPhuongThao";
                excelPackage.Workbook.Properties.Title = "Create Excel File";
                excelPackage.Workbook.Properties.Comments = "Báo cáo doanh thu " + model.TypeReport;
                excelPackage.Workbook.Worksheets.Add("Trang 1");
                var workSheet = excelPackage.Workbook.Worksheets[0];
                BindingFormatForExcelReportRevenue(workSheet, model);

                excelPackage.Save();
                return excelPackage.Stream;
            }
        }
        [HttpPost]
        public HttpResponseMessage ExportFileExcelReport(ReportModel model)
        {
            using (var streams = CreateExcelFileReport(model, null) as MemoryStream)
            {
                using (var memoryStream = new MemoryStream())
                {
                    var nameFile = "";
                    streams.Position = 0;
                    streams.CopyTo(memoryStream);
                    var result = new HttpResponseMessage(HttpStatusCode.OK)
                    {
                        Content = new ByteArrayContent(memoryStream.ToArray())
                    };
                    nameFile = "BaoCaoDoanhThu" + model.TypeReport;
                    result.Content.Headers.ContentDisposition = new System.Net.Http.Headers.ContentDispositionHeaderValue("attachment")
                    {
                        FileName = nameFile + ".xlsx"
                    };
                    result.Content.Headers.ContentType = new MediaTypeHeaderValue("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
                    return result;
                }
            }
        }
    }
}
