<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CoolBBS._Default" %>

<%--<%@ OutputCache Duration="100" VaryByParam="none" VaryByControl="dgDynamicList" %>--%>
<%--<%@ OutputCache CacheProfile="dynamicListCache" %>--%>

<asp:Content ID="header" ContentPlaceHolderID="head" runat="server">
    <style>
        a {
            text-decoration: none;
        }

        .ahover:hover {
            cursor: pointer;
            color: #ff6a00;
        }

        .borderradiu {
            border-radius: 7px;
        }

        .agrey {
            color: darkgray;
        }

        .lblSectionName {
            color: blue;
            font-size: 16px;
        }

        .lblDynamicTitle {
            color: darkgoldenrod;
            font-size: 16px;
        }

        .cursorPoint:hover {
            cursor: pointer;
        }

        #fd {
            width: 100%;
            height: 330px;
            /*border:2px solid blanchedalmond;*/
            /*overflow:auto;*/
            margin: 5px auto;
            /*border-radius:50px;*/
        }

            #fd ul li {
                list-style: none;
                width: 100%;
                display: none;
            }

            #fd li img {
                background-size: auto;
                margin: 0 auto;
                width: 100%;
                height: 330px;
                border-radius: 50px;
            }
    </style>

</asp:Content>

<asp:Content ID="con_lunbo" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div id="fd">
        <ul>
            <li style="display: block;"><a href="DynamicList.aspx?SectionID=section2018012500022">
                <img src="Image/lunbo/好电影.jpg" /></a></li>
            <li><a href="DynamicList.aspx?SectionID=section2018012500021">
                <img src="Image/lunbo/好音乐.jpg" /></a></li>
            <li><a href="DynamicList.aspx?SectionID=section2018012500017">
                <img src="Image/lunbo/酷安夜话.jpg" /></a></li>
            <li><a href="DynamicList.aspx?SectionID=section2018012500011">
                <img src="Image/lunbo/旅行志.jpg" /></a></li>
            <li><a href="DynamicList.aspx?SectionID=section2018012500014">
                <img src="Image/lunbo/手机摄影.jpg" /></a></li>
        </ul>
    </div>
    <script src="Scripts/cssjs/js/jquery-1.11.0.min.js"></script>
    <script>
        var app = {
            time: null,
            fd: "123",
            i: 0,
            index: $("#fd ul li").length,
            init: function () {
                app.dast();
                app.start();
                $("#d1 a:eq(0)").css("background-color", "red")
                app.cldis();
            },
            clearStyle: function () {
                app.i++;;
                app.fdes();
                app.fonts()
                if (app.i >= app.index) {
                    app.i = 0;
                    app.fdes();
                    $("#fd ul li:eq(0)").css("display", "block");
                    $("#d1 a:eq(0)").css("background-color", "red")
                }
                $("#d1 a:eq(" + app.i + ")").css("background-color", "red");
            },
            fdes: function () {
                for (var d = 0; d < app.index; d++) {
                    $("#d1 a:eq(" + d + ")").css("background-color", "black");
                    $("#fd ul li:eq(" + d + ")").css("display", "");
                }
            },
            fonts: function () {
                $("#fd ul li:eq(" + app.i + ")").css("display", "block");
            },
            cldis: function () {
                $("#d1 a").on("click", function () {
                    app.fdes();
                    var count = this.title;
                    app.stop();
                    app.i = count;
                    app.fonts();
                    $("#d1 a:eq(" + app.i + ")").css("background-color", "red")
                    app.start();
                })
            },
            dast: function () {
                $("<div/>").attr("id", "d1").css({ "position": "relative", "left": "440px", "top": "-40px" }).appendTo("#fd");
                for (var k = 0; k < app.index; k++) {
                    $("<a/>").attr("title", k).css({ "display": "block", "background-color": "black", "width": "10px", "height": "10px", "border-radius": "5px", "float": "left", "margin-left": "10px" }).appendTo("#d1");
                }
            },
            stop: function () {
                clearInterval(app.time);
            },
            start: function () {
                app.time = setInterval(app.clearStyle, 2000);
            }
        }
        app.init();
    </script>
