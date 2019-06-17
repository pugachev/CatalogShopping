package util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;


public class ReadProperties {
	private static ReadProperties inst = new ReadProperties();
	private static final String PRPFNAME = "test.properties";


	private Properties prop;

	private ReadProperties(){
		prop = new Properties();

                //1）本クラスが実行されているWebアプリケーションのクラスローダを使う
            	InputStream in = Thread.currentThread().getContextClassLoader().getResourceAsStream(PRPFNAME);
		try{
            		prop.load(in);
		}catch(IOException iex){
			iex.printStackTrace();
		}
	}

	public static String getProperty(String key){
		System.out.println(" >>> getProperty= "+inst.prop.getProperty(key));
		return inst.prop.getProperty(key);
	}


}
