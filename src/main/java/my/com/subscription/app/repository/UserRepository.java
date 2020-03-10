package my.com.subscription.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import my.com.subscription.app.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long>{
}
