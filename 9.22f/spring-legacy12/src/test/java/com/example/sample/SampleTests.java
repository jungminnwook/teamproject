package com.example.sample;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class) // 스프링이랑 연동 @Component 계열 애노테이션에 해당함
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

// <context:component-scan base-package="com.example.sample" /> 이거 때문에 위에꺼 씀
public class SampleTests {

   private Car car;

   @Autowired
   public void setCar(Car car) {
      this.car = car;
   }

   @Test
   public void testExist() {
      assertNotNull(car);

      car.drive();
   }

   @Test
   public void testMap() {
      Map<String, Car> map = new HashMap<String, Car>();

      map.put("현대자동차", new Car(new HyundaiEngine()));
      map.put("포드자동차", new Car(new FordEngine()));
      map.put("도요타자동차", new Car(new ToyotaEngine()));

      Car hyundaiCar = map.get("현대자동차");
      hyundaiCar.drive();

      Car forde = map.get("포드자동차");
      forde.drive();

      Car doyo = map.get("도요타자동차");
      doyo.drive();
      
      Car kiacar = map.get("기아자동차");
      assertNull(kiacar);

   }

}