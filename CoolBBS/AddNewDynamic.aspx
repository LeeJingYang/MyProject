<%@ Page Title="" Language="C#" MasterPageFile="~/Head.Master" AutoEventWireup="true" CodeBehind="AddNewDynamic.aspx.cs" Inherits="CoolBBS.AddNewDynafic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="Scripts/cssjs/AddNewDynafic.css" rel="stylesheet" />
    <script type="text/javascript">
        function changeCode() {
            document.getElementById('imgVerCode').src = document.getElementById('imgVerCode').src + '?';
        }
    </script>
    <style>
        .dis {
            display: none;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="">
        <div style="border-bottom: solid 3px #E9E9E9;">
            <h1 style="font-size: 20px; padding-top: 10px; padding-left: 10px; padding-bottom: 6px;">发表帖子</h1>
        </div>
        <div style="margin-top: 10px; margin-left: 15px; padding-bottom: 10px; display: flex; flex-direction: row;">
            <label style="font-size: 20px; flex: 1; text-align: right; margin-top: 3px">话题:</label>
            <asp:DropDownList ID="cboSections" Font-Size="18px" Height="28px" runat="server"></asp:DropDownList>
            <%--<asp:Label ID="lblSelectSection" runat="server" Text="选择版块" BorderStyle="Solid" BorderWidth="1px" Font-Size="18px" Height="21px"></asp:Label>--%>
            <label style="font-size: 20px; flex: 1; margin-top: 3px; text-align: right;">标题:</label>
            <asp:TextBox ID="textDynamicTitle" CssClass="textDynamicTitle" MaxLength="40" runat="server"></asp:TextBox>
            <div style="flex: 3; text-align: center;">
                <div id="div_imgaAddPic">
                    <label style="font-size: 14px; margin-top: 2px; margin-left: 5px;">图片:</label>
                    <input id="picFile" accept="Image/*" multiple="multiple" style="width: 70px;" type="file" runat="server" />
                    <asp:Button ID="btnUpload" runat="server" Text="添加" OnClick="btnUpload_Click" />
                    <asp:Button ID="btnPicCount" BorderStyle="None" BackColor="Transparent" runat="server" Text="0" />
                </div>
            </div>
        </div>
        <asp:TextBox ID="textDynamicContent" Width="100%" Height="400px" MaxLength="3000" runat="server" TextMode="MultiLine" Font-Size="X-Large"></asp:TextBox>
        <div id="div_AddNewDynamic">
            <div style="flex: 4; height: 20px; margin-top: 4px;">
                <ul style="display: inline-block; list-style: none;">
                    <li style="float: left; margin-top: 1px">
                        <label style="height: 20px;">验证码:</label>
                    </li>
                    <li style="float: left;">
                        <asp:TextBox ID="textVerCode" runat="server" Width="70px"></asp:TextBox>
                    </li>
                    <li style="float: left;">
                        <asp:ImageButton ID="imgVerCode" Height="20px" runat="server" />
                    </li>
                </ul>
            </div>
            <div style="flex: 1">
                <asp:Button ID="btnAddNewDynamic" CssClass="btnAddNewDynamic" runat="server" Text="发表帖子" OnClick="btnAddNewDynamic_Click1" />
            </div>
        </div>
    </div>
    <div id="divAddDynamic" style="position: fixed; left: 50%; top: 50%; transform: translate(-50%,-50%); width: 450px; height: 300px; background-color: violet; z-index: 100" class="dis">
        <div style="display: flex; flex-direction: row;">
            <div style="width: 50%;">
                <label>选择话题</label>
            </div>
            <div style="width: 50%;">
                <img src="Image/ic_image_black_48dp.png" />
            </div>
        </div>
    </div>
    <div id="divdef" style="background-color: #808080; opacity: 0.7; width: 100%; height: 600px; position: fixed; left: 50%; top: 50%; transform: translate(-50%,-50%); z-index: 99" class="dis">
    </div>
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script>
        $("#lblSelectSection").on("click", function () {
            $("#divAddDynamic").fadeIn(700);
            $("#divdef").fadeIn(700);
        })
        $("#divdef").on("click", function () {
            $("#divAddDynamic").fadeOut(700);
            $("#divdef").fadeOut(700);
        })
    </script>
</asp:Content>
