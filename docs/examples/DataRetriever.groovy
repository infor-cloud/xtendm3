import java.time.LocalDate
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter
import java.time.format.DateTimeParseException

/*public class DataRetriveUtil extends ExtendM3Utility {
  public boolean sentInParameter(){
      if (x.isBlank() || x.isBlank()) {
      return
    }
  }
*/

public boolean isDateValid(int param) {
    date = param.toString()
    try {
      LocalDate.parse(date, DateTimeFormatter.ofPattern("yyyyMMDD"))
      return true
    } catch (DateTimeParseException e) {
      return false
    }
  }
}