package com.javaseleniumtemplate.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.io.FileUtils;
//import org.apache.poi.hssf.usermodel.HSSFSheet;
//import org.apache.poi.hssf.usermodel.HSSFWorkbook;
//import org.apache.poi.ss.usermodel.Cell;
//import org.apache.poi.ss.usermodel.Row;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.testng.ITestResult;

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

//	public static Iterator<Row> DataDriven(String _filePath) {
//		FileInputStream file = null;
//		HSSFWorkbook workBook = null;
//		HSSFSheet sheet = null;
//		Iterator<Row> rows = null;
//		Iterator<Cell> cells = null;
//		Row row = null;
//		Cell cell = null;
//
//		try {
//			file = new FileInputStream(_filePath);
//			try {
//				workBook = new HSSFWorkbook(file);
//				// Escolhendo a aba ZERO da planilha
//				sheet = workBook.getSheetAt(0);
//				// Armazena todas as linhas da planilha
//				rows = sheet.iterator();
//				while (rows.hasNext()) {
//					// Armazena uma linha para ser trabalhada
//					row = rows.next();
//					// Percorre as celulas
//					cells = row.iterator();
//					while (cells.hasNext()) {
//						cell = cells.next();
//						System.out.println(cell.getStringCellValue());
//					}
//				}
//				workBook.close();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		} catch (FileNotFoundException e) {
//			e.printStackTrace();
//		}
//		return rows;
//	}
}
