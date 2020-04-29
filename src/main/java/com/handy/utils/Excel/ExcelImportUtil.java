package com.handy.utils.Excel;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.InputStream;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @param <T>
 */
public class ExcelImportUtil<T> {
    public List<T> excelImportUtil(InputStream is,Class<T> clazz,int rowIndex)
            throws Exception {
        //创建workbook工作簿
        Workbook workbook = new XSSFWorkbook(is);
        // 获取sheet 从0开始
        Sheet sheet = workbook.getSheetAt(0);
        //获得最后一行
        int lastRowNum = sheet.getLastRowNum();
        List<T> list = new ArrayList<>();
        for (int i = rowIndex; i <= lastRowNum; i++) {
            Row row = sheet.getRow(i);
            // 在一行中获得最后一列
            short lastCellNum = row.getLastCellNum();
            Object[] objs = new Object[lastCellNum];
            T t = clazz.newInstance();
            Field[] fields = clazz.getDeclaredFields();
            for (int j = 0; j < lastCellNum; j++) {
                Cell cell = row.getCell(j);
                Object value = ExcelUtils.getValue(cell);
                objs[j] = value;
            }
            for (int j = 0; j < lastCellNum; j++) {
                for (Field field : fields) {
                    field.setAccessible(true);
                    if(field.isAnnotationPresent(ExcelAttribute.class)){
                        ExcelAttribute excelAttribute =
                                field.getAnnotation(ExcelAttribute.class);
                        int sort = excelAttribute.sort();
                        if(j==sort){
                            // todo:类型，根据需要添加
                            if(objs[j] instanceof Double){
                                // employee.setAge(((Double) objs[3]).intValue());
                                field.set(t,((Double) objs[j]).intValue());
                            }else{
                                field.set(t,objs[j]);
                            }

                        }
                    }
                }
            }
            list.add(t);
        }
        return list;
    }
}