Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web.ASPxTreeView

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		If (Not IsPostBack) Then
			Me.treeView.DataBind()
			Me.treeView.ExpandToDepth(1)
		End If
	End Sub

	Protected Sub callbackPanel_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase)
		Dim foundNode As TreeViewNode = FindTextInNodesRecursive(Me.tbSearchQuery.Text.ToLower().Trim(), Me.treeView.Nodes)
		Me.treeView.SelectedNode = foundNode
		If foundNode IsNot Nothing Then
			Me.treeView.ExpandToNode(foundNode)
		End If
	End Sub

	Protected Function FindTextInNodesRecursive(ByVal text As String, ByVal nodes As TreeViewNodeCollection) As TreeViewNode
		For Each node As TreeViewNode In nodes
			If node.Text.ToLower().Contains(text) Then
				Return node
			End If
			If node.Nodes.Count > 0 Then
				Dim foundNode As TreeViewNode = FindTextInNodesRecursive(text, node.Nodes)
				If foundNode IsNot Nothing Then
					Return foundNode
				End If
			End If
		Next node
		Return Nothing
	End Function
End Class