package com.handy.utils.Excel;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Field;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 *
 * @param <T>
 */
public class ExcelExportUtil<T> {
    public void export(HttpServletResponse response, Map<String, Object> params) throws Exception {
        String classFilePath = (String) params.get("classFilePath");
        Integer styleIndex = (Integer) params.get("styleIndex");
        Integer rowIndex = (Integer) params.get("rowIndex");
        List<T> objs = (List<T>) params.get("objs");
        String fileName = (String) params.get("fileName");
        Workbook workbook = new XSSFWorkbook(Objects.requireNonNull(ExcelExportUtil.class.getClassLoader().getResourceAsStream(classFilePath)));
        Sheet sheet = workbook.getSheetAt(0);
        Row row1 = sheet.getRow(styleIndex);
        CellStyle[] cellStyles = new CellStyle[row1.getLastCellNum()];
        for (int i = 0; i < cellStyles.length; i++) {
            cellStyles[i] = row1.getCell(i).getCellStyle();
        }
        for (int i = 0; i < objs.size(); i++) {
            Row row = sheet.createRow(i + rowIndex);
            T t = objs.get(i);
            for (int j = 0; j < cellStyles.length; j++) {
                Cell cell = row.createCell(j);
                cell.setCellStyle(cellStyles[j]);
                Class<?> clazz = t.getClass();
                Field[] fields = clazz.getDeclaredFields();
                for (Field field : fields) {
                    if (field.isAnnotationPresent(ExcelAttribute.class)) {
                        field.setAccessible(true);
                        ExcelAttribute excelAttribute = field.getAnnotation(ExcelAttribute.class);
                        if (j == excelAttribute.sort()) {
                            cell.setCellValue(field.get(t).toString());
                        }
                    }
                }
            }
        }
        fileName = URLEncoder.encode(fileName, "UTF-8");
        response.setContentType("application/octet-stream");
        response.setHeader("content-disposition", "attachment;filename=" + fileName);
        response.setHeader("filename", fileName);
        workbook.write(response.getOutputStream());
    }
}
