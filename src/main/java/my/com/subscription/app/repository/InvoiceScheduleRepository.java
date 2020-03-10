package my.com.subscription.app.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import my.com.subscription.app.model.InvoiceSchedule;

@Repository
public interface InvoiceScheduleRepository extends JpaRepository<InvoiceSchedule, Long>{
	
	@Query("SELECT i FROM InvoiceSchedule i WHERE i.user.id = ?1")
    List<InvoiceSchedule> findAllByUserId(long userId);

	@Query("SELECT i FROM InvoiceSchedule i WHERE Date(i.invoiceDate) = date(now())")
	List<InvoiceSchedule> findAllByTodayDate();
}
