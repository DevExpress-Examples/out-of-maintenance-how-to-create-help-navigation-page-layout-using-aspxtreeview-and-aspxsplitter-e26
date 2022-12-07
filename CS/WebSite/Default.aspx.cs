using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e) {
        if (!IsPostBack) {
            this.treeView.DataBind();
            this.treeView.ExpandToDepth(1);
        }
    }

    protected void callbackPanel_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e) {
        TreeViewNode foundNode = FindTextInNodesRecursive(this.tbSearchQuery.Text.ToLower().Trim(),
            this.treeView.Nodes);
        this.treeView.SelectedNode = foundNode;
        if (foundNode != null)
            this.treeView.ExpandToNode(foundNode);
    }

    protected TreeViewNode FindTextInNodesRecursive(string text, TreeViewNodeCollection nodes) {
        foreach (TreeViewNode node in nodes) {
            if (node.Text.ToLower().Contains(text))
                return node;
            if (node.Nodes.Count > 0) {
                TreeViewNode foundNode = FindTextInNodesRecursive(text, node.Nodes);
                if (foundNode != null)
                    return foundNode;
            }
        }
        return null;
    }
}