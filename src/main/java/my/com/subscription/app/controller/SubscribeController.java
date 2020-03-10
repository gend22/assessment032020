package my.com.subscription.app.controller;

import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import my.com.subscription.app.exception.ResourceNotFoundException;
import my.com.subscription.app.model.InvoiceSchedule;
import my.com.subscription.app.model.User;
import my.com.subscription.app.repository.InvoiceScheduleRepository;
import my.com.subscription.app.repository.UserRepository;

@RestController
@RequestMapping("/subscribe")
public class SubscribeController {
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private InvoiceScheduleRepository invoiceScheduleRepository;

	@RequestMapping(value = { "/submit" }, method = { RequestMethod.POST }, produces = "application/json")
	@Transactional(rollbackFor = {RuntimeException.class})
	public String createUser(@Valid @RequestBody User user) {
		JSONObject result = new JSONObject();
		try {
			result.put("response_code", "00");
			result.put("response_message", "Failed");
			user.setSubscribeDate(new Date());
			if (userRepository.save(user) != null) {
				if (user.getPlan() != 0) {
					ZoneId defaultZoneId = ZoneId.systemDefault();
					LocalDate futureDate = LocalDate.now().plusMonths(3);
					long noOfDaysBetween = ChronoUnit.DAYS.between(LocalDate.now(), futureDate);
					InvoiceSchedule objInv = null;
					if (user.getPlan() == 1) {
						for (int i = 1 ; i <= noOfDaysBetween; i++) {
							LocalDate futureDate2 = LocalDate.now().plusDays(i);
							objInv = new InvoiceSchedule();
							objInv.setUser(user);
							objInv.setInvoiceDate(Date.from(futureDate2.atStartOfDay(defaultZoneId).toInstant()));
							objInv.setIsSend(false);
							invoiceScheduleRepository.saveAndFlush(objInv);
						}
					}else if (user.getPlan() == 2) {
						for (int i = 1 ; i <= noOfDaysBetween; i++) {
							LocalDate futureDate2 = LocalDate.now().plusDays(i);
							if(futureDate2.getDayOfWeek().toString().equalsIgnoreCase("TUESDAY")) {
								objInv = new InvoiceSchedule();
								objInv.setUser(user);
								objInv.setInvoiceDate(Date.from(futureDate2.atStartOfDay(defaultZoneId).toInstant()));
								objInv.setIsSend(false);
								invoiceScheduleRepository.saveAndFlush(objInv);
							}
						}
					}else if (user.getPlan() == 3) {
						for (int i = 1 ; i <= noOfDaysBetween; i++) {
							LocalDate futureDate2 = LocalDate.now().plusDays(i);
							if (futureDate2.getDayOfMonth() == 20) {
								objInv = new InvoiceSchedule();
								objInv.setUser(user);
								objInv.setInvoiceDate(Date.from(futureDate2.atStartOfDay(defaultZoneId).toInstant()));
								objInv.setIsSend(false);
								invoiceScheduleRepository.saveAndFlush(objInv);
							}
						}
					}
				}
				result.put("response_code", "01");
				result.put("response_message", "Success");
				result.put("userId", user.getId());
			}			
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result.toString();
	}
	
	@GetMapping("/get_subscribe_user/{id}")
	public ResponseEntity<User> getSubscribeUserById(@PathVariable(value = "id") Long id)
			throws ResourceNotFoundException {
		User user = userRepository.findById(id)
				.orElseThrow(() -> new ResourceNotFoundException("User not found for this id :: " + id));
		return ResponseEntity.ok().body(user);
	}
	
	@GetMapping("/get_invoice_schedule/{userId}")
	public ResponseEntity<List<InvoiceSchedule>> getInvoiceScheduleByUserId(@PathVariable(value = "userId") Long userId)
			throws ResourceNotFoundException {
        List<InvoiceSchedule> list = new ArrayList<InvoiceSchedule>();
		list = invoiceScheduleRepository.findAllByUserId(userId);
		return ResponseEntity.ok().body(list);
	}
}
