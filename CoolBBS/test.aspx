<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="CoolBBS.test1" %>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="Scripts/cssjs/style.css" rel="stylesheet" />
    <script>
        $(function () {
            $("div>ul>li>ul>li").hover(function () {
                $(this).children().stop.slideToggle();
            });
        })
    </script>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        div > ul > li > ul > li {
            float: left;
        }

        div ul ul {
            display: none;
        }

        .ahover:hover {
            cursor: pointer;
            color: #ff6a00;
        }
    </style>
    <script>

</script>
</head>
<body style="background: #F9F9F9;">
    <form id="form1" runat="server">
        <div>
            <div>
                <div style="">
                    <asp:Image ID="imgIcon" runat="server" src="Image/icon.png" />
                </div>
                <div id="login">
                    <ul>
                        <li>
                            <asp:HyperLink ID="hyLogin" CssClass="loginUserName" NavigateUrl="UserLogin.aspx" runat="server">登录</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="hyShu" runat="server">|</asp:HyperLink></li>
                        <li>
                            <asp:HyperLink ID="hyRegister" CssClass="loginUserName" NavigateUrl="UserRegister.aspx" runat="server">注册</asp:HyperLink></li>
                        <li>
                            <asp:LinkButton ID="hyLoginUser" CssClass="loginUserName" Visible="false" runat="server">username</asp:LinkButton>
                        </li>
                    </ul>
                </div>
                <div id="div_Search">
                    <asp:TextBox ID="textSearch" runat="server"></asp:TextBox>
                </div>
                <div id="div_menu">
                    <ul>
                        <li><a href="default.aspx">热门</a></li>
                        <li><a href="default.aspx">新帖</a></li>
                        <li><a href="SectionList.aspx">版块</a>
                            <ul>
                                <li>酷安特色
                                    <ul>
                                        <li>特色1</li>
                                        <li>特色2</li>
                                        <li>特色3</li>
                                    </ul>
                                </li>
                                <li>交易
                                    <ul>
                                        <li>交易1</li>
                                        <li>交易2</li>
                                        <li>交易3</li>
                                    </ul>
                                </li>
                                <li>游戏
                                    <ul>
                                        <li>游戏1</li>
                                        <li>游戏2</li>
                                        <li>游戏3</li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <div style="width: 70%; margin: 0 auto;">
                <div style="display: flex; flex-direction: row; flex: 2; margin: auto; margin-top: 5px; align-content: center; overflow: hidden;">
                    <div id="content" style="float: left; width: 68%; height: auto;">
                    </div>
                    <div id="main_right" style="float: left; width: 32%; height: auto;">
                        <div id="div_AddNewDynamic">
                            <asp:Button ID="btnAddDynamic" runat="server" Text="发表新帖" />
                        </div>
                        <div id="div_HotSection">
                            <div style="border-bottom: solid 1px #E1E2E6; height: 30px">
                                <asp:Label ID="lblHotSection" runat="server" Text="热门版块"></asp:Label>
                            </div>
                            <div>
                                <asp:DataList ID="dgHotSection" runat="server" Width="100%" RepeatColumns="2">
                                    <ItemTemplate>
                                        <div style="text-align: center; height: auto; border-right: solid 1px #E1E2E6;">
                                            <a href='<%# "DynamicList.aspx?SectionID="+Eval("SectionID") %>' class="ahover" style="text-decoration: none; color: #808080;">
                                                <asp:Label ID="lblSectionName" runat="server" Text='<%# Eval("SectionName") %>'></asp:Label>
                                            </a>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                        </div>
                        <div id="div_HotDynamic">
                            <div style="border-bottom: solid 1px #E1E2E6; height: 30px">
                                <asp:Label ID="lblHotDynamic" runat="server" Text="热帖排行"></asp:Label>
                            </div>
                            <div>
                                <asp:DataList ID="dgHotDynamic" runat="server" Width="100%" RepeatColumns="1">
                                    <ItemTemplate>
                                        <div style="text-align: start; height: 22px;">
                                            <a href='<%# "DynamicInfo.aspx?DynamicID="+Eval("DynamicID") %>' class="ahover" style="text-decoration: none; color: #808080; margin-left: 5px;">
                                                <asp:Label ID="lblSectionName" runat="server" Text='<%# Eval("DynamicTitle") %>'></asp:Label>
                                            </a>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
