package my.com.subscription.app.scheduler;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import my.com.subscription.app.model.InvoiceSchedule;
import my.com.subscription.app.model.User;
import my.com.subscription.app.repository.InvoiceScheduleRepository;
import my.com.subscription.app.repository.UserRepository;

@Component
public class SchedulerProcess {

	@Autowired
	private JavaMailSender javaMailSender;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private InvoiceScheduleRepository invoiceScheduleRepository;

	public void sendInvoiceTask() {

		List<InvoiceSchedule> list = invoiceScheduleRepository.findAllByTodayDate();
		System.out.println("list.size() = " + list.size());

		if (list.size() > 0) {
			for (InvoiceSchedule is : list) {
				if (is.getIsSend() == false) {
					User user = is.getUser();

					SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");

					String strDate = formatter.format(is.getInvoiceDate());
					String amount = "RM0.00";

					if (user.getPlan() == 1)
						amount = "RM1.00";
					else if (user.getPlan() == 2)
						amount = "RM5.00";
					else if (user.getPlan() == 3)
						amount = "RM15.00";

					int indSend = 0;

					try {
						SimpleMailMessage msg = new SimpleMailMessage();
						msg.setTo(user.getEmail());
						msg.setSubject("Invoice date: " + strDate);
						msg.setText("Amount: " + amount);
						javaMailSender.send(msg);
						indSend = 1;
					} catch (MailException me) {
						me.printStackTrace();
					}

					if (indSend == 1) {
						is.setIsSend(true);
						invoiceScheduleRepository.save(is);
					}
				}
			}
		}
	}
}
