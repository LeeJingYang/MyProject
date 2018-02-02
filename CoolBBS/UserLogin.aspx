<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="CoolBBS.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        * {
            margin: 0;
        }
    </style>
    <script src="Scripts/cssjs/jquery.min.js"></script>
    <link href="Scripts/cssjs/material.extra.css" rel="stylesheet" />
    <link href="Scripts/cssjs/material.green-red.min.css" rel="stylesheet" />
    <script src="Scripts/cssjs/material.min.js"></script>
    <link href="Scripts/cssjs/loginstyle.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="div_main">
            <div id="div_login">
                <div style="width:41%;margin:auto;">
                    <br /><br />
                    <div>
                        <h2 class="mdl-card__title-text" style="margin-top:20px;">用户登录</h2>
                    </div>
                    <br /><br />
                    <div>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <asp:TextBox ID="textLoginName" CssClass="mdl-textfield__input" Text="yanger" runat="server"></asp:TextBox>
                            <label class="mdl-textfield__label" id="login_label" for="textLoginName">用户名/Email</label>
                        </div>
                        <br />
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <asp:TextBox ID="textLoginPwd" CssClass="mdl-textfield__input" Text="qw4658223" TextMode="Password" runat="server"></asp:TextBox>
                            <label class="mdl-textfield__label" id="password_label" for="textLoginPwd">密码</label>
                        </div>
                    </div>
                    <br />
                    <div style="text-align:center">
                        <asp:Label ID="lblTips" runat="server" Text="Label" Visible="false" ForeColor="Red"></asp:Label>
                    </div>
                    <br />
                    <div>
                        <asp:Button ID="btnLogin" runat="server" Text="登录" Width="100%" Height="35px" OnClick="btnLogin_Click"/>
                    </div>
                </div>
                <br />
                <div style="width:45%;margin:auto;">
                    <div id="div_AddUser"">
                        <a href="UserRegister.aspx">新用户注册</a>
                        <a href="/auth/findPassword">忘记密码？</a>
                    </div>
                    <br />
                </div>
                <div style="width:45%;margin:auto;margin-top:55px">
                    <div id="div_command"">
                        <a href="default.aspx">返回首页</a>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
