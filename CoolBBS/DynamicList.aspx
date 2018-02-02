<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="DynamicList.aspx.cs" Inherits="CoolBBS.test11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Scripts/cssjs/DynaficListCss.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div style="text-align: center">
            <asp:Label ID="lblSectioName" Font-Size="X-Large" runat="server" Text="Label">版块名</asp:Label>
        </div>
        <div>
            <asp:DataList ID="dgDynamicList" runat="server" CssClass="borderradiu" BackColor="White" Width="100%">
                <ItemTemplate>
                    <div class="templateMain" style="margin-left: 10px; margin-top: 5px;">
                        <div style="float: left">
                            <asp:Image ID="imgUserHeadPic" Height="60px" Width="60px" ImageUrl='<%# Eval("ImageUrl") %>' runat="server" />
                        </div>
                        <div style="float: left; margin-left: 10px;">
                            <div style="margin-top: 10px; overflow: hidden;">
                                <a class="ahover lblSectionName" href='DynamicList.aspx?SectionID=<%# Eval("SectionID") %>'>[<asp:Label ID="lblSectionName" runat="server" Text='<%# Eval("SectionName") %>'></asp:Label>]</a>
                                <a class="ahover lblDynamicTitle" href='DynamicInfo.aspx?DynamicID=<%# Eval("DynamicID") %>'>
                                    <asp:Label ID="lblDynamicTitle" runat="server" Text='<%# Eval("DynamicTitle").ToString().Length>20?Eval("DynamicTitle").ToString().Substring(0,20):Eval("DynamicTitle") %>'></asp:Label>
                                </a>
                            </div>
                            <div style="margin-top: 12px; color: darkgrey; font-size: 15px;">
                                <a href='OtherUserInfo.html?<%# Eval("UserNum") %>' class="agrey ahover">
                                    <asp:Label ID="lblUserName" runat="server" Text='<%# Eval("UserName") %>'></asp:Label></a>|
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
    </div>
</asp:Content>
