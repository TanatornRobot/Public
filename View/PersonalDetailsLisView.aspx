<%@ Page Title="แบบฟอร์มกรอกข้อมูล" Language="C#" MasterPageFile="~/Master/Main.Master" AutoEventWireup="true" CodeBehind="PersonalDetailsLisView.aspx.cs" Inherits="Public.View.PersonalDetailsLisView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <h2 class="text-center mb-4">แบบฟอร์มกรอกข้อมูล</h2>
        <asp:Label ID="lblMessage" runat="server" CssClass="text-success"></asp:Label>

        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control mb-3" Placeholder="ชื่อ" />
        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control mb-3" Placeholder="นามสกุล" />
        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control mb-3" Placeholder="เบอร์โทรศัพท์" />

        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary w-100" Text="ส่งข้อมูล" OnClick="btnSubmit_Click" />
    </div>

    <script>
        function submitForm() {
            const firstName = document.getElementById("firstName").value;
            const lastName = document.getElementById("lastName").value;
            const phone = document.getElementById("phone").value;

            if (!firstName || !lastName || !phone) {
                alert("กรุณากรอกข้อมูลให้ครบถ้วน");
                return;
            }

            alert("ชื่อ: " + firstName + "\nนามสกุล: " + lastName + "\nเบอร์โทร: " + phone);
        }
    </script>
</asp:Content>
