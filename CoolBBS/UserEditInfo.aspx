<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/User.Master" CodeBehind="UserEditInfo.aspx.cs" Inherits="CoolBBS.UserInfo" %>


<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <link href="Scripts/cssjs/UserInfoStyle.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="con_main" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left: 20px; height: auto;">
        <div style="border: solid darkgray 1px; border-radius: 8px; background: white;">
            <div style="border-bottom: solid darkgray 1px; text-align: left">
                <label style="font-family: SimHei; font-size: larger; margin-left: 10px;">个人资料</label>
            </div>
            <div style="width: 94%; margin: auto; display: flex; flex-direction: row;">
                <div id="div_Info" style="flex: 1; margin-left: 50px;">
                    <div>
                        <br />
                        <label>用户名</label>
                    </div>
                    <div>
                        <br />
                        <br />
                        <label>自我介绍</label>
                    </div>
                    <div>
                        <br />
                        <br />
                        <label>性别</label>
                    </div>
                    <div>
                        <br />
                        <br />
                        <label>生日</label>
                    </div>
                    <div>
                        <br />
                        <br />
                        <label>QQ</label>
                    </div>
                    <div>
                        <br />
                        <br />
                        <label>E-mail</label>
                    </div>
                    <div>
                        <br />
                        <br />
                        <label>兴趣爱好</label>
                        <br />
                        <br />
                    </div>
                </div>
                <div style="flex: 4;">
                    <div>
                        <br />
                        <asp:Label ID="lblUserName" runat="server" Text="UserName" ForeColor="#808080" Font-Bold="true"></asp:Label>
                    </div>
                    <div>
                        <br />
                        <asp:TextBox ID="textUserRemark" CssClass="textUserRemark" runat="server"></asp:TextBox>
                    </div>
                    <div>
                        <br />
                        <div class="ftid_spacecp_levels">
                            <asp:DropDownList ID="cboGender" runat="server" CssClass="cboGender">
                                <asp:ListItem>保密</asp:ListItem>
                                <asp:ListItem>男</asp:ListItem>
                                <asp:ListItem>女</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div>
                        <br />
                        <asp:DropDownList ID="cboBirthdayYear" runat="server" CssClass="cbobirth">
                        </asp:DropDownList>
                        <asp:DropDownList ID="cboBirthdayMonth" runat="server" CssClass="cbobirth">
                        </asp:DropDownList>
                        <asp:DropDownList ID="cboBirthdayDay" runat="server" CssClass="cbobirth">
                        </asp:DropDownList>
                    </div>
                    <div>
                        <br />
                        <asp:TextBox ID="textUserQQ" CssClass="textUserRemark" runat="server"></asp:TextBox>
                    </div>
                    <div style="margin-top:9px;">
                        <br />
                        <asp:Label ID="lblEmail" CssClass="textEmail" runat="server" Text="Email"></asp:Label>
                    </div>
                    <div>
                        <br />
                        <asp:TextBox ID="textUserHobby" CssClass="textHobby" runat="server" TextMode="MultiLine"></asp:TextBox>
                        <br />
                        <br />
                    </div>
                </div>
            </div>
        </div>
        <div style="text-align:right;">
            <asp:Button ID="btnSaveUserInfo" runat="server" Text="保存" CssClass="btnSaveUserInfo" OnClick="btnSaveUserInfo_Click" />
        </div>
    </div>
</asp:Content>
