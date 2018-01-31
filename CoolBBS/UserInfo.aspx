<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserInfo.aspx.cs" Inherits="CoolBBS.UserInfo1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Scripts/cssjs/UserInfoStyle.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left: 20px; height: auto;">
        <div style="border: solid darkgray 1px; border-radius: 8px; background: white;">
            <div style="border-bottom: solid darkgray 1px; text-align: left">
                <label style="font-family: SimHei; font-size: larger; margin-left: 10px;">个人资料</label>
            </div>
            <div style="width: 94%; margin: auto; display: flex; flex-direction: row;">
                <div id="div_Info" style="flex: 1; margin-left: 30px;">
                    <div>
                        <br />
                        <label>用户名</label>
                    </div>
                    <div>
                        <br />
                        <label>自我介绍</label>
                    </div>
                    <div>
                        <br />
                        <label>性别</label>
                    </div>
                    <div>
                        <br />
                        <label>生日</label>
                    </div>
                    <div>
                        <br />
                        <label>QQ</label>
                    </div>
                    <div>
                        <br />
                        <label>E-mail</label>
                    </div>
                    <div>
                        <br />
                        <label>兴趣爱好</label>
                        <br />
                        <br />
                    </div>
                </div>
                <div style="flex: 4;">
                    <asp:DataList ID="dgUesrInfo" Width="100%" runat="server">
                        <ItemTemplate>
                            <div>
                                <br />
                                <asp:Label ID="lblUserName" Font-Bold="true" ForeColor="#8D8D8D" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                            </div>
                            <div>
                                <br />
                                <asp:Label ID="lblUserRemark" CssClass="labelAutoLine" runat="server" Text='<%# (Eval("Remark")==null) ? "-" : Eval("Remark") %>'></asp:Label>
                            </div>
                            <div>
                                <br />
                                <div class="ftid_spacecp_levels">
                                    <asp:Label ID="lblUserGender" runat="server" Text='<%# (Eval("Gender")==null) ? "-" : Eval("Gender") %>'></asp:Label>
                                </div>
                            </div>
                            <div>
                                <br />
                                <asp:Label ID="lblUserBirthday" runat="server" Text='<%# (Eval("Birthday").ToString()).Substring(0,3)=="000" ? "-" : Eval("Birthday") %>'></asp:Label>
                            </div>
                            <div>
                                <br />
                                <asp:Label ID="lblUserQQ" runat="server" Text='<%# (Eval("QQNumber")==null) ? "-" : Eval("QQNumber") %>'></asp:Label>
                            </div>
                            <div>
                                <br />
                                <asp:Label ID="lblUserEmail" runat="server" Text='<%# (Eval("Email")==null) ? "-" : Eval("Email") %>'></asp:Label>
                            </div>
                            <div>
                                <br />
                                <asp:Label ID="lblUserHobby" CssClass="labelAutoLine" Width="70%" runat="server" Text='<%# (Eval("Hobby")==null) ? "-" : Eval("Hobby") %>'></asp:Label>
                                <br />
                                <br />
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
        </div>
        <div style="border: solid darkgray 1px; border-radius: 8px; margin-top: 10px;">
            <div style="border-bottom: solid darkgray 1px;">
                <label style="font-family: SimHei; font-size: larger; margin-left: 10px;">活跃概况</label>
            </div>
            <div style="display: flex; flex-direction: row; height: 32px;">
                <div style="flex: 1; text-align: center; border-right: solid darkgray 1px;">
                    <div style="height: 5px;"></div>
                    <label style="font-size: 15px;">注册时间</label>
                </div>
                <div style="flex: 2; text-align: center; border-right: solid darkgray 1px;">
                    <div style="height: 5px;"></div>
                    <asp:Label ID="lblRegDate" Font-Size="15px" runat="server" Text="2018-01-01"></asp:Label>
                </div>
                <div style="flex: 1; text-align: center; border-right: solid darkgray 1px; vertical-align: central">
                    <div style="height: 5px;"></div>
                    <label style="font-size: 15px;">发帖数</label>
                </div>
                <div style="flex: 2; text-align: center;">
                    <div style="height: 5px;"></div>
                    <asp:Label ID="lblDynamicCount" Font-Size="15px" runat="server" Text="0"></asp:Label>
                </div>
            </div>
            <div style="display: flex; flex-direction: row; height: 32px; border-top: solid darkgray 1px;">
                <div style="flex: 1; text-align: center; border-right: solid darkgray 1px; vertical-align: central">
                    <div style="height: 5px;"></div>
                    <label style="font-size: 15px;">上次发表时间</label>
                </div>
                <div style="flex: 2; text-align: center; border-right: solid darkgray 1px;">
                    <div style="height: 5px;"></div>
                    <asp:Label ID="lblLastPublishDate" Font-Size="15px" runat="server" Text="2018-01-01"></asp:Label>
                </div>
                <div style="flex: 1; text-align: center; border-right: solid darkgray 1px;">
                    <div style="height: 5px;"></div>
                    <label style="font-size: 15px;">最后访问</label>
                </div>
                <div style="flex: 2; text-align: center;">
                    <div style="height: 5px;"></div>
                    <asp:Label ID="lblLastVisitTime" Font-Size="15px" runat="server" Text="2018-01-01"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
