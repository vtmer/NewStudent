<%@ Page Language="C#" MasterPageFile="~/NewStudent/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="NewStudent_Default" Title="新生专题" EnableViewState="false" %>
<%@ Register Src="~/NewStudent/ul_list_default.ascx" TagName="list" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CSSPlaceHolder" Runat="Server">
<meta name="keywords" content="广东工业大学,广工,新生专题,录取分数线,入学"/>
<meta name="description" content="广东工业大学新生专题网" />
<link href="css/index.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
        <!--  main为各页面内容 -->
        <div id="main">
           <div id="new">
             <img src="images/index/new.gif" />
             <div>
                <div class="left">
                   <p class="hotTitle"><img src="images/index/hot.gif" /><a href="<%=hotlink[0] %>">【<%=hottitle[0] %>】</a></p>
                   <div>
                        <uc:list ID="all" sum="10" runat="server" />
                        
                   <a class="more" href="List.aspx?campus=<%=campus %>"><img src="images/index/more.gif" /></a>
                   </div>
                </div>
    
                <div class="right">
                  

 <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase=" http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0"  style=" margin-left:-2px" width="334" height="203" id="FlashID">
            <param name="movie" value="<%=campus %>1.swf" />
            <param name="quality" value="high" />
            <param name="wmode" value="transparent" />
            <param name="swfversion" value="6.0.65.0" />
            <!-- 此 param 标签提示使用 Flash Player 6.0 r65 和更高版本的用户下载最新版本的 Flash Player。如果您不想让用户看到该提示，请将其删除。 -->
            <param name="expressinstall" value="Scripts/expressInstall.swf" />
            <!-- 下一个对象标签用于非 IE 浏览器。所以使用 IECC 将其从 IE 隐藏。 -->
            <!--[if !IE]>-->
            <object type="application/x-shockwave-flash" data="<%=campus %>1.swf" width="334" height="203">
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
                
             </div>
           </div>
           
           <!-- 321开学啦 -->
           <div class="imformation">
              <a href="List.aspx?catid=<%=columns[0] %>"><img src="images/index/321.gif" /></a>
           
              <div>
                <div class="left">
                   <!--  标题列表： -->
                   <div>
<uc:list ID="kaixue" sum="8" runat="server" />
                   
                   </div>
                </div>
    
                <div class="right">
                   <img src="images/index/<%=campus %>1.jpg" />
                </div>
                <a class="more" href="List.aspx?catid=<%=columns[0] %>"><img src="images/index/morew.gif" /></a>
             </div>
           
           
           
           </div>
           
           
           <!-- 学习攻略 -->
           <div class="imformation">
              <a href="List.aspx?catid=<%=columns[1] %>"><img src="images/index/study.gif" /></a>
           
              <div>
                <div class="left">
                   <!--  标题列表： -->
                   <div>
<uc:list ID="xuexi" sum="8" runat="server"  />
                   
                   </div>
                </div>
    
                <div class="right">
                   <img src="images/index/<%=campus %>2.jpg" />
                </div>
                <a class="more" href="List.aspx?catid=<%=columns[1] %>"><img src="images/index/morew.gif" /></a>
             </div>
           
           
           
           </div>
           
           
           <!-- 生活Tips -->
           <div class="imformation">
              <a  href="List.aspx?catid=<%=columns[2] %>"><img src="images/index/tips.gif" /></a>
           
              <div>
                <div class="left">
                   <!--  标题列表： -->
                   <div>
<uc:list ID="shenghuo" sum="8" runat="server" />
                   
                   </div>
                </div>
    
                <div class="right">
                   <img src="images/index/<%=campus %>3.jpg" />
                </div>
                <a class="more" href="List.aspx?catid=<%=columns[2] %>"><img src="images/index/morew.gif" /></a>
             </div>
           
           
           
           </div>
           
           
           <!-- 校园Views -->
           <div class="imformation">
              <a href="List.aspx?catid=<%=columns[3] %>"><img src="images/index/views.gif" /></a>
           
              <div>
                <div class="left">
                   <!--  标题列表： -->
                   <div>
<uc:list ID="xiaoyuan" sum="8" runat="server" />
                   
                   </div>
                </div>
    
                <div class="right">
                   <img src="images/index/<%=campus %>4.jpg" />
                </div>
                <a class="more" href="List.aspx?catid=<%=columns[3] %>"><img src="images/index/morew.gif" /></a>
             </div>
           
           
           
           </div>
        
        
        </div>
</asp:Content>

