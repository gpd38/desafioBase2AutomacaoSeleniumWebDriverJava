package com.javaseleniumtemplate.utils;

import org.apache.commons.io.FileUtils;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.testng.ITestResult;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class Utils {

    public static String getMethodNameByLevel(int level) {
        StackTraceElement[] stackTrace = new Throwable().getStackTrace();

        return stackTrace[level].getMethodName();
    }

    public static String getScreenshot(String name, String path) {
        File scrFile = ((TakesScreenshot) DriverFactory.INSTANCE).getScreenshotAs(OutputType.FILE);

        String filePathAndName = path + "/" + name + ".png";

        try {
            FileUtils.copyFile(scrFile, new File(filePathAndName));
        } catch (IOException e) {
            e.printStackTrace();
        }

        return filePathAndName;
    }

    public static String getAllStackTrace(ITestResult result) {
        String allStackTrace = "";

        for (StackTraceElement stackTrace : result.getThrowable().getStackTrace()) {
            allStackTrace = allStackTrace + "<br>" + stackTrace.toString();
        }

        return allStackTrace;
    }

    public static String getNowDate(String mask) {
        DateFormat dateFormat = new SimpleDateFormat(mask);
        Date date = new Date();
        return dateFormat.format(date);
    }

    public static String getFileContent(String filePath) {
        BufferedReader br = null;
        StringBuilder sb = null;
        try {
            br = new BufferedReader(new FileReader(filePath));
            sb = new StringBuilder();
            String line = br.readLine();

            while (line != null) {
                sb.append(line);
                sb.append("\n");
                line = br.readLine();
            }

            br.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return sb.toString();
    }

    public static String gerarNumerosAleatorios() {
        Random random = new Random();
        String result = "";
        int temp;

        for (int i = 1; i < 10; i++) {
            temp = random.nextInt(9);
            result += temp;
        }

        return result;
    }

}
