package com.example.demo;

import org.springframework.data.jpa.repository.JpaRepository;

public interface adminRepository extends JpaRepository<admin,Long> {
	admin findByUsernameAndPassword(String username,String password);
}
