<%@ Page Title="" Language="C#" MasterPageFile="~/Head.Master" AutoEventWireup="true" CodeBehind="DynamicInfo.aspx.cs" Inherits="CoolBBS.DynamicInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Scripts/cssjs/DynamicInfoStyle.css" rel="stylesheet" />
    <script type="text/javascript">
        function changeCode() {
            document.getElementById('imgVerCode').src = document.getElementById('imgVerCode').src + '?';
        }

    </script>
    <style>
        .btnFollow {
            background: #53BF57;
            border: none;
            border-radius: 5px;
            font-size: 15px;
            color: white;
        }

            .btnFollow:hover {
                cursor: pointer;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div style="height: auto; display: flex; flex-direction: row;">
            <div style="height: auto; flex: 1; text-align: center;">
                <div>
                    <asp:ImageButton ID="imgPublishUserHead" Width="100px" Height="100px" OnClick="imgPublishUserHead_Click" ImageUrl="Image/user.jpg" runat="server" />
                </div>
                <div>
                    <br />
                    <asp:Button ID="lblPublisherName" BackColor="Transparent" BorderStyle="None" runat="server" Text="Button" OnClick="lblPublisherName_Click" />
                </div>
                <div>
                    <br />
                    <asp:Label ID="lblUserRemark" runat="server" Text="Remark"></asp:Label>
                </div>
                <div>
                    <br />
                    <asp:Button ID="btnFollow" CssClass="btnFollow" runat="server" Text="关注" OnClick="btnFollow_Click" />
                </div>
            </div>
            <div style="flex: 3; text-align: center; margin-top: 10px">
                <div style="text-align: left; margin-left: 10px;">
                    <asp:Label ID="lblPublishDate" runat="server" Text="发布于" ForeColor="#808080"></asp:Label>
                </div>
                <div style="margin-top: 15px; text-align: center;">
                    <asp:Label ID="lblDynamicTitle" runat="server" Text="标题" Font-Size="X-Large"></asp:Label>
                </div>
                <div style="text-align: left; margin-top: 20px;">
                    <asp:Label ID="lblDynamicContent" CssClass="lblDynamicContent" Width="90%" Font-Size="Large" runat="server" Text="LabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabel"></asp:Label>
                </div>
                <div style="width: 90%; margin: auto; margin-top: 15px; text-align: center">
                    <asp:DataList ID="dgPics" Width="100%" runat="server">
                        <ItemTemplate>
                            <div style="text-align:center;width:100%;">
                                <a href='<%# Eval("PicturesPath") %>' download=".."><asp:Image ID="Image1" ImageUrl='<%# Eval("PicturesPath") %>' runat="server" /></a>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
                <div style="margin-top: 15px;">
                    <asp:Button ID="btnCollect" CssClass="btnCollect" runat="server" Text="收藏" OnClick="btnCollect_Click" />
                </div>
            </div>
        </div>
        <div style="height: auto; width: 100%; margin-top: 100px">
            <asp:DataList ID="dgReplyList" runat="server" Width="100%">
                <ItemTemplate>
                    <div style="height: auto; display: flex; flex-direction: row; padding-top: 8px;">
                        <div style="height: auto; flex: 1; text-align: center;">
                            <div>
                                <img src='<%# Eval("PicturesPath") %>' style="width: 100px; height: 100px;" />
                            </div>
                            <div>
                                <br />
                                <a style="text-decoration: none" href='UserInfo.aspx?UserNum=<%# Eval("UserNum") %>'>
                                    <label><%# Eval("UserName") %></label></a>
                            </div>
                            <div>
                                <br />
                                <label><%# Eval("Remark") %></label>
                            </div>
                        </div>
                        <div style="flex: 3; text-align: center; height: 90px;margin-top:10px;">
                            <div style="text-align: left">
                                <label style="color: #808080; margin-left: 5%"><%# Eval("PublishDate") %></label>
                            </div>
                            <div style="text-align: left; margin-top: 20px;">
                                <asp:Label ID="lblReplyContent" CssClass="lblDynamicContent" Width="90%" Font-Size="Large" runat="server" Text='<%# Eval("ReplyContent") %>'></asp:Label>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                <SeparatorTemplate>
                    <div style="height: 2px; background: #CBCBCB"></div>
                </SeparatorTemplate>
            </asp:DataList>
            <div style="margin-left: 25%; margin-top: 50px; text-align: center; width: 75%;">
                <asp:Button ID="btnToLogin" CssClass="btnAddNewDynamic" runat="server" Text="回复" OnClick="btnToLogin_Click" />
            </div>
        </div>

        <asp:Panel ID="Panel1" Visible="false" runat="server">
            <div style="height: 200px; display: flex; flex-direction: row; margin-top: 100px;">
                <div style="height: auto; flex: 1; text-align: center;">
                    <div style="margin-top: 5px;">
                        <asp:Image ID="imgUesrHeadPic" Width="100px" Height="100px" ImageUrl="Image/user.jpg" runat="server" />
                    </div>
                    <div>
                        <br />
                        <asp:Label ID="lblUserName" runat="server" Text="UserName"></asp:Label>
                    </div>
                </div>
                <div style="flex: 3;">
                    <div>
                        <asp:TextBox ID="textReplyContent" runat="server" CssClass="lblDynamicContent" Width="90%" Height="150px" TextMode="MultiLine"></asp:TextBox>
                    </div>
                    <div id="div_AddNewDynamic">
                        <div style="flex: 4; height: 20px; margin-top: 4px;">
                            <ul style="display: inline-block; list-style: none; text-align: right;">
                                <li style="float: left; margin-top: 1px; margin-left: 50px;">
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
                            <asp:Button ID="btnAddNewReply" CssClass="btnAddNewDynamic" runat="server" Text="发表回复" OnClick="btnAddNewReply_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
