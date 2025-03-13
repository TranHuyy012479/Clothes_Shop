
package Validation;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author tranh
 */
public class Validation {
    
    
    public String normalize(String s){
        String result = "";
        String word[] = s.toLowerCase().trim().split("\\s+");
        for (String string : word) {
            result+= string.toUpperCase().charAt(0)+string.substring(1) +" ";
        }
        return result.trim();
    }
    
    public String convertDateFormat(String date) {
        SimpleDateFormat inputFormat = new SimpleDateFormat("MM/dd/yyyy");
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");

        String formattedDate = null;
        try {
            Date parsedDate = inputFormat.parse(date);
            formattedDate = outputFormat.format(parsedDate);
        } catch (ParseException e) {
            System.out.println("Lỗi định dạng ngày: " + e.getMessage());
        }
        return formattedDate;
    }
    
    public String getCurrentDateTime() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
        Date now = new Date();
        return dateFormat.format(now);
    }
}
