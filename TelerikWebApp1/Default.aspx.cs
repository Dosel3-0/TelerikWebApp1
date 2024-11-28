using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;
using System.IO;
using Telerik.Windows.Documents.Spreadsheet.Model;
using Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx;
using System.Collections.Generic;
using System.Linq;
using Telerik.Windows.Documents.Spreadsheet.FormatProviders;
using Telerik.Web.Spreadsheet;
using Telerik.Web.UI.Skins;


public partial class Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Ensure the RadGrid is bound to data on every load
        if (!IsPostBack)
        {
            RadGrid1.Rebind();
            RadGrid2.Rebind();
        }
    }

    // RadGrid NeedDataSource event to load data
    protected void RadGrid1_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
    {
        string fileName = Server.MapPath("~/App_Data/Mitarbeiter.xlsx");

        if (!File.Exists(fileName))
        {
            throw new FileNotFoundException("File {fileName} was not found!");
        }

        // Load the Excel file and bind it to the RadGrid
        DataTable excelData = ReadExcelFile(fileName);
        (sender as Telerik.Web.UI.RadGrid).DataSource = excelData;
    }

    protected void RadGrid2_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
    {
        string fileName = Server.MapPath("~/App_Data/Projekt.xlsx");

        if (!File.Exists(fileName))
        {
            throw new FileNotFoundException("File {fileName} was not found!");
        }

        // Load the Excel file and bind it to the RadGrid
        DataTable excelData = ReadExcelFile(fileName);
        (sender as Telerik.Web.UI.RadGrid).DataSource = excelData;
    }

    // Reads the Excel file and converts it to a DataTable
    private DataTable ReadExcelFile(string filePath)
    {
        DataTable dataTable = new DataTable();

        // Load the workbook
        Telerik.Windows.Documents.Spreadsheet.Model.Workbook workbook;
        IWorkbookFormatProvider formatProvider = new XlsxFormatProvider();

        using (FileStream input = new FileStream(filePath, FileMode.Open, FileAccess.Read))
        {
            // Import with a timeout
            workbook = formatProvider.Import(input, TimeSpan.FromSeconds(10));
        }

        // Get the first worksheet
        Telerik.Windows.Documents.Spreadsheet.Model.Worksheet worksheet = workbook.Worksheets[0];

        // Read the header row
        bool isHeaderRow = true;
        var usedCellRange = worksheet.UsedCellRange;

        // Iterate over rows in the used range
        for (int rowIndex = usedCellRange.FromIndex.RowIndex; rowIndex <= usedCellRange.ToIndex.RowIndex; rowIndex++)
        {
            // Process the header row first
            if (isHeaderRow)
            {
                for (int colIndex = usedCellRange.FromIndex.ColumnIndex; colIndex <= usedCellRange.ToIndex.ColumnIndex; colIndex++)
                {
                    // Retrieve the value of the cell
                    var cellValue = worksheet.Cells[rowIndex, colIndex].GetValue()?.Value.RawValue;
                    string columnName = !string.IsNullOrEmpty(cellValue) ? cellValue : $"Column{colIndex + 1}";
                    dataTable.Columns.Add(columnName);
                }
                isHeaderRow = false;
            }
            else
            {
                // Process data rows
                DataRow dataRow = dataTable.NewRow();
                int columnIndex = 0;

                for (int colIndex = usedCellRange.FromIndex.ColumnIndex; colIndex <= usedCellRange.ToIndex.ColumnIndex; colIndex++)
                {
                    var cellValue = worksheet.Cells[rowIndex, colIndex].GetValue()?.Value.RawValue;
                    dataRow[columnIndex++] = !string.IsNullOrEmpty(cellValue) ? cellValue : string.Empty;
                }

                dataTable.Rows.Add(dataRow);
            }
        }


        return dataTable;
    }


}