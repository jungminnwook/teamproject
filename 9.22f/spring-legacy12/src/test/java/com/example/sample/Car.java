package com.example.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component // 스프링 빈 표시 (스피링화 되게 해주세요)
public class Car { // spring bean jsp

   @Autowired
   private Engine engine; // 업캐스팅 (다형성)

   // 빈 생성자
//   public Car() { }

//  // 생성자를 통해서 넣을땐 @Autowired 선언 안함
//  //setter를 통해서 넣을때 @Autowired를 넣어줘야함

//  @Autowired // 타입을 기준으로 스프링빈 안에서 의존객체를 찾아서 주입해줌
//   1) 생성자 
   public Car(Engine engine) {
      this.engine = engine;
   }

//   2) setter
//   @Autowired // 타입을 기준으로 스프링빈 안에서 의존 객체를 찾아서 주입해줌
   public void setEngine(Engine engine) {
      this.engine = engine;
   }

   public void drive() {
      engine.start();
   }
}