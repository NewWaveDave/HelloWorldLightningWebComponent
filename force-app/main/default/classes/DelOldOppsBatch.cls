public class DelOldOppsBatch implements Database.Batchable<SObject>  {

    public Database.QueryLocator start(Database.BatchableContext bc) {
		return Database.getQueryLocator('SELECT Id FROM Opportunity WHERE (NOT StageName LIKE "Closed%") and CreatedDate < LAST_N_MONTHS:6');
	}

	public void execute(Database.BatchableContext bc, List<sObject> generics){
		List<Opportunity> opps = new List<Opportunity>();
		Opportunity opp;
		for(sObject generic : generics) {
			opp = (Opportunity) generic;
			opps.add(opp);
		}
		delete opps;
	}

	public void finish(Database.BatchableContext bc) {
	}
}