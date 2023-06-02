package com.bank;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public aspect Logger {
    pointcut success() : call(* create*(..) );
    after() : success() {
    	System.out.println("**** User created ****");
    }
    
    pointcut transactionMade() : call(* Bank.moneyMakeTransaction(..));
    after() : transactionMade() {
    	Calendar cal = Calendar.getInstance();
    	try(BufferedWriter bw = new BufferedWriter(new FileWriter("Log.txt", true))){
    		
    		bw.write("Transacción realizada " + cal.getTime());
    		bw.newLine();
    	}catch(IOException io) {
    		io.printStackTrace();
    	}
    }
}
