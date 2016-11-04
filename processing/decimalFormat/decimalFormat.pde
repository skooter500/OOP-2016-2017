import java.text.*;

void setup()
{
  DecimalFormat df = new DecimalFormat("000000.0");
  println(df.format(1234567.1234567f));
}