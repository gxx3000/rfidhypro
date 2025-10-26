package com.rfidhy;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 *
 * @author rooney
 */
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class RfidhyApplication {
    public static void main(String[] args) {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(RfidhyApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  RFIDHY启动成功   ლ(´ڡ`ლ)ﾞ  \n" +
                "██████╗ ███████╗██╗██████╗ ██╗  ██╗██╗   ██╗\n" +
                "██╔══██╗██╔════╝██║██╔══██╗██║  ██║╚██╗ ██╔╝\n" +
                "██████╔╝█████╗  ██║██║  ██║███████║ ╚████╔╝ \n" +
                "██╔══██╗██╔══╝  ██║██║  ██║██╔══██║  ╚██╔╝  \n" +
                "██║  ██║██║     ██║██████╔╝██║  ██║   ██║   \n" +
                "╚═╝  ╚═╝╚═╝     ╚═╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ");
    }
}
