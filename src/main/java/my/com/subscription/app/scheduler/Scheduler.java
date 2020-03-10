package my.com.subscription.app.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Scheduler {
	
	@Autowired
	SchedulerProcess schedulerProcess;
	
	@Scheduled(cron = "0 0 9 * * ?") //everyday at 9am
	public void sendInvoice() {
		System.out.println("Cronjob Start [SEND INVOICE]");
		schedulerProcess.sendInvoiceTask();
		System.out.println("Cronjob End [SEND INVOICE]");
	}
}
