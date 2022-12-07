﻿<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web" TagPrefix="dx" %>





<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
</head>
<body>
	 <script type="text/javascript">
		 function OnEndCallback(s, e) {
			 var selectedNode = treeView.GetSelectedNode();
			 if (!selectedNode)
				 return;
			 var scrollElement = treeView.GetMainElement().parentNode;
			 var scrollValue = scrollElement.scrollTop + ASPxClientUtils.GetAbsoluteY(selectedNode.GetHtmlElement()) -
				Math.round(scrollElement.offsetHeight / 2);
			 if (scrollValue >= 0)
				 scrollElement.scrollTop = scrollValue;
		 }
	</script>
	<form id="form1" runat="server">
	<div>
		<dx:ASPxSiteMapDataSource ID="ASPxSiteMapDataSource1" runat="server" SiteMapFileName="~/App_Data/SiteMapFeature.sitemap" />
		<dx:ASPxCallbackPanel ID="callbackPanel" runat="server" OnCallback="callbackPanel_Callback"
			ClientInstanceName="callbackPanel">
			<PanelCollection>
				<dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">
					<dx:ASPxSplitter ID="splitter" runat="server" Height="200px">
						<Panes>
							<dx:SplitterPane ScrollBars="Auto">
								<ContentCollection>
									<dx:SplitterContentControl ID="SplitterContentControl1" runat="server" SupportsDisabledAttribute="True">
										<dx:ASPxTreeView ID="treeView" runat="server" DataSourceID="ASPxSiteMapDataSource1"
											ClientInstanceName="treeView" SyncSelectionMode="None">
										</dx:ASPxTreeView>
									</dx:SplitterContentControl>
								</ContentCollection>
							</dx:SplitterPane>
							<dx:SplitterPane>
								<ContentCollection>
									<dx:SplitterContentControl ID="SplitterContentControl2" runat="server" SupportsDisabledAttribute="True">
										<table>
											<tr>
												<td>
													<dx:ASPxTextBox ID="tbSearchQuery" runat="server" Width="170px">
													</dx:ASPxTextBox>
												</td>
												<td>
													<dx:ASPxButton ID="btnSearch" runat="server" Text="Search" AutoPostBack="false">
														<ClientSideEvents Click="function(s,e) { callbackPanel.PerformCallback(); }" />
													</dx:ASPxButton>
												</td>
											</tr>
										</table>
									</dx:SplitterContentControl>
								</ContentCollection>
							</dx:SplitterPane>
						</Panes>
					</dx:ASPxSplitter>
				</dx:PanelContent>
			</PanelCollection>
			<ClientSideEvents EndCallback="OnEndCallback" />
		</dx:ASPxCallbackPanel>
	</div>
	</form>
</body>
</html>