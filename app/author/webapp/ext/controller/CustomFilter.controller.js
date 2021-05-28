sap.ui.define([
	"sap/ui/core/mvc/Controller"
], function (Controller) {
	"use strict";
	return Controller.extend("com.sap.author.ext.controller.CustomFilter", {
		/**
		 * Called when the App controller is instantiated.
		 * Disable busy indication when the metadata is loaded and in case of errors
		 * Apply content density mode to root view
		 * @public
		 * @memberOf com.sap.ibso.sto.goodsreceipt.controller.App
		 */
		onInit: function () {
		}
		
	});
});