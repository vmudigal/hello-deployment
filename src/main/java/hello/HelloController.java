package hello;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
public class HelloController {
    
    @RequestMapping("/")
    public String hello() {
        return "Hello!!";
    }
    
    @RequestMapping("/vi")
    public String helloVi() {
        return "Hello from Vijayendra Mudigal!!";
    }
   
}
