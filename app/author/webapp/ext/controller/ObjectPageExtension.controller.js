sap.ui.controller("com.sap.author.ext.controller.ObjectPageExtension", {

	onCreate: function (oEvent) {
		var oContext = this.getOwnerComponent().getModel().createEntry("/Books", {
			properties: {
				"author_ID": this.getView().getBindingContext().getObject().ID,
				"currency_code": "USD"
			}
		});

		this.oBookDialog = sap.ui.xmlfragment("idBook", "com.sap.author.ext.fragment.AddBook", this);
		this.getView().addDependent(this.oBookDialog);
		this.oBookDialog.setBindingContext(oContext);

		this.oBookDialog.setEscapeHandler(function () {
			this.getOwnerComponent().getModel().resetChanges();
			this.oBookDialog.destroy();
		}.bind(this));
		this.oBookDialog.open();
	},

	onSave: function () {
		if (this.getOwnerComponent().getModel().hasPendingChanges()) {
			this.getOwnerComponent().getModel().submitChanges({
				success: function (oData) {
					var oTable = this.byId("com.sap.author::sap.suite.ui.generic.template.ObjectPage.view.Details::Authors--books::com.sap.vocabularies.UI.v1.LineItem::Table");
					sap.m.MessageToast.show("Book added into the list");
					this.oBookDialog.destroy();
					oTable.rebindTable();
				}.bind(this),
				error: function (oData) {
					sap.m.MessageToast.show("Creation Failed");
				}
			});
		}
	},

	onCancel: function () {
		this.oBookDialog.destroy();
	}

});