</asp:Content>
<asp:Content ID="con_main" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background: #F9F9F9">
        <div style="width: 94%; margin-left: 6%;">
            <div>
                <asp:DataList ID="dgDynamicList" CssClass="borderradiu" Width="100%" BackColor="White" runat="server" OnItemCommand="dgDynamicList_ItemCommand">
                    <ItemTemplate>
                        <div class="templateMain" style="margin-left: 10px; margin-top: 5px; width: 100%">
                            <div style="float: left">
                                <a href='OtherUserInfo.html'>
                                    <asp:Image ID="imgUserHeadPic" Height="60px" Width="60px" ImageUrl='<%# Eval("ImageUrl") %>' runat="server" /></a>
                            </div>
                            <div style="float: left; margin-left: 10px;">
                                <div style="margin-top: 10px; overflow: hidden;">
                                    <a class="ahover lblSectionName" href='DynamicList.aspx?SectionID=<%# Eval("SectionID") %>'>[<asp:Label ID="lblSectionName" runat="server" Text='<%# Eval("SectionName") %>'></asp:Label>]</a>
                                    <a class="ahover lblDynamicTitle" href='DynamicInfo.aspx?DynamicID=<%# Eval("DynamicID") %>'>
                                        <asp:Label ID="lblDynamicTitle" ForeColor="#808080" runat="server" Text='<%# Eval("DynamicTitle").ToString().Length>20?Eval("DynamicTitle").ToString().Substring(0,20):Eval("DynamicTitle") %>'></asp:Label>
                                    </a>
                                </div>
                                <div style="margin-top: 12px; color: darkgrey; font-size: 15px;">
                                    <a href='OtherUserInfo.html?<%# Eval("UserNum") %><%# Eval("MyUserNum") %>' class="agrey ahover">
                                        <asp:Label ID="lblUserName" runat="server" Text='<%# Eval("UserName") %>'></asp:Label></a>
                                    <asp:Label ID="Label4" runat="server" Text="浏览:"></asp:Label>
                                    <asp:Label ID="lblDynamicReadCount" runat="server" Text='<%# Eval("ReadCount") %>'></asp:Label>|
                                <asp:Label ID="Label7" runat="server" Text="回复:"></asp:Label>
                                    <a href='DynamicInfo.aspx?DynamicID=<%# Eval("DynamicID") %>' class="agrey ahover">
                                        <asp:Label ID="lblReplyCount" runat="server" Text='<%# Eval("ReplyCount") %>'></asp:Label></a>    |
                                <asp:Label ID="Label6" runat="server" Text="发布于:"></asp:Label>
                                    <asp:Label ID="lblPublishDate" runat="server" Text='<%# Eval("PublishDate") %>'></asp:Label>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                    <SeparatorTemplate>
                        <div style="width: 90%; height: 10px; margin: auto; border-bottom: dotted darkgrey 1px;"></div>
                    </SeparatorTemplate>
                </asp:DataList>
            </div>
            <div style="text-align: center;">
                <asp:Button ID="btnFrontPage" runat="server" Text="上一页" OnClick="btnFrontPage_Click" />
                <asp:Label ID="lblPageNum" runat="server" Text="1"></asp:Label>
                <asp:Button ID="btnNextPage" runat="server" Text="下一页" OnClick="btnNextPage_Click" />
                <asp:TextBox ID="textToPage" runat="server" Width="40px" TextMode="Number"></asp:TextBox>
                <asp:Button ID="btnToPage" runat="server" Text="跳到" OnClick="btnToPage_Click" />
                <asp:Button ID="btnToLastPage" runat="server" Text="尾页" OnClick="btnToLastPage_Click" />
            </div>
        </div>
    </div>
</asp:Content>
