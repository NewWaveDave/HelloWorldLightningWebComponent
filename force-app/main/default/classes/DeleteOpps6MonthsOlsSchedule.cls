
public class DeleteOpps6MonthsOlsSchedule implements Schedulable {
    public void execute(SchedulableContext ctx) {
        DelOldOppsBatch bc = new DelOldOppsBatch();
        ID batchprocessid = Database.executeBatch(bc);
    }
}