<%@ Page Language="C#" MasterPageFile="~/NewStudent/MasterPage.master" AutoEventWireup="true" CodeFile="Maps.aspx.cs" Inherits="NewStudent_Maps" Title="E眼工大" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CSSPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
<div style="padding:15px; text-align:center; width:100%">
<script src="scripts/swfobject_modified.js" type="text/javascript"></script>



<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="870" height="600" id="FlashID">
            <param name="movie" value="Map/load_<%=campus %>.swf" />
            <param name="quality" value="high" />
            <param name="wmode" value="transparent" />
            <param name="swfversion" value="6.0.65.0" />
            <!-- 此 param 标签提示使用 Flash Player 6.0 r65 和更高版本的用户下载最新版本的 Flash Player。如果您不想让用户看到该提示，请将其删除。 -->
            <param name="expressinstall" value="Scripts/expressInstall.swf" />
            <!-- 下一个对象标签用于非 IE 浏览器。所以使用 IECC 将其从 IE 隐藏。 -->
            <!--[if !IE]>-->
            <object type="application/x-shockwave-flash" data="Map/load_<%=campus %>.swf" width="870" height="600">
              <!--<![endif]-->
              <param name="quality" value="high" />
              <param name="wmode" value="transparent" />
              <param name="swfversion" value="6.0.65.0" />
              <param name="expressinstall" value="Scripts/expressInstall.swf" />
              <!-- 浏览器将以下替代内容显示给使用 Flash Player 6.0 和更低版本的用户。 -->
              <div>
                <h4>此页面上的内容需要较新版本的 Adobe Flash Player。</h4>
                <p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="获取 Adobe Flash Player" width="112" height="33" /></a></p>
              </div>
              <!--[if !IE]>-->
            </object>
            <!--<![endif]-->
      </object>

</div>








<script type="text/javascript">
<!--
columns="Maps.aspx";
swfobject.registerObject("FlashID");
//-->
</script>
<div  style=" height:50px;width:100%"></div>
</asp:Content>

