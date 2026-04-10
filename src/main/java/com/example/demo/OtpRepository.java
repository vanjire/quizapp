package com.example.demo;

import org.springframework.data.jpa.repository.JpaRepository;

public interface OtpRepository extends JpaRepository<Otp,Long>{
Otp findByEmail(String email);
}
