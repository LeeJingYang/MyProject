﻿using System.Web;

/// <summary>
///   WebMessageBox 的摘要说明
/// </summary>
public class WebMessageBox
{
    /// <summary>
    ///   网页消息对话框
    /// </summary>
    /// <param name="Message"> 要显示的消息文本 </param>
    public static void Show(string Message)
    {
        HttpContext.Current.Response.Write("<script language='javascript' type='text/javascript'>alert('" + Message +
                                           "')</script>");
        HttpContext.Current.Response.Write("<script>history.go(-1)</script>");
        HttpContext.Current.Response.End();
    }

    /// <summary>
    ///   网页消息对话框,并跳转到页面
    /// </summary>
    /// <param name="Message"> 要显示的消息文本 </param>
    /// <param name="Src"> 点击确定后跳转的页面 </param>
    public static void ShowNew(string Message, string Src)
    {
        HttpContext.Current.Response.Write("<script language='javascript' type='text/javascript'>alert('" + Message +
                                           "');parent.location.href='" + Src + "'</script>");
        HttpContext.Current.Response.End();
    }

    /// <summary>
    ///   网页消息对话框(含Frame)
    /// </summary>
    /// <param name="Message"> 要显示的消息文本 </param>
    /// <param name="SrcFrame"> 点击确定后跳转的页面（Frame） </param>
    public static void Show(string Message, string SrcFrame)
    {
        HttpContext.Current.Response.Write("<script language='javascript' type='text/javascript'>alert('" + Message +
                                           "');parent.location.href='" + SrcFrame + "'</script>");
        HttpContext.Current.Response.End();
    }

    /// <summary>
    ///   网页消息对话框
    /// </summary>
    /// <param name="Message"> 要显示的消息文本 </param>
    /// <param name="Close"> 关闭当前页面 </param>
    public static void Show(string Message, bool Close)
    {
        if (Close)
        {
            HttpContext.Current.Response.Write("<script language='javascript' type='text/javascript'>alert('" + Message +
                                               "');window.close()</script>");
            HttpContext.Current.Response.End();
        }
        else
        {
            HttpContext.Current.Response.Write("<script language='javascript' type='text/javascript'>alert('" + Message +
                                               "')</script>");
            HttpContext.Current.Response.End();
        }
    }
}