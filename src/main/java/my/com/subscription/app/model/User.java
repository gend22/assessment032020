package my.com.subscription.app.model;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class User {

	private long id;
	private String name;
	private String email;
	private int plan;
	private Date subscribeDate;
	
	@OneToMany(mappedBy="user")
    private Set<InvoiceSchedule> invoiceSchedules;
	
	public User() {
		
	}
	
	public User(String name, int plan, String email) {
		this.name = name;
		this.email = email;
		this.plan = plan;
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	@Column(name = "name", nullable = false)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "email", nullable = false)
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Column(name = "plan", nullable = false)
	public int getPlan() {
		return plan;
	}
	public void setPlan(int plan) {
		this.plan = plan;
	}
	
	@Column(name = "subscribeDate", nullable = false)
	public Date getSubscribeDate() {
		return subscribeDate;
	}

	public void setSubscribeDate(Date subscribeDate) {
		this.subscribeDate = subscribeDate;
	}

	@Override
	public String toString() {
		return "Employee [id=" + id + ", name=" + name + ", plan=" + plan + ", email=" + email
				+ "]";
	}
	
}
