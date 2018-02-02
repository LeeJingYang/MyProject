<%@ Page Title="" Language="C#" MasterPageFile="~/Head.Master" AutoEventWireup="true" CodeBehind="AddNewDynamic.aspx.cs" Inherits="CoolBBS.AddNewDynafic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="Scripts/cssjs/AddNewDynafic.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.10.2.js"></script>
    <script type="text/javascript">
        function changeCode() {
            document.getElementById('imgVerCode').src = document.getElementById('imgVerCode').src + '?';
        }
        //$(function () {
        //    $.ajax({
        //        type: "post",
        //        url: "ashx/AllTypeSection.ashx",
        //        success: function (data) {
        //            alert(data);
        //            for (var i = 0; i < data; i++) {
        //                alert(data[i]);
        //            }
        //        }
        //    })
        //})
    </script>
    <style>
        .dis {
            display: none;
        }

        .nav {
            height: 257px;
            width: 150px;
            background-color: white;
            margin-top: 20px;
            font-family: KaiTi;
        }

            .nav ul {
                list-style: none;
                position: relative;
            }

                .nav ul li {
                    line-height: 30px;
                    text-align: left;
                    padding: 0 0 0 0;
                }

                    .nav ul li a {
                        margin: 0;
                        padding: 0;
                        text-decoration: none;
                        color: #000;
                        font-weight: normal;
                    }

                    .nav ul li ul {
                        position: absolute;
                        top: 0;
                        left: 150px;
                        width: 300px;
                        height: 180px;
                        display: none;
                        background-color: white;
                    }

                    .nav ul li:hover ul {
                        display: block;
                        cursor: pointer;
                    }

                    .nav ul li ul li:hover a {
                        color: white;
                        background: orange;
                    }

                    .nav ul li ul li:hover {
                        background: orange;
                    }

                    .nav ul li label:hover {
                        cursor: pointer;
                    }

        .lblSelectSection {
            font-size: 18px;
            background: #E1E2E6;
            border-radius: 2px;
            width:190px;
            border:none;
            border-radius:5px;
            outline-color:transparent;
        }

            .lblSelectSection:hover {
                cursor: pointer;
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
            <%--<asp:Label ID="lblSelectSection" CssClass="lblSelectSection" runat="server" Text="选择话题"></asp:Label>--%>
            <%--<label id="lblGG" class="lblSelectSection" runat="server">GG</label>--%>
            <asp:TextBox ID="lblGG" CssClass="lblSelectSection" Text="选择话题" runat="server"></asp:TextBox>
            <label style="font-size: 20px; flex: 1; margin-top: 3px; text-align: right;" runat="server">标题:</label>
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
    <div id="divAddDynamic" style="position: fixed; left: 50%; top: 50%; transform: translate(-50%,-50%); width: 490px; height: 300px; background-color: white; z-index: 100;border-radius:5px;" class="dis">
        <div style="display: flex; flex-direction: row;">
            <div style="width: 50%;">
                <label style="font-family: KaiTi">选择话题</label>
            </div>
            <div style="width: 50%; text-align: right;">
                <img id="imgClose" src="Image/ic_close_black_18dp.png" style="width: 20px; height: 20px;" />
            </div>
        </div>
        <div class="nav">
            <ul id="ul_sectionType">
                <li>酷安特色
                    <ul>
                        <li>我在酷安的故事
                        </li>
                        <li>女装大佬
                        </li>
                        <li>酷安萌妹
                        </li>
                        <li>酷安生日会
                        </li>
                        <li>酷安鬼话
                        </li>
                    </ul>
                </li>
                <li>交易
                    <ul>
                        <li>二手交易
                        </li>
                        <li>酷安自贸区
                        </li>
                        <li>好卖家
                        </li>
                        <li>诈骗通缉榜
                        </li>
                        <li>退坑回血便宜出!
                        </li>
                    </ul>
                </li>
                <li>生活
                    <ul>
                        <li>旅行志
                        </li>
                        <li>今天吃什么
                        </li>
                        <li>字友会
                        </li>
                        <li>手机摄影
                        </li>
                        <li>奇趣玩物!
                        </li>
                        <li>告别书荒!
                        </li>
                    </ul>
                </li>
                <li>情感
                    <ul>
                        <li>酷安夜话
                        </li>
                        <li>初恋这件小事
                        </li>
                        <li>异地独居指南
                        </li>
                        <li>解忧杂货店
                        </li>
                    </ul>
                </li>
                <li>影音
                    <ul>
                        <li>好音乐
                        </li>
                        <li>好电影
                        </li>
                        <li>bilibili值得反复看的视频
                        </li>
                        <li>网易云那些神评论
                        </li>
                        <li>纪录片
                        </li>
                        <li>爱追剧
                        </li>
                    </ul>
                </li>
                <li>二次元
                    <ul>
                        <li>初音未来
                        </li>
                        <li>P站画师推荐
                        </li>
                        <li>GalGame
                        </li>
                        <li>Cosplay
                        </li>
                        <li>海贼王
                        </li>
                    </ul>
                </li>
                <li>游戏
                    <ul>
                        <li>王者荣耀为何这么diao
                        </li>
                        <li>Steam
                        </li>
                        <li>酷安年度游戏评选
                        </li>
                        <li>我的世界
                        </li>
                        <li>网易游戏
                        </li>
                        <li>最近在玩的游戏
                        </li>
                    </ul>
                </li>
                <li>互动
                    <ul>
                        <li>年轻人千万不能碰的东西
                        </li>
                        <li>ID的由来
                        </li>
                        <li>最想撤回的一次操作
                        </li>
                        <li>说出你被坑的经历
                        </li>
                        <li>酷安里特么被坑的用户名
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <div id="divdef" style="background-color: #808080; opacity: 0.7; width: 100%; height: 600px; position: fixed; left: 50%; top: 50%; transform: translate(-50%,-50%); z-index: 99;" class="dis">
    </div>
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script>
        $("#<%=lblGG.ClientID %>").on("click", function () {
            $("#divAddDynamic").fadeIn(700);
            $("#divdef").fadeIn(700);
        })
        <%--$("#<%=lblGG.ClientID %>").on("click", function () {
            $("#divAddDynamic").fadeIn(700);
            $("#divdef").fadeIn(700);
        })--%>
        $("#divdef").on("click", function () {
            $("#divAddDynamic").fadeOut(700);
            $("#divdef").fadeOut(700);
        })
        $("#imgClose").on("click", function () {
            $("#divAddDynamic").fadeOut(700);
            $("#divdef").fadeOut(700);
        })

        var label = $("#lblGG");
        $("#ul_sectionType li ul li").on("click", function () {
            //$("#lblGG").html(this.innerHTML);
            //$("#divAddDynamic").fadeOut(700);
            //$("#divdef").fadeOut(700);

            //label.html(this.innerHTML);
            //var stor = window.sessionStorage;
            //stor.setItem("dy", this.innerHTML);
            //$("#divAddDynamic").fadeOut(700);
            //$("#divdef").fadeOut(700);

            <%--var label = document.getElementById("<%=lblGG.ClientID %>");
            label.innerHTML = this.innerHTML;
            $("#divAddDynamic").fadeOut(700);
            $("#divdef").fadeOut(700);--%>
            
            document.getElementById('<%=lblGG.ClientID%>').value= this.innerHTML;
            $("#divAddDynamic").fadeOut(700);
            $("#divdef").fadeOut(700);
            
        })
        //label.attr("value", window.sessionStorage.getItem("dy"));
        //label.html(window.sessionStorage.getItem("dy"))
    </script>
</asp:Content>
