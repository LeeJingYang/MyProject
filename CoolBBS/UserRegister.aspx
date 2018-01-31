<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegister.aspx.cs" Inherits="CoolBBS.UserRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
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
                        <h2 class="mdl-card__title-text" style="margin-top:20px;">注册账号</h2>
                    </div>
                    <br /><br />
                    <div>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label step-email step-mobile hide">
                            <asp:TextBox ID="textusername" CssClass="mdl-textfield__input" MaxLength="12" runat="server"></asp:TextBox>
                            <label class="mdl-textfield__label" id="username_label" for="textusername">用户名</label>
                        </div>
                        <br />
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label step-email step-mobile hide">
                            <asp:TextBox ID="textEmail" CssClass="mdl-textfield__input" MaxLength="30" runat="server"></asp:TextBox>
                            <label class="mdl-textfield__label" id="useremal_label" for="textEmail">邮箱</label>
                        </div>
                        <br />
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label step-email step-mobile hide">
                            <asp:TextBox ID="textLoginPwd" CssClass="mdl-textfield__input" MaxLength="18" TextMode="Password" runat="server"></asp:TextBox>
                            <label class="mdl-textfield__label" id="password_label" for="textLoginPwd">密码</label>
                        </div>
                    </div>
                    <br />
                    <div style="text-align:center">
                        <asp:Label ID="lblTips" ForeColor="Red" Visible="false" CssClass="labelAutoLine" runat="server" Text="Label"></asp:Label>
                    </div>
                    <br />
                    <div>
                        <asp:Button ID="btnRegister" runat="server" Text="注册" Width="100%" Height="35px" OnClick="btnRegister_Click"/>
                    </div>
                </div>
                <br />
                <div style="width:45%;margin:auto;">
                    <div id="div_AddUser"">
                        <a href="UserLogin.aspx">已有账户登录</a>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

