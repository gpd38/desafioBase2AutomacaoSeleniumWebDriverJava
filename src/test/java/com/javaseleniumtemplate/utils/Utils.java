package com.javaseleniumtemplate.utils;

import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.testng.ITestResult;

import java.io.*;
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
        BufferedReader br;
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

    FileInputStream file;
    HSSFWorkbook workBook;
    HSSFSheet sheet;
    HSSFRow row;
    HSSFCell cell;
    String value;

    public int getRowCount(String path) throws IOException {
        file = new FileInputStream(path);
        workBook = new HSSFWorkbook(file);
        sheet = workBook.getSheetAt(0);
        int rowcount = sheet.getLastRowNum();
        workBook.close();
        file.close();

        return rowcount;
    }

    public int getCellCount(String path, int rownum) throws IOException {
        file = new FileInputStream(path);
        workBook = new HSSFWorkbook(file);
        sheet = workBook.getSheetAt(0);
        row = sheet.getRow(rownum);
        int cellcount = row.getLastCellNum();
        workBook.close();
        file.close();

        return cellcount;
    }

    public String getCellData(String path, int rownum, int colnum) throws IOException {
        file = new FileInputStream(path);
        workBook = new HSSFWorkbook(file);
        sheet = workBook.getSheetAt(0);
        row = sheet.getRow(rownum);
        cell = row.getCell(colnum);

        DataFormatter formatter = new DataFormatter();
        String data = formatter.formatCellValue(cell);

        workBook.close();
        file.close();

        return data;
    }

}
