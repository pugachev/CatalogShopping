package util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropertiesFileReadUtil
{
	private String pname;
	Properties prop = new Properties();
	private StringBuilder rcvData = new StringBuilder();

	public PropertiesFileReadUtil(String name)
	{
		this.pname = name;

    	InputStream in = Thread.currentThread().getContextClassLoader().getResourceAsStream(pname);
		try
		{
    		prop.load(in);
		}catch(IOException iex)
		{
			iex.printStackTrace();
		}
    	rcvData.append(prop.getProperty("name")+",");
    	rcvData.append(prop.getProperty("age")+",");
    	rcvData.append(prop.getProperty("below"));
	}

	public String getData()
	{
		return rcvData.toString();
	}

}