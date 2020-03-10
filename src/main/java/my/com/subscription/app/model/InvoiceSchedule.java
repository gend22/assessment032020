package my.com.subscription.app.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "invoice_schedule")
public class InvoiceSchedule {

	private long id;
	private User user;
	private Date invoiceDate;
	private boolean isSend;
	
	public InvoiceSchedule() {
		
	}
	
	public InvoiceSchedule(User user, Date invoiceDate, boolean isSend) {
		this.user = user;
		this.invoiceDate = invoiceDate;
		this.isSend = isSend;
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	@ManyToOne
    @JoinColumn(name="userId", nullable=false)
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@Column(name = "invoiceDate", nullable = false)
	public Date getInvoiceDate() {
		return invoiceDate;
	}
	public void setInvoiceDate(Date invoiceDate) {
		this.invoiceDate = invoiceDate;
	}
	
	@Column(name = "isSend", nullable = false)
	public boolean getIsSend() {
		return isSend;
	}

	public void setIsSend(boolean isSend) {
		this.isSend = isSend;
	}

	@Override
	public String toString() {
		return "InvoiceSchedule [id=" + id + ", user=" + user.getId() + ", invoiceDate=" + invoiceDate
				+ "]";
	}
	
}
