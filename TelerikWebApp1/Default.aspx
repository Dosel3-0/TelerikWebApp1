<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <telerik:RadStyleSheetManager id="RadStyleSheetManager1" runat="server" />
</head>
<body>
    <form id="form1" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
        </Scripts>
    </telerik:RadScriptManager>
    <script type="text/javascript">
        //Put your JavaScript code here.
    </script>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <div>
            <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" SelectedIndex="0">
        <Tabs>
            <telerik:RadTab Text="Mitarbeiter" Value="1" />
            <telerik:RadTab Text="Projekt" Value="2" />
        </Tabs>
    </telerik:RadTabStrip>

    <telerik:RadMultiPage ID="RadMultiPage1" runat="server">
        <telerik:RadPageView ID="RadPageView1" runat="server">
<telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" AllowSorting="true" AllowFilteringByColumn="true" OnNeedDataSource="RadGrid1_NeedDataSource">
    <MasterTableView AutoGenerateColumns="False" DataKeyNames="ID">
        <Columns>
            <telerik:GridBoundColumn DataField="ID" DataType="System.Int32" HeaderText="ID" ReadOnly="True" UniqueName="ID">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" SortExpression="Name" HeaderText="Name" UniqueName="Name">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Vorname" FilterControlAltText="Filter Vorname column" SortExpression="Vorname" HeaderText="Vorname" UniqueName="Vorname">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Geburtsdatum" FilterControlAltText="Filter Geburtsdatum column" SortExpression="Geburtsdatum" HeaderText="Geburtsdatum" UniqueName="Geburtsdatum">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Personenzahl" FilterControlAltText="Filter Personenzahl column" SortExpression="Personenzahl" HeaderText="Personenzahl" UniqueName="Personenzahl">
            </telerik:GridBoundColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
        </telerik:RadPageView>



        <telerik:RadPageView ID="RadPageView2" runat="server">
<telerik:RadGrid ID="RadGrid2" runat="server" AllowPaging="True" AllowSorting="true" AllowFilteringByColumn="true" OnNeedDataSource="RadGrid2_NeedDataSource">
    <MasterTableView AutoGenerateColumns="False">
        <Columns>
            <telerik:GridBoundColumn DataField="Bezeichnung" FilterControlAltText="Filter Bezeichnung column" SortExpression="Bezeichnung" HeaderText="Bezeichnung" ReadOnly="True" UniqueName="Bezeichnung">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Beschreibung" FilterControlAltText="Filter Beschreibung column" SortExpression="Beschreibung" HeaderText="Beschreibung" UniqueName="Beschreibung">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="AufwandinTagen" FilterControlAltText="Filter AufwandInTagen column" SortExpression="AufwandInTagen" HeaderText="Aufwand in Tagen" UniqueName="AufwandInTagen">
            </telerik:GridBoundColumn>
            <telerik:GridDateTimeColumn DataField="GeplanteFertigstellung" DataType="System.DateTime" FilterControlAltText="Filter GeplanteFertigstellung column" SortExpression="GeplanteFertigstellung" HeaderText="GeplanteFertigstellung" UniqueName="GeplanteFertigstellung">
            </telerik:GridDateTimeColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
        </telerik:RadPageView>
    </telerik:RadMultiPage>
    </div>



    </form>
</body>
</html>
