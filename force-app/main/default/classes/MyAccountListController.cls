public class MyAccountListController {

@AuraEnabled
public static List<Account> getAccount() {
   return [SELECT Id, Name,phone FROM Account];
}
}