<%@ Page Title="" Language="C#" Async="true" MasterPageFile="~/Master/Main.Master" AutoEventWireup="true" CodeBehind="PersonalData.aspx.cs" Inherits="Public.View.PersonalData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="text-center mb-4">ข้อมูลบุคคล</h2>

    <asp:GridView ID="gvProduct" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered"
        OnPageIndexChanging="gvProduct_PageIndexChanging"
        OnSorting="gvProduct_Sorting" AllowPaging="true" PageSize="10" AllowSorting="true">
        <Columns>
            <asp:BoundField DataField="First_name" HeaderText="ชื่อ" SortExpression="First_name" />
            <asp:BoundField DataField="Last_name" HeaderText="นามสกุล" SortExpression="Last_name" />
            <asp:BoundField DataField="phone" HeaderText="เบอร์โทร" SortExpression="phone" />
        </Columns>
    </asp:GridView>
</asp:Content>
