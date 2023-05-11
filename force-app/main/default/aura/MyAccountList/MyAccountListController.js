({
    doInit : function(component, event, helper){
        component.find("recordData").getNewRecord("Account", null, false, $A.getCallback(function(){}));
    },

    save : function(component, event, helper) {
        var recordComp = component.find("recordData").saveRecord(function(saveResult){});
        $A.get('e.force:refreshView').fire(); 
	},
        

    myAction : function(component, event, helper) {
		
        component.set("v.Columns", [
    {label:"Name", fieldName:"Name", type:"text"},
    {label:"Phone", fieldName:"Phone", type:"phone"}
]);
        var action = component.get("c.getAccount");	
        action.setCallback(this, function(data) {
    component.set("v.Account", data.getReturnValue());
	});
	$A.enqueueAction(action);

	}
    
})