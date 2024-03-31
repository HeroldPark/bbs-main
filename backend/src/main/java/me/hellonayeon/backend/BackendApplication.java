package me.hellonayeon.backend;

import java.text.SimpleDateFormat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class BackendApplication {
    static Logger logger = (Logger) LoggerFactory.getLogger(BackendApplication.class);

    public static void main(String[] args) throws Exception {
        System.out.println("BackendApplication main() Start : " + new java.util.Date());

        SpringApplication.run(BackendApplication.class, args);

        BackendApplication example = new BackendApplication();
        example.Debug();
    }

    public void Debug(String... args) throws Exception {
        String currentTime = new String();
        long now = System.currentTimeMillis();
        currentTime = String.format("currentTime: %s", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(now));
        logger.debug(currentTime);

        logger.trace("trace -- Hello world.");
        logger.debug("debug -- Hello world.");
        logger.info("info -- 헬로우 월드.");
        logger.warn("warn -- Hello world.");
        logger.error("error -- Hello world.");
  }
}
